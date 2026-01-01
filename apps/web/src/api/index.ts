/**
 * API Client
 * Central exports for all API-related functionality
 */

export { getCategories, getProblems, getTags } from './client';
export {
  type CategoryInfo,
  type Problem,
  type ProblemFilters,
  type ProblemType,
  type Difficulty,
} from './types';
