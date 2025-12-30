import { prisma } from '../db/prisma';
import { ProblemType, Difficulty } from '../../../../generated/prisma';

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
 * Format problem type for display
 */
function formatCategoryName(type: ProblemType): string {
  const names: Partial<Record<ProblemType, string>> = {
    FRACTION_ADDITION: 'Fraction Addition',
    FRACTION_SUBTRACTION: 'Fraction Subtraction',
    FRACTION_REDUCTION: 'Fraction Reduction',
    FRACTION_MULTIPLICATION: 'Fraction Multiplication',
    FRACTION_DIVISION: 'Fraction Division',
    ALGEBRA_COLLECTING_TERMS: 'Collecting Like Terms',
    ALGEBRA_MULTIPLICATION: 'Algebraic Multiplication',
  };
  return names[type] || type.replace(/_/g, ' ');
}

/**
 * Get main category from problem type (e.g., FRACTION_ADDITION -> Fractions)
 */
function getMainCategory(type: ProblemType): string {
  const firstWord = type.split('_')[0];
  return firstWord ? firstWord.toLowerCase().replace(/^\w/, c => c.toUpperCase()) : 'Other';
}

/**
 * Get subcategory from problem type (e.g., FRACTION_ADDITION -> Addition)
 */
function getSubCategory(type: ProblemType): string {
  const parts = type.split('_').slice(1);
  return parts
    .join(' ')
    .toLowerCase()
    .replace(/\b\w/g, c => c.toUpperCase());
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
