import { useLoaderData, useNavigate, useSearchParams, Link, redirect } from 'react-router';
import { useState, useMemo } from 'react';
import { getCategories, getProblems, getTags } from '@/api/client';
import { type Difficulty } from '@/api';
import { Download, Loader2 } from 'lucide-react';
import DifficultyFilter from '@/components/DifficultyFilter';
import { renderMathExpression } from '@/utils/mathRenderer';
import { usePDFGenerator } from '@/hooks';
import { getProblemType, getCachedTypeMap, buildTypeMap, setCachedTypeMap } from '@/utils/routing';
import { PrintableWorksheet } from '@/components/PrintableWorksheet';

// Type for loader data
type LoaderData = Awaited<ReturnType<typeof clientLoader>>;

// CLIENT LOADER - Fetch problems and tags
export async function clientLoader({
  params,
  request
}: {
  params: { category: string; subcategory: string };
  request: Request;
}) {
  const { category, subcategory } = params;
  const url = new URL(request.url);

  // Get filters from URL search params
  const difficultyParam = url.searchParams.get('difficulty');
  const tagsParam = url.searchParams.get('tags');
  const limitParam = url.searchParams.get('limit');

  // Try to use cached typeMap, otherwise fetch and build
  let typeMap = getCachedTypeMap();

  if (!typeMap) {
    // Cache miss - fetch and build TYPE_MAP
    const categories = await getCategories();
    typeMap = buildTypeMap(categories);
    setCachedTypeMap(typeMap);
  }

  // Get problem type using the dynamic map
  const problemType = getProblemType(category, subcategory, typeMap);

  if (!problemType) {
    throw redirect('/');
  }

  // Parse filters
  const difficulty = difficultyParam
    ? difficultyParam.split(',') as Difficulty[]
    : [];

  const tags = tagsParam
    ? tagsParam.split(',')
    : [];

  const limit = limitParam ? parseInt(limitParam, 10) : 30;

  // Fetch data in parallel
  const [problems, availableTags] = await Promise.all([
    getProblems({
      type: problemType,
      difficulty: difficulty.length > 0 ? difficulty : undefined,
      tags: tags.length > 0 ? tags : undefined,
      limit,
    }),
    getTags(problemType),
  ]);

  return {
    category,
    subcategory,
    categoryDisplay: category.charAt(0).toUpperCase() + category.slice(1).replace(/-/g, ' '),
    subcategoryDisplay: subcategory.charAt(0).toUpperCase() + subcategory.slice(1).replace(/-/g, ' '),
    problemType,
    problems,
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
    <div className="w-full max-w-5xl bg-white rounded-xl shadow-lg p-8">
      <div className="flex items-center gap-3">
        <Loader2 className="w-6 h-6 animate-spin text-blue-900" />
        <p className="text-blue-900">Loading worksheet...</p>
      </div>
    </div>
  );
}

// COMPONENT
export default function Worksheet() {
  const {
    category,
    subcategory,
    categoryDisplay,
    subcategoryDisplay,
    problems,
    availableTags,
    appliedFilters,
  } = useLoaderData<LoaderData>();

  const navigate = useNavigate();
  const [searchParams, setSearchParams] = useSearchParams();

  // Staged filters (not yet applied to URL)
  const [stagedDifficulties, setStagedDifficulties] = useState<Difficulty[]>(
    appliedFilters.difficulty
  );
  const [stagedTags, setStagedTags] = useState<string[]>(appliedFilters.tags);
  const [answerKeyOpen, setAnswerKeyOpen] = useState(false);

  // PDF generation
  const { generating: generatingPDF, error: pdfError, generatePDF } = usePDFGenerator();

  // Detect unapplied changes
  const hasUnappliedChanges = useMemo(() => {
    const diffChanged =
      JSON.stringify([...stagedDifficulties].sort()) !==
      JSON.stringify([...appliedFilters.difficulty].sort());
    const tagsChanged =
      JSON.stringify([...stagedTags].sort()) !==
      JSON.stringify([...appliedFilters.tags].sort());
    return diffChanged || tagsChanged;
  }, [stagedDifficulties, appliedFilters.difficulty, stagedTags, appliedFilters.tags]);

  // Apply filters by updating URL
  const applyFilters = (): void => {
    const params = new URLSearchParams();

    if (stagedDifficulties.length > 0) {
      params.set('difficulty', stagedDifficulties.join(','));
    }

    if (stagedTags.length > 0) {
      params.set('tags', stagedTags.join(','));
    }

    setSearchParams(params);
  };

  // Clear filters
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
        : [...prev, difficulty]
    );
  };

  // Toggle tag
  const toggleTag = (tag: string): void => {
    setStagedTags((prev) =>
      prev.includes(tag) ? prev.filter((t) => t !== tag) : [...prev, tag]
    );
  };

  // PDF download
  const handleDownloadPDF = async (): Promise<void> => {
    if (!problems) return;

    const title = `${categoryDisplay} - ${subcategoryDisplay}`;
    const filename = `${category}-${subcategory}-worksheet.pdf`;

    const document = (
      <PrintableWorksheet
        title={title}
        problems={problems}
      />
    );

    await generatePDF(document, filename);
  };

  return (
    <div className="w-full max-w-5xl bg-white rounded-xl shadow-lg flex flex-col md:flex-row overflow-hidden print:shadow-none print:bg-white">
      {/* Sidebar: Filters */}
      <aside className="md:w-1/3 border-r border-blue-100 bg-blue-50 px-6 py-6 print:hidden">
        {/* Breadcrumb */}
        <nav className="mb-4 text-sm text-blue-600">
          <Link to="/" className="hover:underline">Home</Link>
          <span className="mx-2">/</span>
          <Link to={`/${category}`} className="hover:underline">
            {categoryDisplay}
          </Link>
          <span className="mx-2">/</span>
          <span className="text-blue-900">{subcategoryDisplay}</span>
        </nav>

        <h2 className="text-lg font-semibold text-blue-900 mb-4">Filters</h2>

        {/* Difficulty Filter */}
        <DifficultyFilter
          selectedSubCategory={subcategory}
          stagedDifficulties={stagedDifficulties}
          toggleDifficulty={toggleDifficulty}
        />

        {/* Tag Filters */}
        {availableTags.length > 0 && (
          <div className="mb-4 p-4 bg-white rounded-lg border border-blue-200">
            <h3 className="text-sm font-semibold text-blue-900 mb-3">
              Filter by Tags
            </h3>
            <div className="space-y-2 max-h-48 overflow-y-auto">
              {availableTags.map((tag) => (
                <label
                  key={tag}
                  htmlFor={`tag-${tag}`}
                  className="flex items-center gap-2 cursor-pointer hover:bg-blue-50 p-1 rounded transition"
                >
                  <input
                    type="checkbox"
                    id={`tag-${tag}`}
                    checked={stagedTags.includes(tag)}
                    onChange={() => toggleTag(tag)}
                    className="w-4 h-4 text-blue-600 rounded focus:ring-2 focus:ring-blue-500"
                    aria-label={`Filter by tag: ${tag}`}
                  />
                  <span className="text-sm text-blue-900">{tag}</span>
                </label>
              ))}
            </div>
          </div>
        )}

        {/* Apply/Clear Buttons */}
        <div className="mb-6 p-4 bg-white rounded-lg border border-blue-200">
          <div className="flex flex-col gap-2">
            <button
              onClick={applyFilters}
              disabled={!hasUnappliedChanges}
              className={`w-full px-4 py-2 rounded-lg font-medium transition ${
                hasUnappliedChanges
                  ? 'bg-blue-600 hover:bg-blue-700 text-white'
                  : 'bg-gray-200 text-gray-700 cursor-not-allowed'
              }`}
            >
              Apply Filters
              {hasUnappliedChanges && (
                <span className="ml-2 text-xs bg-blue-700 px-2 py-0.5 rounded-full">
                  Pending
                </span>
              )}
            </button>
            <button
              onClick={clearFilters}
              disabled={stagedDifficulties.length === 0 && stagedTags.length === 0}
              className={`w-full px-4 py-2 rounded-lg font-medium transition ${
                stagedDifficulties.length > 0 || stagedTags.length > 0
                  ? 'bg-gray-100 hover:bg-gray-200 text-gray-700'
                  : 'bg-gray-50 text-gray-700 cursor-not-allowed'
              }`}
            >
              Clear Filters
            </button>
          </div>
        </div>
      </aside>

      {/* Main: Problems Display */}
      <main className="flex-1 p-8 print:px-0 print:py-0">
        <div className="print:p-0">
          <div className="flex items-baseline justify-between mb-6 print:hidden">
            <h2 className="text-2xl font-bold text-blue-900">
              {categoryDisplay} - {subcategoryDisplay}
            </h2>
            {problems.length > 0 && (
              <button
                onClick={handleDownloadPDF}
                disabled={generatingPDF}
                className="flex items-center gap-2 bg-green-600 hover:bg-green-700 disabled:bg-gray-400 text-white px-4 py-2 rounded-lg shadow transition"
              >
                {generatingPDF ? (
                  <>
                    <Loader2 className="w-5 h-5 animate-spin" />
                    Generating...
                  </>
                ) : (
                  <>
                    <Download className="w-5 h-5" />
                    Download PDF
                  </>
                )}
              </button>
            )}
          </div>

          {/* PDF Error */}
          {pdfError && (
            <div className="flex items-start gap-3 text-red-700 bg-red-50 p-4 rounded-lg mb-4">
              <div>
                <p className="font-semibold">Error generating PDF</p>
                <p className="text-sm">{pdfError}</p>
              </div>
            </div>
          )}

          {/* Print header with metadata */}
          <div className="hidden print:block mb-8">
            <h2 className="text-2xl font-bold text-blue-900 print:text-black text-center mb-4">
              {categoryDisplay} - {subcategoryDisplay}
            </h2>
            <div className="flex justify-between items-center text-sm text-gray-700 print:text-black mb-4 border-b border-gray-300 print:border-black pb-2">
              <div>
                <span className="font-semibold">Name:</span>{' '}
                ___________________________
              </div>
              <div>
                <span className="font-semibold">Date:</span>{' '}
                _______________
              </div>
              <div>
                <span className="font-semibold">Problems:</span>{' '}
                {problems.length}
              </div>
            </div>
          </div>

          {/* Problems Grid */}
          {problems.length > 0 ? (
            <>
              <ol className="grid grid-cols-1 md:grid-cols-2 gap-4 text-lg text-blue-900 print:text-black print:grid-cols-2">
                {problems.map((problem) => (
                  <li key={problem.id} className="mb-3">
                    <span className="font-math text-blue-900 print:text-black">
                      {categoryDisplay === 'Fractions' ? (
                        <>
                          {renderMathExpression(problem.question + ' = ')}
                          <span className="inline-answer print:hidden">
                            {answerKeyOpen && renderMathExpression(problem.answer)}
                          </span>
                        </>
                      ) : (
                        <>
                          {problem.question + ' = '}
                          <span className="inline-answer print:hidden">
                            {answerKeyOpen && problem.answer}
                          </span>
                        </>
                      )}
                    </span>
                  </li>
                ))}
              </ol>

              {/* Answer Key - hidden on screen, shows on page 2 when printing */}
              <div className="print-answer-key">
                <h2 className="text-xl font-bold text-black text-center mb-6 mt-8">
                  Answer Key
                </h2>
                <ol className="grid grid-cols-2 gap-x-8 gap-y-2 text-sm">
                  {problems.map((problem, idx) => (
                    <li
                      key={`answer-${problem.id}`}
                      className="flex items-baseline"
                    >
                      <span className="font-semibold mr-2">{idx + 1}.</span>
                      <span className="font-math">
                        {categoryDisplay === 'Fractions'
                          ? renderMathExpression(problem.answer)
                          : problem.answer}
                      </span>
                    </li>
                  ))}
                </ol>
              </div>

              {/* Buttons */}
              <div className="mt-8 flex gap-4 print:hidden">
                <button
                  className="bg-blue-100 hover:bg-blue-200 text-blue-800 px-4 py-2 rounded transition"
                  onClick={() => navigate(`/${category}`)}
                >
                  ← Back to {categoryDisplay}
                </button>
                <button
                  className="bg-blue-100 hover:bg-blue-200 text-blue-800 px-4 py-2 w-48 rounded transition"
                  onClick={() => setAnswerKeyOpen(!answerKeyOpen)}
                >
                  {answerKeyOpen ? 'Hide Answer Key' : 'Show Answer Key'}
                </button>
              </div>
            </>
          ) : (
            <div className="text-center py-12 text-blue-900">
              <p className="text-lg">No problems found for these filters.</p>
              <button
                onClick={clearFilters}
                className="mt-4 text-blue-600 hover:text-blue-800 underline"
              >
                Clear filters and try again
              </button>
            </div>
          )}
        </div>
      </main>
    </div>
  );
}