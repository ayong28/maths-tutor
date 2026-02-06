/**
 * TanStack Query Configuration
 *
 * Provides smart caching for server state (categories, problems, tags).
 * Integrates with React Router 7 loaders for optimal performance.
 */

import { QueryClient } from '@tanstack/react-query';

export const queryClient = new QueryClient({
  defaultOptions: {
    queries: {
      // Data stays fresh for 5 minutes (no refetch during this time)
      staleTime: 5 * 60 * 1000,
      // Keep unused data in cache for 10 minutes before garbage collection
      gcTime: 10 * 60 * 1000,
      // Refetch when window regains focus (silent background update)
      refetchOnWindowFocus: true,
      // Don't refetch on component mount if data is fresh
      refetchOnMount: false,
      // Retry failed requests once
      retry: 1,
    },
  },
});

/**
 * Query Keys - Centralized for easy invalidation
 */
export const queryKeys = {
  categories: ['categories'] as const,
  problems: (type: string, filters?: Record<string, unknown>) =>
    ['problems', type, filters] as const,
  tags: (type: string) => ['tags', type] as const,
};
