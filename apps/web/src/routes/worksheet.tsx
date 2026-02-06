/* eslint-disable react-refresh/only-export-components */
import {
  useLoaderData,
  useSearchParams,
  Link,
  redirect,
} from "react-router";
import { useState, useMemo } from "react";
import { getCategories, getTags } from "@/api/client";
import { type Difficulty } from "@/api";
import { queryClient, queryKeys } from "@/lib/queryClient";
import {
  Download,
  Loader2,
  Home,
  ChevronRight,
  Eye,
  EyeOff,
  ArrowLeft,
  Filter,
  X,
  Check,
  Tag,
  Zap,
} from "lucide-react";
import DifficultyFilter from "@/components/DifficultyFilter";
import { Pagination } from "@/components/Pagination";
import { renderMathExpression } from "@/utils/mathRenderer";
import { usePDFGenerator, useProblemsQuery } from "@/hooks";
import {
  getProblemType,
  buildTypeMap,
  setCachedTypeMap,
  toSlug,
} from "@/utils/routing";
import { getCategoryTheme } from "@/config";
import { type CategoryInfo } from "@/api/types";

// Type for loader data
type LoaderData = Awaited<ReturnType<typeof clientLoader>>;

const PAGE_SIZE = 20;

// CLIENT LOADER - Fetches categories and tags (static data)
// Problems are now fetched via useProblemsQuery hook with pagination
export async function clientLoader({
  params,
  request,
}: {
  params: { category: string; subcategory: string };
  request: Request;
}) {
  const { category, subcategory } = params;
  const url = new URL(request.url);

  // Get filters from URL search params
  const difficultyParam = url.searchParams.get("difficulty");
  const tagsParam = url.searchParams.get("tags");

  // Ensure categories are in TanStack Query cache
  await queryClient.prefetchQuery({
    queryKey: queryKeys.categories,
    queryFn: getCategories,
  });

  // Get categories from cache and build TYPE_MAP
  const categories = queryClient.getQueryData<CategoryInfo[]>(
    queryKeys.categories,
  );

  if (!categories) {
    throw redirect("/");
  }

  const typeMap = buildTypeMap(categories);
  setCachedTypeMap(typeMap);

  // Get problem type using the dynamic map
  const problemType = getProblemType(category, subcategory, typeMap);

  if (!problemType) {
    throw redirect("/");
  }

  // Find the display names from categories
  const categoryInfo = categories.find(
    (cat) =>
      toSlug(cat.mainCategory) === category &&
      toSlug(cat.subCategory) === subcategory,
  );

  // Parse filters (default to EASY if no difficulty specified)
  const difficulty = difficultyParam
    ? (difficultyParam.split(",") as Difficulty[])
    : ["EASY" as Difficulty];

  const tags = tagsParam ? tagsParam.split(",") : [];

  // Fetch tags (static data that doesn't change with pagination)
  const availableTags = await getTags(problemType);

  return {
    category,
    subcategory,
    categoryDisplay:
      categoryInfo?.mainCategory ??
      category.charAt(0).toUpperCase() + category.slice(1).replace(/-/g, " "),
    subcategoryDisplay:
      categoryInfo?.subCategory ??
      subcategory.charAt(0).toUpperCase() +
        subcategory.slice(1).replace(/-/g, " "),
    problemType,
    availableTags,
    appliedFilters: {
      difficulty,
      tags,
    },
  };
}

// LOADING FALLBACK
export function HydrateFallback() {
  return (
    <div className="min-h-screen p-8">
      <div className="max-w-6xl mx-auto">
        <div className="flex items-center justify-center gap-3 py-24">
          <Loader2 className="w-8 h-8 animate-spin text-teal-500" />
          <p className="text-slate-500 font-medium">Loading problems...</p>
        </div>
      </div>
    </div>
  );
}

// Difficulty badge colors
const difficultyColors: Record<
  Difficulty,
  { bg: string; text: string; dot: string }
> = {
  EASY: {
    bg: "bg-[#10b981]/10",
    text: "text-[#059669]",
    dot: "bg-[#10b981]",
  },
  MEDIUM: {
    bg: "bg-amber-500/10",
    text: "text-[#d97706]",
    dot: "bg-amber-500",
  },
  HARD: {
    bg: "bg-[#ef4444]/10",
    text: "text-[#dc2626]",
    dot: "bg-[#ef4444]",
  },
};

// COMPONENT
export default function Worksheet() {
  const {
    category,
    subcategory,
    categoryDisplay,
    subcategoryDisplay,
    problemType,
    availableTags,
    appliedFilters,
  } = useLoaderData<LoaderData>();

  const theme = getCategoryTheme(categoryDisplay);
  const [searchParams, setSearchParams] = useSearchParams();

  // Get current page from URL (default: 1)
  const currentPage = parseInt(searchParams.get("page") ?? "1", 10);

  // Fetch problems with pagination via TanStack Query
  const {
    problems,
    total,
    totalPages,
    isLoading,
    isFetching,
    isPlaceholderData,
  } = useProblemsQuery({
    type: problemType,
    difficulty: appliedFilters.difficulty,
    tags: appliedFilters.tags.length > 0 ? appliedFilters.tags : undefined,
    page: currentPage,
    pageSize: PAGE_SIZE,
  });

  // Staged filters (not yet applied to URL)
  const [stagedDifficulties, setStagedDifficulties] = useState<Difficulty[]>(
    appliedFilters.difficulty,
  );
  const [stagedTags, setStagedTags] = useState<string[]>(appliedFilters.tags);
  const [prevAppliedFilters, setPrevAppliedFilters] = useState(appliedFilters);
  const [answerKeyOpen, setAnswerKeyOpen] = useState(false);
  const [filterPanelOpen, setFilterPanelOpen] = useState(false);

  // Reset staged filters when URL changes (React 18+ pattern: adjust state during render)
  // This avoids the useEffect cascading re-render anti-pattern
  if (prevAppliedFilters !== appliedFilters) {
    setPrevAppliedFilters(appliedFilters);
    setStagedDifficulties(appliedFilters.difficulty);
    setStagedTags(appliedFilters.tags);
  }

  // PDF generation
  const {
    generating: generatingPDF,
    error: pdfError,
    generatePDF,
  } = usePDFGenerator();

  // Detect unapplied changes
  const hasUnappliedChanges = useMemo(() => {
    const diffChanged =
      JSON.stringify([...stagedDifficulties].sort()) !==
      JSON.stringify([...appliedFilters.difficulty].sort());
    const tagsChanged =
      JSON.stringify([...stagedTags].sort()) !==
      JSON.stringify([...appliedFilters.tags].sort());
    return diffChanged || tagsChanged;
  }, [
    stagedDifficulties,
    appliedFilters.difficulty,
    stagedTags,
    appliedFilters.tags,
  ]);

  // Handle page change
  const handlePageChange = (page: number): void => {
    const params = new URLSearchParams(searchParams);
    if (page === 1) {
      params.delete("page");
    } else {
      params.set("page", page.toString());
    }
    setSearchParams(params);
  };

  // Apply filters by updating URL (resets to page 1)
  const applyFilters = (): void => {
    const params = new URLSearchParams();

    if (stagedDifficulties.length > 0) {
      params.set("difficulty", stagedDifficulties.join(","));
    }

    if (stagedTags.length > 0) {
      params.set("tags", stagedTags.join(","));
    }

    // Reset to page 1 when filters change
    setSearchParams(params);
    setFilterPanelOpen(false);
  };

  // Clear filters (resets to page 1)
  const clearFilters = (): void => {
    setStagedDifficulties([]);
    setStagedTags([]);
    setSearchParams({});
  };

  // Toggle difficulty
  const toggleDifficulty = (difficulty: Difficulty): void => {
    setStagedDifficulties((prev) =>
      prev.includes(difficulty)
        ? prev.filter((d) => d !== difficulty)
        : [...prev, difficulty],
    );
  };

  // Toggle tag
  const toggleTag = (tag: string): void => {
    setStagedTags((prev) =>
      prev.includes(tag) ? prev.filter((t) => t !== tag) : [...prev, tag],
    );
  };

  // PDF download
  const handleDownloadPDF = async (): Promise<void> => {
    if (!problems || problems.length === 0) return;

    const title = `${categoryDisplay} - ${subcategoryDisplay}`;
    const filename = `${category}-${subcategory}-worksheet.pdf`;

    await generatePDF(title, problems, filename);
  };

  // Count active filters
  const activeFilterCount =
    appliedFilters.difficulty.length + appliedFilters.tags.length;

  // Calculate problem number offset for current page
  const problemNumberOffset = (currentPage - 1) * PAGE_SIZE;

  return (
    <div className="min-h-screen print:bg-white">
      {/* Header Section */}
      <div className="bg-linear-to-b from-slate-100 to-cream border-b border-slate-200 print:hidden">
        <div className="max-w-6xl mx-auto px-8 py-6">
          {/* Breadcrumb */}
          <nav className="flex items-center gap-2 text-sm mb-4 animate-fade-in-up">
            <Link
              to="/"
              className="flex items-center gap-1.5 text-slate-500 hover:text-teal-600 transition-colors"
            >
              <Home className="w-4 h-4" />
              <span>Home</span>
            </Link>
            <ChevronRight className="w-4 h-4 text-slate-400" />
            <Link
              to={`/${category}`}
              className={`${theme.textAccent} hover:opacity-80 transition-opacity`}
            >
              {categoryDisplay}
            </Link>
            <ChevronRight className="w-4 h-4 text-slate-400" />
            <span className={`font-medium ${theme.textAccent}`}>
              {subcategoryDisplay}
            </span>
          </nav>

          {/* Title Row */}
          <div className="flex flex-col md:flex-row md:items-center md:justify-between gap-4 animate-fade-in-up delay-100">
            <div>
              <h1 className="font-heading text-2xl md:text-3xl font-bold text-slate-800">
                {subcategoryDisplay}
              </h1>
              <p className="text-slate-500 mt-1">
                {isLoading ? (
                  "Loading..."
                ) : (
                  <>
                    Showing {problems.length} of {total} problems
                    {totalPages > 1 &&
                      ` (page ${currentPage} of ${totalPages})`}
                  </>
                )}
              </p>
            </div>

            {/* Action Buttons */}
            <div className="flex items-center gap-3">
              {/* Filter Toggle */}
              <button
                onClick={() => setFilterPanelOpen(!filterPanelOpen)}
                className={`inline-flex items-center gap-2 px-4 py-2.5 rounded-xl font-medium transition-all ${
                  filterPanelOpen
                    ? "bg-teal-500 text-white"
                    : "bg-white border border-slate-200 text-slate-700 hover:border-slate-300"
                }`}
              >
                <Filter className="w-4 h-4" />
                <span>Filters</span>
                {activeFilterCount > 0 && (
                  <span
                    className={`px-2 py-0.5 rounded-full text-xs font-bold ${
                      filterPanelOpen
                        ? "bg-white/20 text-white"
                        : "bg-teal-500 text-white"
                    }`}
                  >
                    {activeFilterCount}
                  </span>
                )}
              </button>

              {/* Answer Key Toggle */}
              <button
                onClick={() => setAnswerKeyOpen(!answerKeyOpen)}
                className={`inline-flex items-center gap-2 px-4 py-2.5 rounded-xl font-medium transition-all ${
                  answerKeyOpen
                    ? "bg-amber-500 text-white"
                    : "bg-white border border-slate-200 text-slate-700 hover:border-slate-300"
                }`}
              >
                {answerKeyOpen ? (
                  <EyeOff className="w-4 h-4" />
                ) : (
                  <Eye className="w-4 h-4" />
                )}
                <span className="hidden sm:inline">
                  {answerKeyOpen ? "Hide" : "Show"} Answers
                </span>
              </button>

              {/* Download PDF */}
              {problems.length > 0 && (
                <button
                  aria-label="Download PDF"
                  onClick={handleDownloadPDF}
                  disabled={generatingPDF}
                  className="btn btn-primary disabled:opacity-50 disabled:cursor-not-allowed"
                >
                  {generatingPDF ? (
                    <>
                      <Loader2 className="w-4 h-4 animate-spin" />
                      <span className="hidden sm:inline">Generating...</span>
                    </>
                  ) : (
                    <>
                      <Download className="w-4 h-4" />
                      <span className="hidden sm:inline">Download PDF</span>
                    </>
                  )}
                </button>
              )}
            </div>
          </div>
        </div>
      </div>

      {/* Filter Panel (Collapsible) */}
      {filterPanelOpen && (
        <div className="bg-white border-b border-slate-200 print:hidden animate-fade-in-up">
          <div className="max-w-6xl mx-auto px-8 py-6">
            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
              {/* Difficulty Filter */}
              <div>
                <h3 className="flex items-center gap-2 text-sm font-semibold text-slate-700 mb-3">
                  <Zap className="w-4 h-4" />
                  Difficulty Level
                </h3>
                <DifficultyFilter
                  selectedSubCategory={subcategory}
                  stagedDifficulties={stagedDifficulties}
                  toggleDifficulty={toggleDifficulty}
                />
              </div>

              {/* Tag Filters */}
              {availableTags.length > 0 && (
                <div>
                  <h3 className="flex items-center gap-2 text-sm font-semibold text-slate-700 mb-3">
                    <Tag className="w-4 h-4" />
                    Filter by Tags
                  </h3>
                  <div className="space-y-2 max-h-48 overflow-y-auto p-4 bg-slate-50 rounded-xl border border-slate-200">
                    {availableTags.map((tag) => (
                      <label
                        key={tag}
                        htmlFor={`tag-${tag}`}
                        className="flex items-center gap-3 cursor-pointer hover:bg-white p-2 rounded-lg transition"
                      >
                        <input
                          type="checkbox"
                          id={`tag-${tag}`}
                          checked={stagedTags.includes(tag)}
                          onChange={() => toggleTag(tag)}
                          aria-label={`Filter by tag: ${tag}`}
                        />
                        <span className="text-sm text-slate-700">{tag}</span>
                      </label>
                    ))}
                  </div>
                </div>
              )}

              {/* Action Buttons */}
              <div className="flex flex-col justify-end gap-3">
                <button
                  onClick={applyFilters}
                  disabled={!hasUnappliedChanges}
                  className={`w-full inline-flex items-center justify-center gap-2 px-4 py-3 rounded-xl font-semibold transition-all ${
                    hasUnappliedChanges
                      ? "bg-teal-500 hover:bg-teal-600 text-white shadow-md"
                      : "bg-slate-100 text-slate-400 cursor-not-allowed"
                  }`}
                >
                  <Check className="w-4 h-4" />
                  Apply Filters
                  {hasUnappliedChanges && (
                    <span className="px-2 py-0.5 rounded-full bg-white/20 text-xs">
                      Changed
                    </span>
                  )}
                </button>
                <button
                  onClick={clearFilters}
                  disabled={
                    stagedDifficulties.length === 0 && stagedTags.length === 0
                  }
                  className={`w-full inline-flex items-center justify-center gap-2 px-4 py-3 rounded-xl font-semibold transition-all ${
                    stagedDifficulties.length > 0 || stagedTags.length > 0
                      ? "bg-slate-100 hover:bg-slate-200 text-slate-700"
                      : "bg-slate-50 text-slate-400 cursor-not-allowed"
                  }`}
                >
                  <X className="w-4 h-4" />
                  Clear All
                </button>
              </div>
            </div>
          </div>
        </div>
      )}

      {/* PDF Error */}
      {pdfError && (
        <div className="max-w-6xl mx-auto px-8 pt-6 print:hidden">
          <div className="flex items-start gap-3 p-4 rounded-xl bg-[#fef2f2] border border-[#fecaca] text-[#dc2626]">
            <X className="w-5 h-5 mt-0.5" />
            <div>
              <p className="font-semibold">Error generating PDF</p>
              <p className="text-sm opacity-80">{pdfError}</p>
            </div>
          </div>
        </div>
      )}

      {/* Main Content */}
      <div className="max-w-6xl mx-auto px-8 py-8 print:px-0 print:py-0">
        {/* Print header with metadata */}
        <div className="hidden print:block mb-8">
          <h2 className="text-2xl font-bold text-center mb-4 print:text-black">
            {categoryDisplay} - {subcategoryDisplay}
          </h2>
          <div className="flex justify-between items-center text-sm mb-4 border-b border-gray-300 pb-2 print:text-black">
            <div>
              <span className="font-semibold">Name:</span>{" "}
              ___________________________
            </div>
            <div>
              <span className="font-semibold">Date:</span> _______________
            </div>
            <div>
              <span className="font-semibold">Problems:</span> {problems.length}
            </div>
          </div>
        </div>

        {/* Loading State */}
        {isLoading ? (
          <div className="flex items-center justify-center gap-3 py-24">
            <Loader2 className="w-8 h-8 animate-spin text-teal-500" />
            <p className="text-slate-500 font-medium">Loading problems...</p>
          </div>
        ) : problems.length > 0 ? (
          <div
            className={`animate-fade-in-up ${isPlaceholderData ? "opacity-60" : ""}`}
          >
            <ol className="grid grid-cols-1 md:grid-cols-2 gap-4 print:grid-cols-2 print:gap-3">
              {problems.map((problem, index) => (
                <li
                  key={problem.id}
                  className="group relative p-5 bg-white rounded-2xl border border-slate-200 hover:border-slate-300 hover:shadow-sm transition-all print:p-3 print:rounded-none print:border print:border-gray-300"
                  style={{ animationDelay: `${index * 30}ms` }}
                >
                  {/* Problem number (with page offset) */}
                  <span className="absolute top-3 left-3 text-xs font-heading font-bold text-slate-400 print:static print:text-black print:text-sm print:mr-2">
                    {String(problemNumberOffset + index + 1).padStart(2, "0")}
                  </span>

                  {/* Problem content */}
                  <div className="pl-8 print:pl-0 print:inline">
                    <span className="font-math text-lg text-slate-800 print:text-black">
                      {categoryDisplay === "Fractions" ? (
                        <>
                          {renderMathExpression(problem.question + " = ")}
                          {answerKeyOpen && (
                            <span className="text-teal-600 font-semibold print:hidden">
                              {renderMathExpression(problem.answer)}
                            </span>
                          )}
                        </>
                      ) : (
                        <>
                          {problem.question + " = "}
                          {answerKeyOpen && (
                            <span className="text-teal-600 font-semibold print:hidden">
                              {problem.answer}
                            </span>
                          )}
                        </>
                      )}
                    </span>
                  </div>

                  {/* Difficulty badge (hidden on print) */}
                  {problem.difficulty && (
                    <div
                      className={`absolute top-3 right-3 flex items-center gap-1.5 px-2 py-1 rounded-lg text-xs font-semibold print:hidden ${
                        difficultyColors[problem.difficulty as Difficulty]?.bg
                      } ${
                        difficultyColors[problem.difficulty as Difficulty]?.text
                      }`}
                    >
                      <div
                        className={`w-1.5 h-1.5 rounded-full ${
                          difficultyColors[problem.difficulty as Difficulty]
                            ?.dot
                        }`}
                      />
                      {problem.difficulty.charAt(0) +
                        problem.difficulty.slice(1).toLowerCase()}
                    </div>
                  )}
                </li>
              ))}
            </ol>

            {/* Pagination */}
            {totalPages > 1 && (
              <div className="mt-8 print:hidden">
                <Pagination
                  currentPage={currentPage}
                  totalPages={totalPages}
                  onPageChange={handlePageChange}
                  isLoading={isFetching && isPlaceholderData}
                />
              </div>
            )}

            {/* Bottom Actions */}
            <div className="mt-10 flex items-center justify-between print:hidden">
              <Link
                to={`/${category}`}
                className="inline-flex items-center gap-2 px-5 py-3 rounded-xl bg-slate-100 hover:bg-slate-200 text-slate-700 font-medium transition-colors"
              >
                <ArrowLeft className="w-4 h-4" />
                <span>Back to {categoryDisplay}</span>
              </Link>
            </div>
          </div>
        ) : (
          <div className="text-center py-16 animate-fade-in-up">
            <div className="w-16 h-16 rounded-2xl bg-slate-100 flex items-center justify-center mx-auto mb-4">
              <Filter className="w-8 h-8 text-slate-400" />
            </div>
            <h3 className="font-heading text-xl font-bold text-slate-800 mb-2">
              No problems found
            </h3>
            <p className="text-slate-500 mb-6">
              Try adjusting your filters to see more problems
            </p>
            <button onClick={clearFilters} className="btn btn-primary">
              Clear Filters
            </button>
          </div>
        )}
      </div>
    </div>
  );
}
