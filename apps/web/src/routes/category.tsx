/* eslint-disable react-refresh/only-export-components */
import { useLoaderData, Link, redirect } from 'react-router';
import { getCategories } from '@/api/client';
import { buildTypeMap, getCachedTypeMap, setCachedTypeMap, toSlug } from '@/utils/routing';
import { Loader2, ChevronRight, Home, ArrowLeft } from 'lucide-react';
import { getCategoryIcon, getCategoryTheme } from '@/config';

// Type for loader data
type LoaderData = Awaited<ReturnType<typeof clientLoader>>;

// Fetch data with URL params
export async function clientLoader({
  params
}: {
  params: { category: string }
}) {
  const { category } = params;

  // Try to use cached typeMap, otherwise fetch and build
  let typeMap = getCachedTypeMap();
  let categories;

  if (!typeMap) {
    // Cache miss - fetch and build TYPE_MAP
    categories = await getCategories();
    typeMap = buildTypeMap(categories);
    setCachedTypeMap(typeMap);
  } else {
    // Cache hit - still need categories for display
    categories = await getCategories();
  }

  // Build category structure
  const categoryMap: Record<string, {
    display: string;
    subcategories: string[];
  }> = {};

  categories.forEach((cat) => {
    const slug = toSlug(cat.mainCategory);

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
    <div className="min-h-screen p-8">
      <div className="max-w-4xl mx-auto">
        <div className="flex items-center justify-center gap-3 py-24">
          <Loader2 className="w-8 h-8 animate-spin text-[var(--color-teal-500)]" />
          <p className="text-[var(--color-slate-500)] font-medium">Loading worksheets...</p>
        </div>
      </div>
    </div>
  );
}

// Component
export default function Category() {
  const { category, categoryDisplay, subcategories } = useLoaderData<LoaderData>();
  const theme = getCategoryTheme(categoryDisplay);
  const icon = getCategoryIcon(categoryDisplay);

  return (
    <div className="min-h-screen">
      {/* Header Section */}
      <div className="bg-gradient-to-b from-[var(--color-slate-100)] to-[var(--color-cream)] border-b border-[var(--color-slate-200)]">
        <div className="max-w-4xl mx-auto px-8 py-8">
          {/* Breadcrumb */}
          <nav className="flex items-center gap-2 text-sm mb-6 animate-fade-in-up">
            <Link
              to="/"
              className="flex items-center gap-1.5 text-[var(--color-slate-500)] hover:text-[var(--color-teal-600)] transition-colors"
            >
              <Home className="w-4 h-4" />
              <span>Home</span>
            </Link>
            <ChevronRight className="w-4 h-4 text-[var(--color-slate-400)]" />
            <span className={`font-medium ${theme.textAccent}`}>{categoryDisplay}</span>
          </nav>

          {/* Title */}
          <div className="flex items-center gap-4 animate-fade-in-up delay-100">
            <div
              className={`w-14 h-14 rounded-2xl ${theme.accent} flex items-center justify-center shadow-lg text-white`}
            >
              {icon}
            </div>
            <div>
              <h1 className="font-heading text-3xl md:text-4xl font-bold text-[var(--color-slate-800)]">
                {categoryDisplay}
              </h1>
              <p className="text-[var(--color-slate-500)] mt-1">
                {subcategories.length} worksheet {subcategories.length === 1 ? 'type' : 'types'} available
              </p>
            </div>
          </div>
        </div>
      </div>

      {/* Subcategory List */}
      <div className="max-w-4xl mx-auto px-8 py-10">
        <div className="space-y-3">
          {subcategories.map((subCat, index) => {
            const slug = toSlug(subCat);

            return (
              <Link
                key={subCat}
                to={`/${category}/${slug}`}
                className="group flex items-center gap-4 p-5 bg-white rounded-2xl border border-[var(--color-slate-200)] hover:border-[var(--color-teal-300)] hover:shadow-md transition-all duration-200 animate-slide-in-left"
                style={{ animationDelay: `${index * 50}ms` }}
              >
                {/* Number indicator */}
                <div className="w-10 h-10 rounded-xl bg-[var(--color-slate-100)] group-hover:bg-[var(--color-teal-500)] flex items-center justify-center transition-colors">
                  <span className="text-sm font-heading font-bold text-[var(--color-slate-500)] group-hover:text-white transition-colors">
                    {String(index + 1).padStart(2, '0')}
                  </span>
                </div>

                {/* Content */}
                <div className="flex-1">
                  <h3 className="font-heading text-lg font-semibold text-[var(--color-slate-800)] group-hover:text-[var(--color-teal-700)] transition-colors">
                    {subCat}
                  </h3>
                  <p className="text-sm text-[var(--color-slate-500)]">
                    Practice worksheets with easy, medium, and hard levels
                  </p>
                </div>

                {/* Arrow */}
                <div className="flex items-center gap-2">
                  <span className="text-sm font-medium text-[var(--color-slate-400)] group-hover:text-[var(--color-teal-600)] transition-colors">
                    Start
                  </span>
                  <ChevronRight className="w-5 h-5 text-[var(--color-slate-400)] group-hover:text-[var(--color-teal-600)] group-hover:translate-x-1 transition-all" />
                </div>
              </Link>
            );
          })}
        </div>

        {/* Back Button */}
        <div className="mt-10 animate-fade-in-up delay-300">
          <Link
            to="/"
            className="inline-flex items-center gap-2 px-5 py-3 rounded-xl bg-[var(--color-slate-100)] hover:bg-[var(--color-slate-200)] text-[var(--color-slate-700)] font-medium transition-colors"
          >
            <ArrowLeft className="w-4 h-4" />
            <span>Back to All Topics</span>
          </Link>
        </div>
      </div>
    </div>
  );
}
