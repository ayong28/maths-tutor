/**
 * Application configuration constants
 */

export const UI_CONFIG = {
  DEFAULT_PROBLEM_LIMIT: 20,
  MAX_TAG_LIST_HEIGHT: 48, // in rem units for max-h-48
  PRINT_PAGE_SIZE: 'A4' as const,
  PRINT_MARGIN: '1cm',
} as const;

export const DIFFICULTY_LEVELS = ['EASY', 'MEDIUM', 'HARD'] as const;
