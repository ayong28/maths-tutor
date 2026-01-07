import { Difficulty, ProblemType } from '../../generated/prisma';

/**
 * Criteria for selecting problems from the database
 */
export interface SelectionCriteria {
  type: ProblemType;
  totalCount: number;
  difficultyMix: DifficultyMix;
  requiredTags?: string[];
  excludedTags?: string[];
  seed?: string;
}

/**
 * Distribution of problems by difficulty level
 */
export interface DifficultyMix {
  easy: number;
  medium: number;
  hard: number;
}

/**
 * Problem data returned from selector (matches DB schema)
 */
export interface SelectedProblem {
  id: string;
  question: string;
  answer: string;
  type: ProblemType;
  difficulty: Difficulty;
  tags: string[];
}

/**
 * Result from ProblemSelector
 */
export interface SelectionResult {
  problems: SelectedProblem[];
  metadata: {
    type: ProblemType;
    totalSelected: number;
    byDifficulty: DifficultyMix;
    seed?: string;
  };
}

/**
 * Default difficulty distribution (matches original worksheets)
 */
export const DEFAULT_DIFFICULTY_MIX: DifficultyMix = {
  easy: 10,
  medium: 10,
  hard: 10,
};

/**
 * Parse difficulty mix from CLI string format "easy:10,medium:15,hard:5"
 */
export function parseDifficultyMix(input: string): DifficultyMix {
  const mix: DifficultyMix = { easy: 0, medium: 0, hard: 0 };

  const parts = input.split(',');
  for (const part of parts) {
    const [level, countStr] = part.trim().split(':');
    const count = parseInt(countStr || '0', 10);

    if (level === 'easy' || level === 'medium' || level === 'hard') {
      mix[level] = count;
    }
  }

  return mix;
}

/**
 * Validate that difficulty mix totals to expected count
 */
export function validateDifficultyMix(mix: DifficultyMix, expectedTotal: number): void {
  const total = mix.easy + mix.medium + mix.hard;
  if (total !== expectedTotal) {
    throw new Error(
      `Difficulty mix totals ${total}, expected ${expectedTotal}. ` +
      `Got easy:${mix.easy}, medium:${mix.medium}, hard:${mix.hard}`
    );
  }
}
