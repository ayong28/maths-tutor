/* eslint-disable react-refresh/only-export-components */
import { useLoaderData, Link, redirect } from 'react-router';
import { getCategories } from '@/api/client';
import { buildTypeMap, getCachedTypeMap, setCachedTypeMap } from '@/utils/routing';
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
export default function Category() {
  const { category, categoryDisplay, subcategories } = useLoaderData<LoaderData>();

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