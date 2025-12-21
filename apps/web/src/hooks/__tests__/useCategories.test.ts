import { renderHook, waitFor, act } from '@testing-library/react';
import { useCategories } from '../useCategories';
import { getCategories, ApiError } from '@/api';
import type { CategoryInfo } from '@/api';

// Mock the API client
jest.mock('@/api', () => ({
  getCategories: jest.fn(),
  ApiError: class ApiError extends Error {
    constructor(message: string) {
      super(message);
      this.name = 'ApiError';
    }
  },
}));

const mockGetCategories = getCategories as jest.MockedFunction<typeof getCategories>;

describe('useCategories', () => {
  const mockCategoriesData: CategoryInfo[] = [
    {
      type: 'FRACTION_ADDITION',
      count: 210,
      displayName: 'Fraction Addition',
    },
    {
      type: 'FRACTION_SUBTRACTION',
      count: 210,
      displayName: 'Fraction Subtraction',
    },
    {
      type: 'ALGEBRA_COLLECTING_TERMS',
      count: 150,
      displayName: 'Collecting Like Terms',
    },
  ];

  beforeEach(() => {
    jest.clearAllMocks();
  });

  describe('Initial fetch', () => {
    it('should start with loading state', () => {
      mockGetCategories.mockImplementation(
        () => new Promise(() => {}) // Never resolves
      );

      const { result } = renderHook(() => useCategories());

      expect(result.current.loading).toBe(true);
      expect(result.current.data).toBeNull();
      expect(result.current.error).toBeNull();
    });

    it('should fetch categories successfully on mount', async () => {
      mockGetCategories.mockResolvedValue(mockCategoriesData);

      const { result } = renderHook(() => useCategories());

      expect(result.current.loading).toBe(true);

      await waitFor(() => {
        expect(result.current.loading).toBe(false);
      });

      expect(result.current.data).toEqual(mockCategoriesData);
      expect(result.current.error).toBeNull();
      expect(mockGetCategories).toHaveBeenCalledTimes(1);
    });

    it('should handle API errors', async () => {
      const errorMessage = 'Failed to fetch categories';
      mockGetCategories.mockRejectedValue(new ApiError(errorMessage));

      const { result } = renderHook(() => useCategories());

      await waitFor(() => {
        expect(result.current.loading).toBe(false);
      });

      expect(result.current.data).toBeNull();
      expect(result.current.error).toBe(errorMessage);
      expect(mockGetCategories).toHaveBeenCalledTimes(1);
    });

    it('should handle generic Error objects', async () => {
      const errorMessage = 'Network error';
      mockGetCategories.mockRejectedValue(new Error(errorMessage));

      const { result } = renderHook(() => useCategories());

      await waitFor(() => {
        expect(result.current.loading).toBe(false);
      });

      expect(result.current.data).toBeNull();
      expect(result.current.error).toBe(errorMessage);
    });

    it('should handle unknown error types', async () => {
      mockGetCategories.mockRejectedValue('Unknown error');

      const { result } = renderHook(() => useCategories());

      await waitFor(() => {
        expect(result.current.loading).toBe(false);
      });

      expect(result.current.data).toBeNull();
      expect(result.current.error).toBe('An unknown error occurred');
    });
  });

  describe('Refetch functionality', () => {
    it('should refetch categories when refetch is called', async () => {
      mockGetCategories.mockResolvedValue(mockCategoriesData);

      const { result } = renderHook(() => useCategories());

      await waitFor(() => {
        expect(result.current.loading).toBe(false);
      });

      expect(mockGetCategories).toHaveBeenCalledTimes(1);

      // Call refetch
      act(() => {
        result.current.refetch();
      });

      await waitFor(() => {
        expect(mockGetCategories).toHaveBeenCalledTimes(2);
      });

      expect(result.current.data).toEqual(mockCategoriesData);
      expect(result.current.error).toBeNull();
    });

    it('should reset error state on refetch', async () => {
      // First call fails
      mockGetCategories.mockRejectedValueOnce(new ApiError('Network error'));

      const { result } = renderHook(() => useCategories());

      await waitFor(() => {
        expect(result.current.error).toBe('Network error');
      });

      // Second call succeeds
      mockGetCategories.mockResolvedValueOnce(mockCategoriesData);

      act(() => {
        result.current.refetch();
      });

      await waitFor(() => {
        expect(result.current.loading).toBe(false);
      });

      expect(result.current.data).toEqual(mockCategoriesData);
      expect(result.current.error).toBeNull();
    });

    it('should set loading state during refetch', async () => {
      mockGetCategories.mockResolvedValue(mockCategoriesData);

      const { result } = renderHook(() => useCategories());

      await waitFor(() => {
        expect(result.current.loading).toBe(false);
      });

      // Make refetch hang
      mockGetCategories.mockImplementation(
        () => new Promise(() => {}) // Never resolves
      );

      act(() => {
        result.current.refetch();
      });

      await waitFor(() => {
        expect(result.current.loading).toBe(true);
      });
    });
  });

  describe('Cleanup on unmount', () => {
    it('should not update state after unmount', async () => {
      const consoleErrorSpy = jest.spyOn(console, 'error').mockImplementation();

      let resolvePromise: (value: CategoryInfo[]) => void;
      const delayedPromise = new Promise<CategoryInfo[]>((resolve) => {
        resolvePromise = resolve;
      });

      mockGetCategories.mockReturnValue(delayedPromise);

      const { result, unmount } = renderHook(() => useCategories());

      expect(result.current.loading).toBe(true);

      // Unmount before promise resolves
      unmount();

      // Resolve promise after unmount
      resolvePromise!(mockCategoriesData);

      // Wait a bit to ensure no state updates happen
      await new Promise(resolve => setTimeout(resolve, 100));

      // Should not have any console errors from state updates on unmounted component
      expect(consoleErrorSpy).not.toHaveBeenCalled();

      consoleErrorSpy.mockRestore();
    });
  });

  describe('Edge cases', () => {
    it('should handle empty categories array', async () => {
      mockGetCategories.mockResolvedValue([]);

      const { result } = renderHook(() => useCategories());

      await waitFor(() => {
        expect(result.current.loading).toBe(false);
      });

      expect(result.current.data).toEqual([]);
      expect(result.current.error).toBeNull();
    });

    it('should provide refetch function that can be called multiple times', async () => {
      mockGetCategories.mockResolvedValue(mockCategoriesData);

      const { result } = renderHook(() => useCategories());

      await waitFor(() => {
        expect(result.current.loading).toBe(false);
      });

      act(() => {
        result.current.refetch();
      });

      await waitFor(() => {
        expect(mockGetCategories).toHaveBeenCalledTimes(2);
      });

      act(() => {
        result.current.refetch();
      });

      await waitFor(() => {
        expect(mockGetCategories).toHaveBeenCalledTimes(3);
      });

      act(() => {
        result.current.refetch();
      });

      await waitFor(() => {
        expect(mockGetCategories).toHaveBeenCalledTimes(4); // 1 initial + 3 refetches
      });
    });
  });
});
