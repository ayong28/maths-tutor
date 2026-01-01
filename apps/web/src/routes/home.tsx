/* eslint-disable react-refresh/only-export-components */
import { useLoaderData, Link } from 'react-router';
import { getCategories } from '@/api/client';
import { buildTypeMap, setCachedTypeMap } from '@/utils/routing';
import HeroSection from '@/components/HeroSection';
import { Loader2 } from 'lucide-react';

// Type for loader data
type LoaderData = Awaited<ReturnType<typeof clientLoader>>;

// Fetch data before rendering
export async function clientLoader() {
  const categories = await getCategories();

  // Build and cache the TYPE_MAP for use in other routes
  const typeMap = buildTypeMap(categories);
  setCachedTypeMap(typeMap);

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

// Component uses useLoaderData hook
export default function Home() {
  const { categoryList, categoryInfo } = useLoaderData<LoaderData>();

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