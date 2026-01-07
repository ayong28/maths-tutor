import { prisma } from '../db/prisma';
import { ProblemType, Difficulty } from '../../generated/prisma';

export type ProblemFilters = {
  type?: ProblemType;
  difficulty?: Difficulty[];
  tags?: string[];
  limit?: number;
  seed?: string;
};

export type CategoryInfo = {
  type: ProblemType;
  count: number;
  displayName: string;
  mainCategory: string;
  subCategory: string;
};

/**
 * Get all problem types with counts
 */
export async function getCategories(): Promise<CategoryInfo[]> {
  const counts = await prisma.problem.groupBy({
    by: ['type'],
    _count: {
      type: true,
    },
  });

  return counts.map((item) => ({
    type: item.type,
    count: item._count.type,
    displayName: formatCategoryName(item.type),
    mainCategory: getMainCategory(item.type),
    subCategory: getSubCategory(item.type),
  }));
}

/**
 * Get problems with optional filters
 */
export async function getProblems(filters: ProblemFilters) {
  const { type, difficulty, tags, limit = 30, seed } = filters;

  // Build where clause
  const where: any = {};

  if (type) {
    where.type = type;
  }

  if (difficulty && difficulty.length > 0) {
    where.difficulty = { in: difficulty };
  }

  if (tags && tags.length > 0) {
    where.tags = { hasSome: tags };
  }

  // Fetch problems
  let problems = await prisma.problem.findMany({
    where,
    orderBy: { id: 'asc' },
  });

  // Apply seed-based shuffling if provided
  if (seed) {
    problems = seedShuffle(problems, seed);
  }

  // Apply limit
  return problems.slice(0, limit);
}

/**
 * Get unique tags for a problem type
 */
export async function getTagsForType(type: ProblemType): Promise<string[]> {
  const problems = await prisma.problem.findMany({
    where: { type },
    select: { tags: true },
  });

  const allTags = new Set<string>();
  problems.forEach((problem) => {
    problem.tags.forEach((tag) => allTags.add(tag));
  });

  return Array.from(allTags).sort();
}

/**
 * Special case overrides for category grouping
 * Only for types that can't be auto-derived from their enum name
 */
const CATEGORY_OVERRIDES: Partial<Record<ProblemType, { main: string; sub: string }>> = {
  // Single-word types that need proper grouping
  AREA: { main: 'Geometry', sub: 'Area' },
  ANGLES: { main: 'Geometry', sub: 'Angles' },
  PROBABILITY: { main: 'Statistics', sub: 'Probability' },
  DATA_ANALYSIS: { main: 'Statistics', sub: 'Data Analysis' },

  // Types with special subcategory grouping
  COORDINATES_PLOTTING: { main: 'Coordinates', sub: 'Plotting' },
  LINEAR_GRAPHING: { main: 'Linear Graphs', sub: 'Graphing' },
  RATIO_RATES: { main: 'Ratio & Rates', sub: 'Ratio & Rates' },
};

/**
 * Special display name overrides
 */
const DISPLAY_NAME_OVERRIDES: Partial<Record<ProblemType, string>> = {
  ALGEBRA_COLLECTING_TERMS: 'Collecting Like Terms',
  ALGEBRA_MULTIPLICATION: 'Algebraic Multiplication',
  COORDINATES_PLOTTING: 'Plotting Points',
  ALGEBRA_LINEAR_EQUATIONS_SIMPLE: 'Linear Equations (Simple)',
  ALGEBRA_LINEAR_EQUATIONS_COMPLEX: 'Linear Equations (Complex)',
};

/**
 * Capitalize first letter of each word
 */
function titleCase(str: string): string {
  return str
    .toLowerCase()
    .split(' ')
    .map(word => word.charAt(0).toUpperCase() + word.slice(1))
    .join(' ');
}

/**
 * Pluralize category name (Fraction -> Fractions, Index -> Index Notation)
 */
function pluralizeCategory(word: string): string {
  const SPECIAL_PLURALS: Record<string, string> = {
    'Index': 'Index Notation',
    'Percentage': 'Percentages',
  };

  if (SPECIAL_PLURALS[word]) return SPECIAL_PLURALS[word];

  // Standard pluralization: add 's' if not already plural
  if (!word.endsWith('s')) {
    return word + 's';
  }
  return word;
}

/**
 * Get main category from problem type
 * Auto-derives from enum name with override support
 */
function getMainCategory(type: ProblemType): string {
  if (CATEGORY_OVERRIDES[type]) {
    return CATEGORY_OVERRIDES[type]!.main;
  }

  // Auto-derive: take first word before underscore, titleCase, and pluralize
  const firstWord = type.split('_')[0];
  if (!firstWord) return 'Other';

  const capitalized = titleCase(firstWord);
  return pluralizeCategory(capitalized);
}

/**
 * Get subcategory from problem type
 * Auto-derives from enum name with override support
 */
function getSubCategory(type: ProblemType): string {
  if (CATEGORY_OVERRIDES[type]) {
    return CATEGORY_OVERRIDES[type]!.sub;
  }

  // Auto-derive: take all words after first underscore, titleCase them
  const parts = type.split('_').slice(1);
  if (parts.length === 0) return '';

  return titleCase(parts.join(' '));
}

/**
 * Format problem type for display
 * Auto-derives from enum name with override support
 */
function formatCategoryName(type: ProblemType): string {
  if (DISPLAY_NAME_OVERRIDES[type]) {
    return DISPLAY_NAME_OVERRIDES[type]!;
  }

  // Auto-derive: titleCase the whole thing with spaces
  return titleCase(type.replace(/_/g, ' '));
}

/**
 * Deterministic shuffle based on seed string
 */
function seedShuffle<T>(array: T[], seed: string): T[] {
  const copy = [...array];
  let hash = 0;

  // Simple hash function
  for (let i = 0; i < seed.length; i++) {
    hash = ((hash << 5) - hash + seed.charCodeAt(i)) | 0;
  }

  // Fisher-Yates shuffle with seeded random
  for (let i = copy.length - 1; i > 0; i--) {
    hash = ((hash * 9301) + 49297) % 233280;
    const j = Math.floor((hash / 233280) * (i + 1));
    [copy[i], copy[j]] = [copy[j]!, copy[i]!];
  }

  return copy;
}
