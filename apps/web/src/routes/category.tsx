/* eslint-disable react-refresh/only-export-components */
import { useMemo } from 'react';
import { Link, redirect, useParams } from 'react-router';
import { useSuspenseQuery } from '@tanstack/react-query';
import { getCategories } from '@/api/client';
import { queryClient, queryKeys } from '@/lib/queryClient';
import { buildTypeMap, setCachedTypeMap, toSlug } from '@/utils/routing';
import { Loader2, ChevronRight, Home, ArrowLeft } from 'lucide-react';
import { getCategoryIcon, getCategoryTheme } from '@/config';

// Prefetch categories into TanStack Query cache
export async function clientLoader({
  params
}: {
  params: { category: string }
}) {
  // Prefetch categories (will use cache if fresh)
  await queryClient.prefetchQuery({
    queryKey: queryKeys.categories,
    queryFn: getCategories,
  });

  // Get cached data to validate category exists
  const categories = queryClient.getQueryData(queryKeys.categories) as Awaited<ReturnType<typeof getCategories>> | undefined;

  if (categories) {
    const validSlugs = new Set(categories.map(cat => toSlug(cat.mainCategory)));
    if (!validSlugs.has(params.category)) {
      throw redirect('/');
    }
  }

  return null;
}

// Loading fallback
export function HydrateFallback() {
  return (
    <div className="min-h-screen p-8">
      <div className="max-w-4xl mx-auto">
        <div className="flex items-center justify-center gap-3 py-24">
          <Loader2 className="w-8 h-8 animate-spin text-teal-500" />
          <p className="text-slate-500 font-medium">Loading worksheets...</p>
        </div>
      </div>
    </div>
  );
}

// Component uses TanStack Query (data served from cache)
export default function Category() {
  const { category } = useParams<{ category: string }>();

  // Get categories from TanStack Query cache (prefetched by loader)
  const { data: categories } = useSuspenseQuery({
    queryKey: queryKeys.categories,
    queryFn: getCategories,
  });

  // Transform categories into display structure (memoized)
  const { categoryDisplay, subcategories } = useMemo(() => {
    // Build and cache the TYPE_MAP
    const typeMap = buildTypeMap(categories);
    setCachedTypeMap(typeMap);

    // Build category map
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

    return {
      categoryDisplay: categoryMap[category!]?.display ?? '',
      subcategories: categoryMap[category!]?.subcategories ?? [],
    };
  }, [categories, category]);

  const theme = getCategoryTheme(categoryDisplay);
  const icon = getCategoryIcon(categoryDisplay);

  return (
    <div className="min-h-screen">
      {/* Header Section */}
      <div className="bg-linear-to-b from-slate-100 to-cream border-b border-slate-200">
        <div className="max-w-4xl mx-auto px-8 py-8">
          {/* Breadcrumb */}
          <nav className="flex items-center gap-2 text-sm mb-6 animate-fade-in-up">
            <Link
              to="/"
              className="flex items-center gap-1.5 text-slate-500 hover:text-teal-600 transition-colors"
            >
              <Home className="w-4 h-4" />
              <span>Home</span>
            </Link>
            <ChevronRight className="w-4 h-4 text-slate-400" />
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
              <h1 className="font-heading text-3xl md:text-4xl font-bold text-slate-800">
                {categoryDisplay}
              </h1>
              <p className="text-slate-500 mt-1">
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
                className="group flex items-center gap-4 p-5 bg-white rounded-2xl border border-slate-200 hover:border-teal-300 hover:shadow-md transition-all duration-200 animate-slide-in-left"
                style={{ animationDelay: `${index * 50}ms` }}
              >
                {/* Number indicator */}
                <div className="w-10 h-10 rounded-xl bg-slate-100 group-hover:bg-teal-500 flex items-center justify-center transition-colors">
                  <span className="text-sm font-heading font-bold text-slate-500 group-hover:text-white transition-colors">
                    {String(index + 1).padStart(2, '0')}
                  </span>
                </div>

                {/* Content */}
                <div className="flex-1">
                  <h3 className="font-heading text-lg font-semibold text-slate-800 group-hover:text-teal-700 transition-colors">
                    {subCat}
                  </h3>
                  <p className="text-sm text-slate-500">
                    Practice worksheets with easy, medium, and hard levels
                  </p>
                </div>

                {/* Arrow */}
                <div className="flex items-center gap-2">
                  <span className="text-sm font-medium text-slate-400 group-hover:text-teal-600 transition-colors">
                    Start
                  </span>
                  <ChevronRight className="w-5 h-5 text-slate-400 group-hover:text-teal-600 group-hover:translate-x-1 transition-all" />
                </div>
              </Link>
            );
          })}
        </div>

        {/* Back Button */}
        <div className="mt-10 animate-fade-in-up delay-300">
          <Link
            to="/"
            className="inline-flex items-center gap-2 px-5 py-3 rounded-xl bg-slate-100 hover:bg-slate-200 text-slate-700 font-medium transition-colors"
          >
            <ArrowLeft className="w-4 h-4" />
            <span>Back to All Topics</span>
          </Link>
        </div>
      </div>
    </div>
  );
}
