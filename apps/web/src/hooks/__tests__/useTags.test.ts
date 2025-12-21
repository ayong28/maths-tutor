import { renderHook, waitFor, act } from '@testing-library/react';
import { useTags } from '../useTags';
import { getTags, ApiError } from '@/api';
import type { ProblemType } from '@/api';

// Mock the API client
jest.mock('@/api', () => ({
  getTags: jest.fn(),
  ApiError: class ApiError extends Error {
    constructor(message: string) {
      super(message);
      this.name = 'ApiError';
    }
  },
}));

const mockGetTags = getTags as jest.MockedFunction<typeof getTags>;

describe('useTags', () => {
  const mockTagsData: string[] = [
    'like-denominators',
    'unlike-denominators',
    'set-1',
    'set-2',
  ];

  beforeEach(() => {
    jest.clearAllMocks();
  });

  describe('Initial fetch with type', () => {
    it('should start with loading state when type is provided', () => {
      mockGetTags.mockImplementation(
        () => new Promise(() => {}) // Never resolves
      );

      const { result } = renderHook(() => useTags('FRACTION_ADDITION'));

      expect(result.current.loading).toBe(true);
      expect(result.current.data).toBeNull();
      expect(result.current.error).toBeNull();
    });

    it('should fetch tags successfully on mount', async () => {
      mockGetTags.mockResolvedValue(mockTagsData);

      const { result } = renderHook(() => useTags('FRACTION_ADDITION'));

      expect(result.current.loading).toBe(true);

      await waitFor(() => {
        expect(result.current.loading).toBe(false);
      });

      expect(result.current.data).toEqual(mockTagsData);
      expect(result.current.error).toBeNull();
      expect(mockGetTags).toHaveBeenCalledTimes(1);
      expect(mockGetTags).toHaveBeenCalledWith('FRACTION_ADDITION');
    });

    it('should handle API errors', async () => {
      const errorMessage = 'Failed to fetch tags';
      mockGetTags.mockRejectedValue(new ApiError(errorMessage));

      const { result } = renderHook(() => useTags('FRACTION_ADDITION'));

      await waitFor(() => {
        expect(result.current.loading).toBe(false);
      });

      expect(result.current.data).toBeNull();
      expect(result.current.error).toBe(errorMessage);
      expect(mockGetTags).toHaveBeenCalledTimes(1);
    });

    it('should handle generic Error objects', async () => {
      const errorMessage = 'Network error';
      mockGetTags.mockRejectedValue(new Error(errorMessage));

      const { result } = renderHook(() => useTags('FRACTION_ADDITION'));

      await waitFor(() => {
        expect(result.current.loading).toBe(false);
      });

      expect(result.current.data).toBeNull();
      expect(result.current.error).toBe(errorMessage);
    });

    it('should handle unknown error types', async () => {
      mockGetTags.mockRejectedValue('Unknown error');

      const { result } = renderHook(() => useTags('FRACTION_ADDITION'));

      await waitFor(() => {
        expect(result.current.loading).toBe(false);
      });

      expect(result.current.data).toBeNull();
      expect(result.current.error).toBe('An unknown error occurred');
    });
  });

  describe('Behavior when type is undefined', () => {
    it('should not fetch tags when type is undefined', () => {
      mockGetTags.mockResolvedValue(mockTagsData);

      const { result } = renderHook(() => useTags(undefined));

      expect(result.current.loading).toBe(false);
      expect(result.current.data).toBeNull();
      expect(result.current.error).toBeNull();
      expect(mockGetTags).not.toHaveBeenCalled();
    });

    it('should reset state when type becomes undefined', async () => {
      mockGetTags.mockResolvedValue(mockTagsData);

      const { result, rerender } = renderHook(
        ({ type }) => useTags(type),
        {
          initialProps: { type: 'FRACTION_ADDITION' as ProblemType | undefined },
        }
      );

      await waitFor(() => {
        expect(result.current.loading).toBe(false);
      });

      expect(result.current.data).toEqual(mockTagsData);
      expect(mockGetTags).toHaveBeenCalledTimes(1);

      // Change type to undefined
      rerender({ type: undefined });

      // Should reset state
      expect(result.current.loading).toBe(false);
      expect(result.current.data).toBeNull();
      expect(result.current.error).toBeNull();
      expect(mockGetTags).toHaveBeenCalledTimes(1); // Should not call again
    });
  });

  describe('Type changes trigger refetch', () => {
    it('should refetch when type changes', async () => {
      mockGetTags.mockResolvedValue(mockTagsData);

      const { result, rerender } = renderHook(
        ({ type }) => useTags(type),
        {
          initialProps: { type: 'FRACTION_ADDITION' as ProblemType },
        }
      );

      await waitFor(() => {
        expect(result.current.loading).toBe(false);
      });

      expect(mockGetTags).toHaveBeenCalledTimes(1);
      expect(mockGetTags).toHaveBeenCalledWith('FRACTION_ADDITION');

      // Change type
      const algebraTags = ['simple-terms', 'has-powers'];
      mockGetTags.mockResolvedValue(algebraTags);

      rerender({ type: 'ALGEBRA_COLLECTING_TERMS' as ProblemType });

      await waitFor(() => {
        expect(mockGetTags).toHaveBeenCalledTimes(2);
      });

      expect(mockGetTags).toHaveBeenLastCalledWith('ALGEBRA_COLLECTING_TERMS');

      await waitFor(() => {
        expect(result.current.data).toEqual(algebraTags);
      });
    });

    it('should not refetch when type remains the same', async () => {
      mockGetTags.mockResolvedValue(mockTagsData);

      const { result, rerender } = renderHook(
        ({ type }) => useTags(type),
        {
          initialProps: { type: 'FRACTION_ADDITION' as ProblemType },
        }
      );

      await waitFor(() => {
        expect(result.current.loading).toBe(false);
      });

      expect(mockGetTags).toHaveBeenCalledTimes(1);

      // Rerender with same type
      rerender({ type: 'FRACTION_ADDITION' as ProblemType });

      // Should not trigger another fetch
      await new Promise(resolve => setTimeout(resolve, 100));
      expect(mockGetTags).toHaveBeenCalledTimes(1);
    });

    it('should fetch when type changes from undefined to a value', async () => {
      mockGetTags.mockResolvedValue(mockTagsData);

      const { result, rerender } = renderHook(
        ({ type }) => useTags(type),
        {
          initialProps: { type: undefined as ProblemType | undefined },
        }
      );

      expect(result.current.loading).toBe(false);
      expect(mockGetTags).not.toHaveBeenCalled();

      // Change from undefined to a type
      rerender({ type: 'FRACTION_ADDITION' as ProblemType | undefined });

      await waitFor(() => {
        expect(result.current.loading).toBe(false);
      });

      expect(mockGetTags).toHaveBeenCalledTimes(1);
      expect(mockGetTags).toHaveBeenCalledWith('FRACTION_ADDITION');
      expect(result.current.data).toEqual(mockTagsData);
    });
  });

  describe('Refetch functionality', () => {
    it('should refetch tags when refetch is called', async () => {
      mockGetTags.mockResolvedValue(mockTagsData);

      const { result } = renderHook(() => useTags('FRACTION_ADDITION'));

      await waitFor(() => {
        expect(result.current.loading).toBe(false);
      });

      expect(mockGetTags).toHaveBeenCalledTimes(1);

      // Call refetch
      act(() => {
        result.current.refetch();
      });

      await waitFor(() => {
        expect(mockGetTags).toHaveBeenCalledTimes(2);
      });

      expect(result.current.data).toEqual(mockTagsData);
      expect(result.current.error).toBeNull();
    });

    it('should reset error state on refetch', async () => {
      // First call fails
      mockGetTags.mockRejectedValueOnce(new ApiError('Network error'));

      const { result } = renderHook(() => useTags('FRACTION_ADDITION'));

      await waitFor(() => {
        expect(result.current.error).toBe('Network error');
      });

      // Second call succeeds
      mockGetTags.mockResolvedValueOnce(mockTagsData);

      act(() => {
        result.current.refetch();
      });

      await waitFor(() => {
        expect(result.current.loading).toBe(false);
      });

      expect(result.current.data).toEqual(mockTagsData);
      expect(result.current.error).toBeNull();
    });

    it('should not refetch if type is undefined when refetch is called', async () => {
      mockGetTags.mockResolvedValue(mockTagsData);

      const { result } = renderHook(() => useTags(undefined));

      expect(mockGetTags).not.toHaveBeenCalled();

      // Call refetch
      act(() => {
        result.current.refetch();
      });

      // Wait a bit
      await new Promise(resolve => setTimeout(resolve, 100));

      // Should still not have been called
      expect(mockGetTags).not.toHaveBeenCalled();
    });

    it('should set loading state during refetch', async () => {
      mockGetTags.mockResolvedValue(mockTagsData);

      const { result } = renderHook(() => useTags('FRACTION_ADDITION'));

      await waitFor(() => {
        expect(result.current.loading).toBe(false);
      });

      // Make refetch hang
      mockGetTags.mockImplementation(
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

      let resolvePromise: (value: string[]) => void;
      const delayedPromise = new Promise<string[]>((resolve) => {
        resolvePromise = resolve;
      });

      mockGetTags.mockReturnValue(delayedPromise);

      const { result, unmount } = renderHook(() => useTags('FRACTION_ADDITION'));

      expect(result.current.loading).toBe(true);

      // Unmount before promise resolves
      unmount();

      // Resolve promise after unmount
      resolvePromise!(mockTagsData);

      // Wait a bit to ensure no state updates happen
      await new Promise(resolve => setTimeout(resolve, 100));

      // Should not have any console errors from state updates on unmounted component
      expect(consoleErrorSpy).not.toHaveBeenCalled();

      consoleErrorSpy.mockRestore();
    });
  });

  describe('Edge cases', () => {
    it('should handle empty tags array', async () => {
      mockGetTags.mockResolvedValue([]);

      const { result } = renderHook(() => useTags('FRACTION_ADDITION'));

      await waitFor(() => {
        expect(result.current.loading).toBe(false);
      });

      expect(result.current.data).toEqual([]);
      expect(result.current.error).toBeNull();
    });

    it('should handle different problem types correctly', async () => {
      const types: ProblemType[] = [
        'FRACTION_ADDITION',
        'FRACTION_SUBTRACTION',
        'FRACTION_REDUCTION',
        'ALGEBRA_COLLECTING_TERMS',
        'ALGEBRA_MULTIPLICATION',
      ];

      for (const type of types) {
        mockGetTags.mockResolvedValue([`tag-${type}`]);

        const { result } = renderHook(() => useTags(type));

        await waitFor(() => {
          expect(result.current.loading).toBe(false);
        });

        expect(mockGetTags).toHaveBeenCalledWith(type);
        expect(result.current.data).toEqual([`tag-${type}`]);

        jest.clearAllMocks();
      }
    });

    it('should provide refetch function that can be called multiple times', async () => {
      mockGetTags.mockResolvedValue(mockTagsData);

      const { result } = renderHook(() => useTags('FRACTION_ADDITION'));

      await waitFor(() => {
        expect(result.current.loading).toBe(false);
      });

      act(() => {
        result.current.refetch();
      });

      await waitFor(() => {
        expect(mockGetTags).toHaveBeenCalledTimes(2);
      });

      act(() => {
        result.current.refetch();
      });

      await waitFor(() => {
        expect(mockGetTags).toHaveBeenCalledTimes(3);
      });

      act(() => {
        result.current.refetch();
      });

      await waitFor(() => {
        expect(mockGetTags).toHaveBeenCalledTimes(4); // 1 initial + 3 refetches
      });
    });
  });
});
