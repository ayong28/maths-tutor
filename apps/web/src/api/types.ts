/**
 * API type definitions
 * Matches the backend API response types
 */

export type ProblemType =
  | 'FRACTION_ADDITION'
  | 'FRACTION_SUBTRACTION'
  | 'FRACTION_REDUCTION'
  | 'FRACTION_MULTIPLICATION'
  | 'FRACTION_DIVISION'
  | 'ALGEBRA_COLLECTING_TERMS'
  | 'ALGEBRA_MULTIPLICATION';

export type Difficulty = 'EASY' | 'MEDIUM' | 'HARD';

export type CategoryInfo = {
  type: ProblemType;
  count: number;
  displayName: string;
};

export type Problem = {
  id: string;
  createdAt: string;
  updatedAt: string;
  question: string;
  answer: string;
  type: ProblemType;
  difficulty: Difficulty;
  tags: string[];
  sourceWorksheet: string | null;
  sourceProblemNumber: number | null;
  hasVariables: boolean;
  hasFractions: boolean;
  hasMixedNumbers: boolean;
  denominators: number[];
  requiresLCD: boolean;
};

export type ProblemFilters = {
  type?: ProblemType;
  difficulty?: Difficulty[];
  tags?: string[];
  limit?: number;
  seed?: string;
};
