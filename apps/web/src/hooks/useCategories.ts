import { useState, useEffect } from 'react';
import { getCategories, ApiError, type CategoryInfo } from '@/api';

type UseCategoriesResult = {
  data: CategoryInfo[] | null;
  loading: boolean;
  error: string | null;
  refetch: () => void;
};

/**
 * Custom hook to fetch problem categories from the API
 *
 * @returns {UseCategoriesResult} Object containing data, loading state, error, and refetch function
 *
 * @example
 * ```tsx
 * function MyComponent() {
 *   const { data: categories, loading, error, refetch } = useCategories();
 *
 *   if (loading) return <div>Loading...</div>;
 *   if (error) return <div>Error: {error}</div>;
 *
 *   return (
 *     <div>
 *       {categories?.map(cat => (
 *         <div key={cat.type}>{cat.displayName} ({cat.count})</div>
 *       ))}
 *     </div>
 *   );
 * }
 * ```
 */
export function useCategories(): UseCategoriesResult {
  const [data, setData] = useState<CategoryInfo[] | null>(null);
  const [loading, setLoading] = useState<boolean>(true);
  const [error, setError] = useState<string | null>(null);
  const [refetchTrigger, setRefetchTrigger] = useState<number>(0);

  useEffect(() => {
    let isMounted = true;

    async function fetchCategories() {
      try {
        setLoading(true);
        setError(null);

        const categories = await getCategories();

        if (isMounted) {
          setData(categories);
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

    fetchCategories();

    // Cleanup function to prevent state updates on unmounted component
    return () => {
      isMounted = false;
    };
  }, [refetchTrigger]);

  const refetch = () => {
    setRefetchTrigger(prev => prev + 1);
  };

  return { data, loading, error, refetch };
}
