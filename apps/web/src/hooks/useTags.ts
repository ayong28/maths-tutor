import { useState, useEffect } from 'react';
import { getTags, ApiError, type ProblemType } from '@/api';

type UseTagsResult = {
  data: string[] | null;
  loading: boolean;
  error: string | null;
  refetch: () => void;
};

/**
 * Custom hook to fetch available tags for a specific problem type
 *
 * @param {ProblemType} type - The problem type to fetch tags for
 * @returns {UseTagsResult} Object containing data, loading state, error, and refetch function
 *
 * @example
 * ```tsx
 * function TagFilter() {
 *   const { data: tags, loading, error } = useTags('FRACTION_ADDITION');
 *
 *   if (loading) return <div>Loading tags...</div>;
 *   if (error) return <div>Error: {error}</div>;
 *
 *   return (
 *     <select>
 *       {tags?.map(tag => (
 *         <option key={tag} value={tag}>{tag}</option>
 *       ))}
 *     </select>
 *   );
 * }
 * ```
 */
export function useTags(type?: ProblemType): UseTagsResult {
  const [data, setData] = useState<string[] | null>(null);
  const [loading, setLoading] = useState<boolean>(false);
  const [error, setError] = useState<string | null>(null);
  const [refetchTrigger, setRefetchTrigger] = useState<number>(0);

  useEffect(() => {
    // Don't fetch if no type provided
    if (!type) {
      setData(null);
      setLoading(false);
      setError(null);
      return;
    }

    let isMounted = true;

    async function fetchTags() {
      try {
        setLoading(true);
        setError(null);

        const tags = await getTags(type);

        if (isMounted) {
          setData(tags);
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

    fetchTags();

    // Cleanup function to prevent state updates on unmounted component
    return () => {
      isMounted = false;
    };
  }, [type, refetchTrigger]);

  const refetch = () => {
    setRefetchTrigger(prev => prev + 1);
  };

  return { data, loading, error, refetch };
}
