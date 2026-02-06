/**
 * TanStack Query hook for paginated problems
 *
 * Features:
 * - Query key includes page for independent cache per page
 * - Prefetches next page for instant navigation
 * - Uses placeholderData for smooth page transitions
 */

import { useQuery, useQueryClient, keepPreviousData } from '@tanstack/react-query';
import { useEffect } from 'react';
import { getProblems } from '@/api/client';
import { type ProblemFilters, type PaginatedProblems } from '@/api/types';
import { queryKeys } from '@/lib/queryClient';

type UseProblemsQueryParams = {
  type: string;
  difficulty?: string[];
  tags?: string[];
  page: number;
  pageSize?: number;
};

const DEFAULT_PAGE_SIZE = 20;

export function useProblemsQuery({
  type,
  difficulty,
  tags,
  page,
  pageSize = DEFAULT_PAGE_SIZE,
}: UseProblemsQueryParams) {
  const queryClient = useQueryClient();
  const offset = (page - 1) * pageSize;

  const filters: ProblemFilters = {
    type: type as ProblemFilters['type'],
    difficulty: difficulty as ProblemFilters['difficulty'],
    tags,
    limit: pageSize,
    offset,
  };

  const queryKey = queryKeys.problems(type, { difficulty, tags, page, pageSize });

  const query = useQuery<PaginatedProblems>({
    queryKey,
    queryFn: () => getProblems(filters),
    placeholderData: keepPreviousData,
    staleTime: 5 * 60 * 1000,
  });

  // Prefetch next page
  useEffect(() => {
    if (query.data && page < query.data.totalPages) {
      const nextPageOffset = page * pageSize;
      const nextPageFilters: ProblemFilters = {
        ...filters,
        offset: nextPageOffset,
      };
      const nextPageQueryKey = queryKeys.problems(type, { difficulty, tags, page: page + 1, pageSize });

      queryClient.prefetchQuery({
        queryKey: nextPageQueryKey,
        queryFn: () => getProblems(nextPageFilters),
        staleTime: 5 * 60 * 1000,
      });
    }
  }, [query.data, page, pageSize, type, difficulty, tags, queryClient]);

  return {
    problems: query.data?.problems ?? [],
    total: query.data?.total ?? 0,
    page: query.data?.page ?? page,
    pageSize: query.data?.pageSize ?? pageSize,
    totalPages: query.data?.totalPages ?? 0,
    isLoading: query.isLoading,
    isFetching: query.isFetching,
    isPlaceholderData: query.isPlaceholderData,
    error: query.error,
  };
}
