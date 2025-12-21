import { useState, useEffect, useMemo } from 'react';
import { getProblems, ApiError, type Problem, type ProblemFilters } from '@/api';

type UseProblemsResult = {
  data: Problem[] | null;
  loading: boolean;
  error: string | null;
  refetch: () => void;
};

/**
 * Custom hook to fetch problems from the API with optional filters
 *
 * @param {ProblemFilters} filters - Optional filters for type, difficulty, tags, limit, and seed
 * @returns {UseProblemsResult} Object containing data, loading state, error, and refetch function
 *
 * @example
 * ```tsx
 * function WorksheetView() {
 *   const { data: problems, loading, error } = useProblems({
 *     type: 'FRACTION_ADDITION',
 *     difficulty: ['EASY', 'MEDIUM'],
 *     limit: 15,
 *   });
 *
 *   if (loading) return <div>Loading problems...</div>;
 *   if (error) return <div>Error: {error}</div>;
 *
 *   return (
 *     <div>
 *       {problems?.map(problem => (
 *         <div key={problem.id}>{problem.question}</div>
 *       ))}
 *     </div>
 *   );
 * }
 * ```
 */
export function useProblems(filters: ProblemFilters = {}): UseProblemsResult {
  const [data, setData] = useState<Problem[] | null>(null);
  const [loading, setLoading] = useState<boolean>(true);
  const [error, setError] = useState<string | null>(null);
  const [refetchTrigger, setRefetchTrigger] = useState<number>(0);

  // Create a stable filter key to prevent unnecessary re-renders
  // when array references change but values remain identical
  const filterKey = useMemo(() => {
    return JSON.stringify({
      type: filters.type,
      difficulty: filters.difficulty?.sort(),
      tags: filters.tags?.sort(),
      limit: filters.limit,
      seed: filters.seed,
    });
  }, [filters.type, filters.difficulty, filters.tags, filters.limit, filters.seed]);

  useEffect(() => {
    let isMounted = true;

    async function fetchProblems(): Promise<void> {
      try {
        setLoading(true);
        setError(null);

        const problems = await getProblems(filters);

        if (isMounted) {
          setData(problems);
        }
      } catch (err) {
        if (isMounted) {
          if (err instanceof ApiError) {
            setError(err.message);
          } else if (err instanceof Error) {
            setError(err.message);
          } else {
            setError('An unknown error occurred');
          }
        }
      } finally {
        if (isMounted) {
          setLoading(false);
        }
      }
    }

    fetchProblems();

    // Cleanup function to prevent state updates on unmounted component
    return () => {
      isMounted = false;
    };
  }, [filterKey, refetchTrigger, filters]);

  const refetch = (): void => {
    setRefetchTrigger(prev => prev + 1);
  };

  return { data, loading, error, refetch };
}
