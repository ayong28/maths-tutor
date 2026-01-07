import { Difficulty, ProblemType } from '../../generated/prisma';
import { prisma } from '../../src/db/prisma';
import {
  SelectionCriteria,
  SelectedProblem,
  SelectionResult,
  DifficultyMix,
} from '../cli/worksheet.types';

/**
 * Simple seeded random number generator (mulberry32)
 * Produces deterministic sequence from a seed string
 */
function createSeededRandom(seed: string): () => number {
  // Hash string to number
  let h = 0;
  for (let i = 0; i < seed.length; i++) {
    h = Math.imul(31, h) + seed.charCodeAt(i) | 0;
  }

  // mulberry32 PRNG
  return function () {
    h |= 0;
    h = h + 0x6D2B79F5 | 0;
    let t = Math.imul(h ^ h >>> 15, 1 | h);
    t = t + Math.imul(t ^ t >>> 7, 61 | t) ^ t;
    return ((t ^ t >>> 14) >>> 0) / 4294967296;
  };
}

/**
 * Shuffle array using Fisher-Yates with optional seeded randomness
 */
function shuffleArray<T>(array: T[], random: () => number): T[] {
  const result = [...array];
  for (let i = result.length - 1; i > 0; i--) {
    const j = Math.floor(random() * (i + 1));
    [result[i], result[j]] = [result[j]!, result[i]!];
  }
  return result;
}

/**
 * Select problems from database by difficulty level
 */
async function selectByDifficulty(
  type: ProblemType,
  difficulty: Difficulty,
  count: number,
  requiredTags?: string[],
  excludedTags?: string[],
  random?: () => number
): Promise<SelectedProblem[]> {
  if (count === 0) return [];

  // Build where clause
  const where: {
    type: ProblemType;
    difficulty: Difficulty;
    tags?: { hasEvery?: string[]; hasSome?: string[] };
    NOT?: { tags: { hasSome: string[] } };
  } = {
    type,
    difficulty,
  };

  if (requiredTags && requiredTags.length > 0) {
    where.tags = { hasEvery: requiredTags };
  }

  if (excludedTags && excludedTags.length > 0) {
    where.NOT = { tags: { hasSome: excludedTags } };
  }

  // Fetch all matching problems
  const problems = await prisma.problem.findMany({
    where,
    select: {
      id: true,
      question: true,
      answer: true,
      type: true,
      difficulty: true,
      tags: true,
    },
  });

  if (problems.length < count) {
    throw new Error(
      `Not enough ${difficulty} problems of type ${type}. ` +
      `Needed ${count}, found ${problems.length}.`
    );
  }

  // Shuffle and take required count
  const randomFn = random || Math.random;
  const shuffled = shuffleArray(problems, randomFn);

  return shuffled.slice(0, count);
}

/**
 * Main function to select problems based on criteria
 */
export async function selectProblems(
  criteria: SelectionCriteria
): Promise<SelectionResult> {
  const { type, difficultyMix, requiredTags, excludedTags, seed } = criteria;

  // Create random function (seeded or not)
  const random = seed ? createSeededRandom(seed) : Math.random;

  // Select problems for each difficulty level
  const [easyProblems, mediumProblems, hardProblems] = await Promise.all([
    selectByDifficulty(type, 'EASY', difficultyMix.easy, requiredTags, excludedTags, random),
    selectByDifficulty(type, 'MEDIUM', difficultyMix.medium, requiredTags, excludedTags, random),
    selectByDifficulty(type, 'HARD', difficultyMix.hard, requiredTags, excludedTags, random),
  ]);

  // Combine in order: easy first, then medium, then hard
  const problems = [...easyProblems, ...mediumProblems, ...hardProblems];

  // Build result
  const actualMix: DifficultyMix = {
    easy: easyProblems.length,
    medium: mediumProblems.length,
    hard: hardProblems.length,
  };

  return {
    problems,
    metadata: {
      type,
      totalSelected: problems.length,
      byDifficulty: actualMix,
      seed,
    },
  };
}

/**
 * Get available problem counts by type and difficulty
 * Useful for CLI to show what's available
 */
export async function getAvailableCounts(type?: ProblemType): Promise<
  Array<{ type: ProblemType; difficulty: Difficulty; count: number }>
> {
  const groupBy = await prisma.problem.groupBy({
    by: ['type', 'difficulty'],
    _count: { id: true },
    ...(type ? { where: { type } } : {}),
  });

  return groupBy.map((g) => ({
    type: g.type,
    difficulty: g.difficulty,
    count: g._count.id,
  }));
}

/**
 * Get unique tags for a problem type
 */
export async function getAvailableTags(type: ProblemType): Promise<string[]> {
  const problems = await prisma.problem.findMany({
    where: { type },
    select: { tags: true },
  });

  const tagSet = new Set<string>();
  for (const p of problems) {
    for (const tag of p.tags) {
      tagSet.add(tag);
    }
  }

  return Array.from(tagSet).sort();
}
