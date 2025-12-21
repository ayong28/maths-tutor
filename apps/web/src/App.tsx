import { useState, useMemo } from "react";
import { ChevronRight, Printer, Loader2, AlertCircle } from "lucide-react";
import { Fraction } from "./components/Fraction";
import { classNames, parseFraction, parseMixedNumber } from "./utils/utils";
import { MixedNumber } from "./components/MixedNumber";
import { useCategories, useProblems, useTags } from "@/hooks";
import { type ProblemType, type Difficulty } from "@/api";

/**
 * Map API problem types to display categories and subcategories
 */
const PROBLEM_TYPE_MAP: Record<
  ProblemType,
  { mainCategory: string; subCategory: string }
> = {
  FRACTION_ADDITION: { mainCategory: "Fractions", subCategory: "Addition" },
  FRACTION_SUBTRACTION: {
    mainCategory: "Fractions",
    subCategory: "Subtraction",
  },
  FRACTION_REDUCTION: { mainCategory: "Fractions", subCategory: "Reduction" },
  FRACTION_MULTIPLICATION: {
    mainCategory: "Fractions",
    subCategory: "Multiplication",
  },
  FRACTION_DIVISION: { mainCategory: "Fractions", subCategory: "Division" },
  ALGEBRA_COLLECTING_TERMS: {
    mainCategory: "Algebra",
    subCategory: "Collecting Terms",
  },
  ALGEBRA_MULTIPLICATION: {
    mainCategory: "Algebra",
    subCategory: "Multiplication",
  },
};

/**
 * Tokenize expression string to identify mixed numbers, fractions, operators, numbers, fill-ins, and variables.
 */
function tokenizeMathExpression(expr: string) {
  // - Mixed numbers (\d+\s+\d+/\d+)
  // - Fractions (\d+/\d+)
  // - Fill-in ("___")
  // - Numbers/variables/words (\w+)
  // - Operators (+ - =)
  // - Parentheses (\(|\))
  // - Any leftover single character
  const regex = /\d+\s+\d+\s*\/\s*\d+|\d+\s*\/\s*\d+|___|[+\-=()]|\w+|\s+|./g;
  return expr.match(regex) || [];
}

/**
 * Takes an expression string and replaces all occurrences of mixed numbers and a/b with their respective components.
 * Ensures fractions and mixed numbers are vertically aligned and of consistent height.
 */
function renderMathExpression(expr: string) {
  const tokens = tokenizeMathExpression(expr);
  // For alignment fix: wrap all major tokens in a flex-row container to baseline-align operands.
  // For each "operand", we can wrap in a span with inline-flex and align-middle for best results.
  return (
    <span className="inline-flex flex-row items-center flex-wrap [-webkit-font-smoothing:auto]">
      {tokens.map((token: string, idx: number) => {
        const cleanedToken = token.trim();
        if (!cleanedToken) {
          return <span key={`ws-${idx}`} className="mx-0.5" />;
        }
        const mixed = parseMixedNumber(cleanedToken);
        if (mixed)
          return (
            <MixedNumber
              key={idx}
              whole={mixed.whole}
              numerator={mixed.numerator}
              denominator={mixed.denominator}
            />
          );
        const frac = parseFraction(cleanedToken);
        if (frac)
          return (
            <Fraction
              key={idx}
              numerator={frac.numerator}
              denominator={frac.denominator}
            />
          );
        if (cleanedToken === "___")
          return (
            <span
              key={idx}
              className="inline-block border-b border-dashed border-blue-300 w-16 align-middle mx-2 min-h-[1.5em]"
            />
          );
        return (
          <span
            key={idx}
            className="mx-0.5 select-none font-math text-xl leading-tight min-w-[0.8em] text-center inline-block align-middle"
          >
            {cleanedToken}
          </span>
        );
      })}
    </span>
  );
}

const App = () => {
  const [selectedCategory, setSelectedCategory] = useState<string | null>(null);
  const [selectedSubCategory, setSelectedSubCategory] = useState<string | null>(
    null
  );
  const [selectedProblemType, setSelectedProblemType] =
    useState<ProblemType | null>(null);

  // Staged filters - change immediately on checkbox click (not sent to API yet)
  const [stagedDifficulties, setStagedDifficulties] = useState<Difficulty[]>([]);
  const [stagedTags, setStagedTags] = useState<string[]>([]);

  // Applied filters - only updated when "Apply Filters" is clicked (sent to API)
  const [appliedDifficulties, setAppliedDifficulties] = useState<Difficulty[]>([]);
  const [appliedTags, setAppliedTags] = useState<string[]>([]);

  // Fetch categories from API
  const {
    data: apiCategories,
    loading: categoriesLoading,
    error: categoriesError,
  } = useCategories();

  // Fetch tags for the selected problem type (only when type is selected)
  const {
    data: availableTags,
    loading: tagsLoading,
  } = useTags(selectedProblemType || undefined);

  // Detect if there are unapplied filter changes
  const hasUnappliedChanges = useMemo(() => {
    const diffChanged = JSON.stringify([...stagedDifficulties].sort()) !==
                        JSON.stringify([...appliedDifficulties].sort());
    const tagsChanged = JSON.stringify([...stagedTags].sort()) !==
                        JSON.stringify([...appliedTags].sort());
    return diffChanged || tagsChanged;
  }, [stagedDifficulties, appliedDifficulties, stagedTags, appliedTags]);

  // Create stable filter object with useMemo to prevent unnecessary re-renders
  // ONLY uses APPLIED filters - API is called only when filters are applied
  const problemFilters = useMemo(() => {
    if (!selectedProblemType) return {};

    return {
      type: selectedProblemType,
      limit: 20,
      difficulty: appliedDifficulties.length > 0 ? appliedDifficulties : undefined,
      tags: appliedTags.length > 0 ? appliedTags : undefined,
    };
  }, [selectedProblemType, appliedDifficulties, appliedTags]);

  // Fetch problems when a subcategory is selected
  const {
    data: problems,
    loading: problemsLoading,
    error: problemsError,
  } = useProblems(problemFilters);

  // For printing
  const handlePrint = () => {
    window.print();
  };

  // Build category structure from API data
  const categoryStructure: Record<string, Set<string>> = {};
  const subcategoryToType: Record<string, Record<string, ProblemType>> = {};

  if (apiCategories) {
    apiCategories.forEach((cat) => {
      const mapping = PROBLEM_TYPE_MAP[cat.type];
      if (mapping) {
        const { mainCategory, subCategory } = mapping;

        if (!categoryStructure[mainCategory]) {
          categoryStructure[mainCategory] = new Set();
          subcategoryToType[mainCategory] = {};
        }

        categoryStructure[mainCategory]!.add(subCategory);
        subcategoryToType[mainCategory]![subCategory] = cat.type;
      }
    });
  }

  const categories = Object.keys(categoryStructure);

  // Handle subcategory selection
  const onSelectSubCategory = (subCat: string) => {
    setSelectedSubCategory(subCat);
    // Reset both staged and applied filters
    setStagedDifficulties([]);
    setStagedTags([]);
    setAppliedDifficulties([]);
    setAppliedTags([]);

    // Find the ProblemType for this subcategory
    if (selectedCategory && subcategoryToType[selectedCategory]) {
      const problemType = subcategoryToType[selectedCategory]![subCat];
      setSelectedProblemType(problemType || null);
    }
  };

  // Reset selections when category changes
  const onSelectCategory = (cat: string) => {
    setSelectedCategory(cat);
    setSelectedSubCategory(null);
    setSelectedProblemType(null);
    // Reset both staged and applied filters
    setStagedDifficulties([]);
    setStagedTags([]);
    setAppliedDifficulties([]);
    setAppliedTags([]);
  };

  // Toggle difficulty selection (staged only - doesn't trigger API call)
  const toggleDifficulty = (difficulty: Difficulty): void => {
    setStagedDifficulties((prev) =>
      prev.includes(difficulty)
        ? prev.filter((d) => d !== difficulty)
        : [...prev, difficulty]
    );
  };

  // Toggle tag selection (staged only - doesn't trigger API call)
  const toggleTag = (tag: string): void => {
    setStagedTags((prev) =>
      prev.includes(tag)
        ? prev.filter((t) => t !== tag)
        : [...prev, tag]
    );
  };

  // Apply staged filters - triggers API call
  const applyFilters = (): void => {
    setAppliedDifficulties(stagedDifficulties);
    setAppliedTags(stagedTags);
  };

  // Clear all filters
  const clearFilters = (): void => {
    setStagedDifficulties([]);
    setStagedTags([]);
    setAppliedDifficulties([]);
    setAppliedTags([]);
  };

  const [answerKeyOpen, setAnswerKeyOpen] = useState(false);

  return (
    <div className="min-h-screen bg-linear-to-br from-teal-50 to-blue-100 flex flex-col items-center py-8 px-2 print:bg-white print:text-black">
      {/* Header */}
      <header className="mb-8 text-center print:hidden">
        <h1 className="text-3xl font-bold text-blue-900 mb-2">
          Maths Tutoring Worksheets
        </h1>
        <p className="text-blue-700">
          Select a topic and category to view printable worksheets.
        </p>
      </header>

      {/* Main content area */}
      <div className="w-full max-w-5xl bg-white rounded-xl shadow-lg flex flex-col md:flex-row overflow-hidden print:shadow-none print:bg-white">
        {/* Sidebar: Categories & Subcategories */}
        <aside className="md:w-1/3 border-r border-blue-100 bg-blue-50 px-6 py-6 print:hidden">
          <div>
            <h2 className="text-lg font-semibold text-blue-700 mb-4">Topics</h2>

            {/* Difficulty Filters */}
            {selectedSubCategory && (
              <div className="mb-4 p-4 bg-white rounded-lg border border-blue-200">
                <h3 className="text-sm font-semibold text-blue-700 mb-3">
                  Difficulty Levels
                </h3>
                <div className="space-y-2">
                  {(['EASY', 'MEDIUM', 'HARD'] as Difficulty[]).map((difficulty) => (
                    <label
                      key={difficulty}
                      className="flex items-center gap-2 cursor-pointer hover:bg-blue-50 p-1 rounded transition"
                    >
                      <input
                        type="checkbox"
                        checked={stagedDifficulties.includes(difficulty)}
                        onChange={() => toggleDifficulty(difficulty)}
                        className="w-4 h-4 text-blue-600 rounded focus:ring-2 focus:ring-blue-500"
                      />
                      <span className="text-sm text-blue-900">
                        {difficulty.charAt(0) + difficulty.slice(1).toLowerCase()}
                      </span>
                    </label>
                  ))}
                </div>
                {stagedDifficulties.length === 0 && (
                  <p className="text-xs text-blue-500 mt-2 italic">
                    All difficulties shown
                  </p>
                )}
              </div>
            )}

            {/* Tag Filters */}
            {selectedSubCategory && availableTags && availableTags.length > 0 && (
              <div className="mb-4 p-4 bg-white rounded-lg border border-blue-200">
                <h3 className="text-sm font-semibold text-blue-700 mb-3">
                  Filter by Tags
                </h3>
                {tagsLoading ? (
                  <div className="flex items-center gap-2 text-blue-600 text-sm">
                    <Loader2 className="w-3 h-3 animate-spin" />
                    <span>Loading tags...</span>
                  </div>
                ) : (
                  <div className="space-y-2 max-h-48 overflow-y-auto">
                    {availableTags.map((tag) => (
                      <label
                        key={tag}
                        className="flex items-center gap-2 cursor-pointer hover:bg-blue-50 p-1 rounded transition"
                      >
                        <input
                          type="checkbox"
                          checked={stagedTags.includes(tag)}
                          onChange={() => toggleTag(tag)}
                          className="w-4 h-4 text-blue-600 rounded focus:ring-2 focus:ring-blue-500"
                        />
                        <span className="text-sm text-blue-900">
                          {tag}
                        </span>
                      </label>
                    ))}
                  </div>
                )}
                {stagedTags.length === 0 && !tagsLoading && (
                  <p className="text-xs text-blue-500 mt-2 italic">
                    All tags shown
                  </p>
                )}
                {stagedTags.length > 0 && (
                  <p className="text-xs text-blue-600 mt-2 font-medium">
                    {stagedTags.length} tag{stagedTags.length !== 1 ? 's' : ''} selected
                  </p>
                )}
              </div>
            )}

            {/* Apply/Clear Filters Buttons */}
            {selectedSubCategory && (
              <div className="mb-6 p-4 bg-white rounded-lg border border-blue-200">
                <div className="flex flex-col gap-2">
                  <button
                    onClick={applyFilters}
                    disabled={!hasUnappliedChanges}
                    className={classNames(
                      "w-full px-4 py-2 rounded-lg font-medium transition",
                      hasUnappliedChanges
                        ? "bg-blue-600 hover:bg-blue-700 text-white"
                        : "bg-gray-200 text-gray-400 cursor-not-allowed"
                    )}
                  >
                    Apply Filters
                    {hasUnappliedChanges && (
                      <span className="ml-2 text-xs bg-blue-500 px-2 py-0.5 rounded-full">
                        Pending
                      </span>
                    )}
                  </button>
                  <button
                    onClick={clearFilters}
                    disabled={stagedDifficulties.length === 0 && stagedTags.length === 0}
                    className={classNames(
                      "w-full px-4 py-2 rounded-lg font-medium transition",
                      stagedDifficulties.length > 0 || stagedTags.length > 0
                        ? "bg-gray-100 hover:bg-gray-200 text-gray-700"
                        : "bg-gray-50 text-gray-300 cursor-not-allowed"
                    )}
                  >
                    Clear Filters
                  </button>
                </div>
              </div>
            )}

            {categoriesLoading && (
              <div className="flex items-center gap-2 text-blue-600">
                <Loader2 className="w-4 h-4 animate-spin" />
                <span>Loading categories...</span>
              </div>
            )}

            {categoriesError && (
              <div className="flex items-start gap-2 text-red-600 bg-red-50 p-3 rounded">
                <AlertCircle className="w-5 h-5 shrink-0 mt-0.5" />
                <div>
                  <p className="font-semibold">Error loading categories</p>
                  <p className="text-sm">{categoriesError}</p>
                </div>
              </div>
            )}

            {!categoriesLoading && !categoriesError && (
              <ul>
                {categories.map((cat) => (
                  <li key={cat} className="mb-2">
                    <button
                      className={classNames(
                        "flex items-center px-3 py-2 w-full rounded-lg mb-1 font-medium transition",
                        selectedCategory === cat
                          ? "bg-blue-200 text-blue-900"
                          : "hover:bg-blue-100 text-blue-700"
                      )}
                      onClick={() => {
                        onSelectCategory(cat);
                        setAnswerKeyOpen(false);
                      }}
                    >
                      {cat}
                      <ChevronRight className="ml-auto w-4 h-4" />
                    </button>
                    {/* Subcategories */}
                    {selectedCategory === cat && (
                      <ul className="ml-4 mt-1">
                        {Array.from(categoryStructure[cat] || []).map(
                          (subCat) => (
                            <li key={subCat}>
                              <button
                                className={classNames(
                                  "flex items-center px-2 py-1 w-full rounded-md text-sm transition",
                                  selectedSubCategory === subCat
                                    ? "bg-blue-300 text-blue-900 font-semibold"
                                    : "hover:bg-blue-100 text-blue-700"
                                )}
                                onClick={() => {
                                  onSelectSubCategory(subCat);
                                  setAnswerKeyOpen(false);
                                }}
                              >
                                {subCat}
                              </button>
                            </li>
                          )
                        )}
                      </ul>
                    )}
                  </li>
                ))}
              </ul>
            )}
          </div>
        </aside>

        {/* Main: Problems Display */}
        <main className="flex-1 p-8 print:px-0 print:py-0">
          {selectedCategory && selectedSubCategory ? (
            <div className="print:p-0">
              <div className="flex items-baseline justify-between mb-6 print:hidden">
                <h2 className="text-2xl font-bold text-blue-900">
                  {selectedCategory} - {selectedSubCategory}
                </h2>
                {problems && problems.length > 0 && (
                  <button
                    onClick={handlePrint}
                    className="flex items-center gap-2 bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded-lg shadow transition"
                  >
                    <Printer className="w-5 h-5" />
                    Print
                  </button>
                )}
              </div>

              {/* Loading state */}
              {problemsLoading && (
                <div className="flex flex-col items-center justify-center py-12 gap-3">
                  <Loader2 className="w-8 h-8 animate-spin text-blue-600" />
                  <p className="text-blue-700">Loading problems...</p>
                </div>
              )}

              {/* Error state */}
              {problemsError && (
                <div className="flex items-start gap-3 text-red-600 bg-red-50 p-4 rounded-lg">
                  <AlertCircle className="w-6 h-6 shrink-0 mt-0.5" />
                  <div>
                    <p className="font-semibold">Error loading problems</p>
                    <p className="text-sm">{problemsError}</p>
                  </div>
                </div>
              )}

              {/* Problems display */}
              {!problemsLoading && !problemsError && problems && (
                <div>
                  {/* Print header with metadata */}
                  <div className="hidden print:block mb-8">
                    <h2 className="text-2xl font-bold text-blue-900 print:text-black text-center mb-4">
                      {selectedCategory} - {selectedSubCategory}
                    </h2>
                    <div className="flex justify-between items-center text-sm text-gray-600 print:text-black mb-4 border-b border-gray-300 print:border-black pb-2">
                      <div>
                        <span className="font-semibold">Name:</span>{" "}
                        ___________________________
                      </div>
                      <div>
                        <span className="font-semibold">Date:</span>{" "}
                        _______________
                      </div>
                      <div>
                        <span className="font-semibold">Problems:</span>{" "}
                        {problems.length}
                      </div>
                    </div>
                  </div>

                  {/* Screen title (hidden on print) */}
                  <h2 className="text-2xl font-bold text-blue-900 block md:hidden mb-4 print:hidden">
                    {selectedCategory} - {selectedSubCategory}
                  </h2>

                  {/* Questions - always show without answers in print */}
                  <ol className="grid grid-cols-1 md:grid-cols-2 gap-4 text-lg text-blue-900 print:text-black print:grid-cols-2">
                    {problems.map((problem) => (
                      <li key={problem.id} className="mb-3">
                        <span className="font-math text-blue-900 print:text-black">
                          {selectedCategory === "Fractions" ? (
                            <>
                              {renderMathExpression(problem.question + " = ")}
                              <span className="inline-answer print:hidden">
                                {answerKeyOpen &&
                                  renderMathExpression(problem.answer)}
                              </span>
                            </>
                          ) : (
                            <>
                              {problem.question + " = "}
                              <span className="inline-answer print:hidden">
                                {answerKeyOpen && problem.answer}
                              </span>
                            </>
                          )}
                        </span>
                        {/* <div className="border-b border-dashed border-blue-300 mt-1 mb-2 print:hidden min-h-4" /> */}
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
                            {selectedCategory === "Fractions"
                              ? renderMathExpression(problem.answer)
                              : problem.answer}
                          </span>
                        </li>
                      ))}
                    </ol>
                  </div>
                  <div className="mt-8 flex gap-4 print:hidden">
                    <button
                      className="bg-blue-100 hover:bg-blue-200 text-blue-800 px-4 py-2 rounded transition"
                      onClick={() => {
                        setSelectedSubCategory(null);
                        setSelectedProblemType(null);
                        setAnswerKeyOpen(false);
                      }}
                    >
                      Back to Categories
                    </button>
                    <button
                      className="bg-blue-100 hover:bg-blue-200 text-blue-800 px-4 py-2 w-48 rounded transition"
                      onClick={() => {
                        setAnswerKeyOpen(!answerKeyOpen);
                      }}
                    >
                      {answerKeyOpen ? "Hide Answer Key" : "Show Answer Key"}
                    </button>
                    <button
                      onClick={handlePrint}
                      className="flex items-center gap-2 bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded-lg shadow transition"
                    >
                      <Printer className="w-5 h-5" />
                      Print
                    </button>
                  </div>
                </div>
              )}

              {/* No problems found */}
              {!problemsLoading &&
                !problemsError &&
                problems &&
                problems.length === 0 && (
                  <div className="text-center py-12 text-blue-600">
                    <p className="text-lg">
                      No problems found for this category.
                    </p>
                  </div>
                )}
            </div>
          ) : (
            <div className="flex flex-col items-center justify-center min-h-50 text-blue-500">
              <span className="text-6xl mb-2">🧮</span>
              <p className="text-lg">
                Please select a topic and category to view worksheets.
              </p>
            </div>
          )}
        </main>
      </div>

      {/* Print-specific styling and optional math font */}
      <style>
        {`
          @media print {
            /* Page setup */
            @page {
              size: A4;
              margin: 1cm 1cm;
            }

            /* Reset body */
            body {
              background: white !important;
              margin: 0;
              padding: 0;
            }

            /* Tailwind print utilities */
            .print\\:hidden { display: none !important; }
            .print\\:block { display: block !important; }
            .print\\:shadow-none { box-shadow: none !important; }
            .print\\:bg-white { background: #fff !important; }
            .print\\:text-black { color: #000 !important; }
            .print\\:grid-cols-2 { grid-template-columns: repeat(2, 1fr) !important; }
            .print\\:px-0 { padding-left: 0 !important; padding-right: 0 !important; }
            .print\\:py-0 { padding-top: 0 !important; padding-bottom: 0 !important; }
            .print\\:p-0 { padding: 0 !important; }
            .print\\:border-black { border-color: #000 !important; }

            /* Hide inline answers in print (they show on page 2 instead) */
            .inline-answer {
              display: none !important;
            }

            /* Main container adjustments */
            .min-h-screen {
              min-height: auto !important;
              padding: 0 !important;
            }

            /* Hide rounded corners and shadows */
            .rounded-xl, .rounded-lg, .rounded-md, .rounded {
              border-radius: 0 !important;
            }
            .shadow, .shadow-lg {
              box-shadow: none !important;
            }

            /* Worksheet title - make it prominent */
            h2 {
              font-size: 18pt !important;
              font-weight: bold !important;
              margin-bottom: 0.5em !important;
              text-align: center !important;
              color: #000 !important;
            }

            /* Print header metadata */
            .print\\:block {
              display: block !important;
            }
            .hidden.print\\:block {
              display: block !important;
            }

            /* Metadata line styling */
            div.flex {
              font-size: 10pt !important;
              color: #000 !important;
              margin-bottom: 1.5em !important;
            }

            /* Problems grid - ensure 2 columns */
            ol {
              display: grid !important;
              grid-template-columns: repeat(2, 1fr) !important;
              gap: 1em !important;
              font-size: 11pt !important;
              margin: 0 !important;
              padding: 0 !important;
              list-style: none !important;
              counter-reset: problem-counter !important;
            }

            /* Number each problem */
            ol li {
              position: relative !important;
              padding-left: 1.5em !important;
              margin-bottom: calc(1em) !important;
              page-break-inside: avoid !important;
              counter-increment: problem-counter !important;
            }

            ol li::before {
              content: counter(problem-counter) ". " !important;
              position: absolute !important;
              left: 0 !important;
              font-weight: bold !important;
              color: #000 !important;
            }

            /* Prevent page breaks in the middle of problems */
            li {
              break-inside: avoid !important;
              page-break-inside: avoid !important;
            }

            /* Answer Key on Page 2 */
            .print-answer-key {
              display: block !important;
              page-break-before: always !important;
              break-before: page !important;
              margin-top: 0 !important;
              padding-top: 0.5cm !important;
            }

            .print-answer-key h2 {
              font-size: 12pt !important;
              margin-bottom: 0.5em !important;
            }

            .print-answer-key ol {
              display: grid !important;
              grid-template-columns: repeat(2, 1fr) !important;
              gap: 0.3em 2em !important;
              font-size: 9pt !important;
              list-style: none !important;
              counter-reset: none !important;
            }

            .print-answer-key li {
              margin-bottom: 0.2em !important;
              padding-left: 0 !important;
              page-break-inside: avoid !important;
            }

            .print-answer-key li::before {
              content: none !important;
            }

            /* Ensure proper spacing */
            * {
              -webkit-print-color-adjust: exact !important;
              print-color-adjust: exact !important;
            }
          }

          /* Hide answer key on screen, show only when printing */
          .print-answer-key {
            display: none;
          }

          .font-math {
            font-family: 'STIX Two Math', 'Cambria Math', 'Times New Roman', system-ui, sans-serif;
            font-variant-numeric: lining-nums;
            letter-spacing: 0.01em;
          }
        `}
      </style>
    </div>
  );
};

export default App;
