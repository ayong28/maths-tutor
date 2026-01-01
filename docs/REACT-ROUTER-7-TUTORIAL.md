# React Router 7 Implementation Tutorial

A step-by-step guide to add routing to the Maths Tutoring Worksheets app.

## Prerequisites

- Node v20.19.0+ (you're on v20.18.0 - should work but upgrade if issues)
- API server NOT running (killed in previous session)
- Clean working directory (commit current changes first)

## Overview

This tutorial implements:
- URL-based navigation (`/fractions/addition`)
- Browser back/forward buttons working
- Deep linking (bookmark worksheets)
- Filters in URL query params (`?difficulty=EASY,MEDIUM`)
- Data loading before component render

## Step 1: Commit Current Work

```bash
cd /Users/adrian/workspace/2026-projects/maths-tutor

git add .
git commit -m "Before React Router 7 implementation"
```

## Step 2: Install React Router 7

```bash
cd apps/web

npm install react-router@7 react-router-dom@7
```

**Expected output:** Package installation (warnings about engine version are OK)

## Step 3: Create Routes Directory

```bash
mkdir -p src/routes
```

**File structure you're creating:**
```
apps/web/src/
├── routes/
│   ├── root.tsx       # Layout wrapper
│   ├── home.tsx       # Home page
│   ├── category.tsx   # Category list
│   └── worksheet.tsx  # Worksheet view
└── routes.ts          # Route configuration
```

## Step 4: Create Route Configuration File

**File:** `apps/web/src/routes.ts`

```typescript
import { type RouteConfig, route, index, layout } from "@react-router/dev/routes";

export default [
  layout("routes/root.tsx", [
    index("routes/home.tsx"),
    route(":category", "routes/category.tsx"),
    route(":category/:subcategory", "routes/worksheet.tsx"),
  ]),
] satisfies RouteConfig;
```

**What this does:**
- Defines URL structure: `/`, `/:category`, `/:category/:subcategory`
- `layout` wraps all routes with Root component
- `index` is the home page route
- `route` defines dynamic segments (`:category`, `:subcategory`)

## Step 5: Create Root Layout Component

**File:** `apps/web/src/routes/root.tsx`

```typescript
import { Outlet, Link } from 'react-router';

export default function Root() {
  return (
    <div className="min-h-screen bg-linear-to-r from-blue-600 to-blue-400 flex flex-col items-center py-8 px-2 print:bg-white print:text-black">
      {/* Header */}
      <header className="mb-8 text-center print:hidden">
        <Link to="/" className="hover:opacity-80 transition">
          <h1 className="text-3xl font-bold text-blue-950 mb-2">
            Maths Tutoring Worksheets
          </h1>
          <p className="text-blue-900">
            Select a topic and category to view printable worksheets.
          </p>
        </Link>
      </header>

      {/* Route content renders here */}
      <Outlet />
    </div>
  );
}
```

**Key points:**
- `<Outlet />` is where child routes render
- This component wraps all pages with the header
- `Link` component for client-side navigation

## Step 6: Update API Client for Async Loading

**File:** `apps/web/src/api/client.ts`

Replace the entire file with:

```typescript
import { type ProblemFilters, type CategoryInfo, type Problem } from './types';

const API_BASE = '/api';

class ApiError extends Error {
  constructor(
    message: string,
    public status: number,
    public statusText: string
  ) {
    super(message);
    this.name = 'ApiError';
  }
}

async function handleResponse<T>(response: Response): Promise<T> {
  if (!response.ok) {
    throw new ApiError(
      `API request failed: ${response.statusText}`,
      response.status,
      response.statusText
    );
  }
  return response.json();
}

export async function getCategories(): Promise<CategoryInfo[]> {
  const response = await fetch(`${API_BASE}/categories`);
  return handleResponse<CategoryInfo[]>(response);
}

export async function getProblems(filters: ProblemFilters): Promise<Problem[]> {
  const params = new URLSearchParams();

  if (filters.type) params.set('type', filters.type);
  if (filters.difficulty) params.set('difficulty', filters.difficulty.join(','));
  if (filters.tags) params.set('tags', filters.tags.join(','));
  if (filters.limit) params.set('limit', filters.limit.toString());
  if (filters.seed) params.set('seed', filters.seed);

  const response = await fetch(`${API_BASE}/problems?${params}`);
  return handleResponse<Problem[]>(response);
}

export async function getTags(type: string): Promise<string[]> {
  const response = await fetch(`${API_BASE}/tags/${type}`);
  return handleResponse<string[]>(response);
}
```

**What changed:**
- Functions now return Promises directly (no React hooks)
- Added proper error handling with ApiError class
- Ready for use in route loaders

## Step 7: Create Helper File for Problem Type Mapping

**File:** `apps/web/src/utils/routing.ts`

```typescript
import { type ProblemType } from '@/api';

const TYPE_MAP: Record<string, Record<string, ProblemType>> = {
  'fractions': {
    'addition': 'FRACTION_ADDITION',
    'subtraction': 'FRACTION_SUBTRACTION',
    'multiplication': 'FRACTION_MULTIPLICATION',
    'division': 'FRACTION_DIVISION',
    'reduction': 'FRACTION_REDUCTION',
  },
  'percentages': {
    'conversion': 'PERCENTAGE_CONVERSION',
    'of-quantity': 'PERCENTAGE_OF_QUANTITY',
  },
  'integers': {
    'addition': 'INTEGERS_ADDITION',
    'subtraction': 'INTEGERS_SUBTRACTION',
    'multiplication': 'INTEGERS_MULTIPLICATION',
    'division': 'INTEGERS_DIVISION',
  },
  'decimals': {
    'addition': 'DECIMALS_ADDITION',
    'subtraction': 'DECIMALS_SUBTRACTION',
    'multiplication': 'DECIMALS_MULTIPLICATION',
    'division': 'DECIMALS_DIVISION',
  },
  'index-notation': {
    'powers': 'INDEX_POWERS',
    'square-roots': 'INDEX_SQUARE_ROOTS',
    'laws': 'INDEX_LAWS',
  },
  'algebra': {
    'collecting-terms': 'ALGEBRA_COLLECTING_TERMS',
    'multiplication': 'ALGEBRA_MULTIPLICATION',
    'substitution': 'ALGEBRA_SUBSTITUTION',
    'word-problems': 'ALGEBRA_WORD_PROBLEMS',
    'distributive-law': 'ALGEBRA_DISTRIBUTIVE_LAW',
    'linear-equations-simple': 'ALGEBRA_LINEAR_EQUATIONS_SIMPLE',
    'linear-equations-complex': 'ALGEBRA_LINEAR_EQUATIONS_COMPLEX',
    'expanding-brackets': 'ALGEBRA_EXPANDING_BRACKETS',
    'factorising': 'ALGEBRA_FACTORISING',
  },
  'coordinates': {
    'plotting': 'COORDINATES_PLOTTING',
  },
  'linear-graphs': {
    'graphing': 'LINEAR_GRAPHING',
  },
  'ratio-rates': {
    'ratio-rates': 'RATIO_RATES',
  },
  'geometry': {
    'area': 'AREA',
    'angles': 'ANGLES',
  },
  'statistics': {
    'probability': 'PROBABILITY',
    'data-analysis': 'DATA_ANALYSIS',
  },
};

export function getProblemType(
  category: string,
  subcategory: string
): ProblemType | null {
  return TYPE_MAP[category]?.[subcategory] || null;
}
```

**What this does:**
- Maps URL slugs (`fractions/addition`) to database enums (`FRACTION_ADDITION`)
- Handles URL-to-API type conversion

## Step 8: Create Home Route

**File:** `apps/web/src/routes/home.tsx`

```typescript
import { useLoaderData, Link } from 'react-router';
import { getCategories } from '@/api/client';
import HeroSection from '@/components/HeroSection';
import { Loader2 } from 'lucide-react';

// Type for loader data
type LoaderData = Awaited<ReturnType<typeof clientLoader>>;

// Fetch data before rendering
export async function clientLoader() {
  const categories = await getCategories();

  // Build category structure
  const categoryStructure: Record<string, Set<string>> = {};
  const categoryInfo: Record<string, { display: string; count: number }> = {};

  categories.forEach((cat) => {
    if (!categoryStructure[cat.mainCategory]) {
      categoryStructure[cat.mainCategory] = new Set();
      categoryInfo[cat.mainCategory] = {
        display: cat.mainCategory,
        count: 0
      };
    }
    categoryStructure[cat.mainCategory].add(cat.subCategory);
    categoryInfo[cat.mainCategory].count++;
  });

  const categoryList = Object.keys(categoryStructure);

  return {
    categoryList,
    categoryStructure,
    categoryInfo,
  };
}

// Loading fallback (shown while clientLoader runs)
export function HydrateFallback() {
  return (
    <div className="w-full max-w-5xl bg-white rounded-xl shadow-lg p-8">
      <div className="flex items-center gap-3">
        <Loader2 className="w-6 h-6 animate-spin text-blue-900" />
        <p className="text-blue-900">Loading categories...</p>
      </div>
    </div>
  );
}

// Component receives loader data
export default function Home({ loaderData }: { loaderData: LoaderData }) {
  const { categoryList, categoryInfo } = loaderData;

  return (
    <div className="w-full max-w-5xl bg-white rounded-xl shadow-lg overflow-hidden">
      <div className="p-8">
        <HeroSection />

        {/* Category Grid */}
        <div className="mt-8 grid grid-cols-2 md:grid-cols-3 gap-4">
          {categoryList.map((category) => {
            const slug = category.toLowerCase().replace(/\s+/g, '-');
            const info = categoryInfo[category];

            return (
              <Link
                key={category}
                to={`/${slug}`}
                className="p-6 bg-blue-50 hover:bg-blue-100 rounded-lg transition text-center"
              >
                <h3 className="text-xl font-semibold text-blue-900">
                  {category}
                </h3>
                <p className="text-sm text-blue-700 mt-2">
                  {info.count} {info.count === 1 ? 'type' : 'types'}
                </p>
              </Link>
            );
          })}
        </div>
      </div>
    </div>
  );
}
```

**Key patterns:**
- `clientLoader` runs first, fetches data
- `HydrateFallback` shows loading UI
- Component receives data via `loaderData` prop
- Type safety with `Awaited<ReturnType<typeof clientLoader>>`

## Step 9: Create Category Route

**File:** `apps/web/src/routes/category.tsx`

```typescript
import { useLoaderData, Link, redirect } from 'react-router';
import { getCategories } from '@/api/client';
import { Loader2, ChevronRight } from 'lucide-react';

// Type for loader data
type LoaderData = Awaited<ReturnType<typeof clientLoader>>;

// Fetch data with URL params
export async function clientLoader({
  params
}: {
  params: { category: string }
}) {
  const { category } = params;
  const categories = await getCategories();

  // Build category structure
  const categoryMap: Record<string, {
    display: string;
    subcategories: string[];
  }> = {};

  categories.forEach((cat) => {
    const slug = cat.mainCategory.toLowerCase().replace(/\s+/g, '-');

    if (!categoryMap[slug]) {
      categoryMap[slug] = {
        display: cat.mainCategory,
        subcategories: [],
      };
    }

    categoryMap[slug].subcategories.push(cat.subCategory);
  });

  // Validate category exists, redirect to home if not
  if (!categoryMap[category]) {
    throw redirect('/');
  }

  return {
    category,
    categoryDisplay: categoryMap[category].display,
    subcategories: categoryMap[category].subcategories,
  };
}

// Loading fallback
export function HydrateFallback() {
  return (
    <div className="w-full max-w-5xl bg-white rounded-xl shadow-lg p-8">
      <div className="flex items-center gap-3">
        <Loader2 className="w-6 h-6 animate-spin text-blue-900" />
        <p className="text-blue-900">Loading subcategories...</p>
      </div>
    </div>
  );
}

// Component
export default function Category({ loaderData }: { loaderData: LoaderData }) {
  const { category, categoryDisplay, subcategories } = loaderData;

  return (
    <div className="w-full max-w-5xl bg-white rounded-xl shadow-lg overflow-hidden">
      <div className="p-8">
        {/* Breadcrumb */}
        <nav className="mb-6 text-sm text-blue-600">
          <Link to="/" className="hover:underline">Home</Link>
          <span className="mx-2">/</span>
          <span className="text-blue-900">{categoryDisplay}</span>
        </nav>

        <h2 className="text-2xl font-bold text-blue-900 mb-6">
          {categoryDisplay}
        </h2>

        {/* Subcategory List */}
        <ul className="space-y-2">
          {subcategories.map((subCat) => {
            const slug = subCat.toLowerCase().replace(/\s+/g, '-');

            return (
              <li key={subCat}>
                <Link
                  to={`/${category}/${slug}`}
                  className="flex items-center px-4 py-3 bg-blue-50 hover:bg-blue-100 rounded-lg transition"
                >
                  <span className="flex-1 text-blue-900 font-medium">
                    {subCat}
                  </span>
                  <ChevronRight className="w-5 h-5 text-blue-600" />
                </Link>
              </li>
            );
          })}
        </ul>

        {/* Back Button */}
        <Link
          to="/"
          className="mt-6 inline-block text-blue-600 hover:text-blue-800"
        >
          ← Back to Categories
        </Link>
      </div>
    </div>
  );
}
```

**Key points:**
- Access URL params via `params` argument
- Use `redirect` to navigate programmatically
- Breadcrumb navigation with `Link`

## Step 10: Create Worksheet Route

**File:** `apps/web/src/routes/worksheet.tsx`

```typescript
import { useLoaderData, useNavigate, useSearchParams, Link, redirect } from 'react-router';
import { useState, useMemo } from 'react';
import { getProblems, getTags } from '@/api/client';
import { type Difficulty } from '@/api';
import { Download, Loader2 } from 'lucide-react';
import DifficultyFilter from '@/components/DifficultyFilter';
import { renderMathExpression } from '@/utils/utils';
import { usePDFGenerator } from '@/hooks';
import { getProblemType } from '@/utils/routing';
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

  const problemType = getProblemType(category, subcategory);

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
export default function Worksheet({ loaderData }: { loaderData: LoaderData }) {
  const {
    category,
    subcategory,
    categoryDisplay,
    subcategoryDisplay,
    problems,
    availableTags,
    appliedFilters,
  } = loaderData;

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
```

**Key features:**
- Reads filters from URL query params
- `useSearchParams` to update URL when filters applied
- `useNavigate` for programmatic navigation
- PDF generation integrated

## Step 11: Update main.tsx

**File:** `apps/web/src/main.tsx`

Replace with:

```typescript
import { StrictMode } from 'react';
import { createRoot } from 'react-dom/client';
import { RouterProvider, createBrowserRouter } from 'react-router';
import routes from './routes';
import './index.css';

const router = createBrowserRouter(routes);

createRoot(document.getElementById('root')!).render(
  <StrictMode>
    <RouterProvider router={router} />
  </StrictMode>
);
```

**What changed:**
- Import `createBrowserRouter` from `'react-router'` (not `'react-router-dom'`)
- Import route config from `./routes`
- Create router and pass to `RouterProvider`

## Step 12: Backup Old App.tsx

```bash
mv src/App.tsx src/App.tsx.backup
```

**Why:** Keep the old file as reference. Delete later after testing.

## Step 13: Update Vite Config (Optional)

**File:** `vite.config.ts`

Ensure you have the API proxy (should already exist):

```typescript
import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';
import path from 'path';

export default defineConfig({
  plugins: [react()],
  resolve: {
    alias: {
      '@': path.resolve(__dirname, './src'),
    },
  },
  server: {
    proxy: {
      '/api': 'http://localhost:3001',
    },
  },
});
```

## Step 14: Test TypeScript Compilation

```bash
npx tsc --noEmit
```

**Expected:** No errors. If you get errors, check:
- Imports are correct
- Type annotations match
- All route files are saved

## Step 15: Start Servers

**Terminal 1 - API Server:**
```bash
npm run api:dev
```

Wait for: "Server running on http://localhost:3001"

**Terminal 2 - Web Server:**
```bash
npm run dev
```

Wait for: "Local: http://localhost:5173"

## Step 16: Test Basic Navigation

Open http://localhost:5173

### Test Checklist:

**Home Page:**
- [ ] HeroSection displays
- [ ] Category grid loads (Fractions, Algebra, etc.)
- [ ] Click "Fractions" → navigates to `/fractions`

**Category Page:**
- [ ] Breadcrumb shows: Home / Fractions
- [ ] Subcategories list displays (Addition, Subtraction, etc.)
- [ ] Click "Addition" → navigates to `/fractions/addition`

**Worksheet Page:**
- [ ] Breadcrumb shows: Home / Fractions / Addition
- [ ] 30 problems load
- [ ] Sidebar shows filters
- [ ] Download PDF button works
- [ ] Answer key toggle works

**Browser Navigation:**
- [ ] Browser back button works
- [ ] Browser forward button works
- [ ] Refresh page maintains URL/state

## Step 17: Test Filter Functionality

On worksheet page (`/fractions/addition`):

1. **Select difficulty filter:**
   - Check "Easy"
   - Click "Apply Filters"
   - URL updates to `?difficulty=EASY`
   - Problems refresh with only EASY problems

2. **Add tag filter:**
   - Check a tag (e.g., "like-denominators")
   - Click "Apply Filters"
   - URL updates to `?difficulty=EASY&tags=like-denominators`
   - Problems refresh with filtered results

3. **Clear filters:**
   - Click "Clear Filters"
   - URL resets to `/fractions/addition`
   - All problems load again

## Step 18: Test Mobile Responsiveness

1. Open DevTools (F12)
2. Click device toolbar (Ctrl+Shift+M / Cmd+Shift+M)
3. Select "iPhone SE" (375x667)

**Test mobile flow:**
- [ ] Home page → Category grid displays 2 columns
- [ ] Click category → Full screen list
- [ ] Click subcategory → Worksheet full screen
- [ ] Sidebar hidden by default on mobile (use `md:` breakpoint)
- [ ] Browser back works

## Step 19: Test Direct URLs

Test deep linking by manually entering URLs:

- `http://localhost:5173/algebra`
- `http://localhost:5173/algebra/collecting-terms`
- `http://localhost:5173/fractions/addition?difficulty=EASY,MEDIUM`
- `http://localhost:5173/invalid-category` → Should redirect to home

## Step 20: Clean Up

If everything works:

```bash
# Delete backup
rm src/App.tsx.backup

# Commit changes
git add .
git commit -m "Implement React Router 7 with URL-based navigation"
```

## Troubleshooting

### Error: Cannot find module '@react-router/dev/routes'

**Solution:** The routes config imports from `@react-router/dev`. Install it:

```bash
npm install -D @react-router/dev
```

### Error: Page is blank

**Check:**
1. Console errors (F12 → Console)
2. Network tab - API calls succeeding?
3. API server running on port 3001?

### Error: Module parse failed

**Cause:** Import path issue

**Solution:** Check all imports use correct paths:
- `'react-router'` (not `'react-router-dom'`)
- `'@/api/client'` (uses `@` alias)

### Filters don't update

**Check:**
1. URL changes when clicking "Apply Filters"?
2. `clientLoader` re-runs when URL changes?
3. Console for errors

### TypeScript errors about types

**Solution:** Use inline types as shown in tutorial:
```typescript
type LoaderData = Awaited<ReturnType<typeof clientLoader>>;
```

### Mobile view shows both sidebar and content

**Check:** Tailwind `md:` breakpoint at 768px. Sidebar should use:
```typescript
className="md:w-1/3 ... hidden md:block"
```

## What You've Accomplished

✅ **URL-based routing** - `/fractions/addition`
✅ **Deep linking** - Shareable worksheet URLs
✅ **Browser navigation** - Back/forward buttons work
✅ **Filter persistence** - Filters stored in URL query params
✅ **Loading states** - Data fetched before render
✅ **Type safety** - Full TypeScript support
✅ **Mobile responsive** - Works on all screen sizes

## Next Steps

1. **Update E2E tests** - Tests need updating for route-based navigation
2. **Add route transitions** - Consider page transitions
3. **Error boundaries** - Add error pages for 404, etc.
4. **Document changes** - Update PROJECT-HISTORY.md

## Key Concepts Learned

### clientLoader Pattern
```typescript
export async function clientLoader() {
  const data = await fetchData();
  return { data };
}
```
- Runs before component renders
- Data ready when component mounts
- No loading states in component

### URL as State
```typescript
// Before: State in component
const [filters, setFilters] = useState({});

// After: State in URL
const [searchParams, setSearchParams] = useSearchParams();
```
- Shareable URLs
- Browser back/forward works
- Refresh preserves state

### Type-Safe Routes
```typescript
type LoaderData = Awaited<ReturnType<typeof clientLoader>>;

export default function Component({ loaderData }: { loaderData: LoaderData }) {
  // loaderData is fully typed!
}
```
- TypeScript infers types
- Refactor-safe
- Autocomplete works

---

**Congratulations!** You've successfully implemented React Router 7 in your Maths Tutoring app.
