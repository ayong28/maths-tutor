import { type ProblemType, type CategoryInfo } from '@/api';

// Cache for the type map (built once from API data)
let cachedTypeMap: Record<string, Record<string, ProblemType>> | null = null;

/**
 * Convert string to URL-friendly slug
 * "Fractions" → "fractions"
 * "Linear Graphs" → "linear-graphs"
 * "Ratio & Rates" → "ratio-rates"
 */
function toSlug(str: string): string {
  return str
    .toLowerCase()
    .replace(/\s+/g, '-')       // spaces to hyphens
    .replace(/&/g, '')          // remove ampersands
    .replace(/[^a-z0-9-]/g, '') // remove special chars
    .replace(/-+/g, '-')        // collapse multiple hyphens
    .replace(/^-|-$/g, '');     // trim hyphens
}

/**
 * Build TYPE_MAP from categories data
 * This auto-generates URL mappings from the API
 */
export function buildTypeMap(categories: CategoryInfo[]): Record<string, Record<string, ProblemType>> {
  const typeMap: Record<string, Record<string, ProblemType>> = {};

  categories.forEach((cat) => {
    const categorySlug = toSlug(cat.mainCategory);
    const subcategorySlug = toSlug(cat.subCategory);

    if (!typeMap[categorySlug]) {
      typeMap[categorySlug] = {};
    }

    typeMap[categorySlug][subcategorySlug] = cat.type;
  });

  return typeMap;
}

/**
 * Get ProblemType from URL params
 * Uses cached type map if available
 */
export function getProblemType(
  category: string,
  subcategory: string,
  typeMap?: Record<string, Record<string, ProblemType>>
): ProblemType | null {
  // Use provided typeMap or cached version
  const map = typeMap || cachedTypeMap;

  if (!map) {
    console.error('TYPE_MAP not initialized. Call buildTypeMap() first.');
    return null;
  }

  return map[category]?.[subcategory] || null;
}

/**
 * Set cached type map (call this once when app loads)
 */
export function setCachedTypeMap(typeMap: Record<string, Record<string, ProblemType>>): void {
  cachedTypeMap = typeMap;
}

/**
 * Get cached type map
 */
export function getCachedTypeMap(): Record<string, Record<string, ProblemType>> | null {
  return cachedTypeMap;
}