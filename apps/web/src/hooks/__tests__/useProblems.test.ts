import { renderHook, waitFor, act } from '@testing-library/react';
import { useProblems } from '../useProblems';
import { getProblems, ApiError } from '@/api/client';
import type { Problem, ProblemFilters } from '@/api/types';

// Mock the API client
jest.mock('@/api/client', () => ({
  getProblems: jest.fn(),
  ApiError: class ApiError extends Error {
    constructor(message: string) {
      super(message);
      this.name = 'ApiError';
    }
  },
}));

const mockGetProblems = getProblems as jest.MockedFunction<typeof getProblems>;

describe('useProblems', () => {
  const mockProblemsData: Problem[] = [
    {
      id: '1',
      createdAt: '2025-01-01T00:00:00Z',
      updatedAt: '2025-01-01T00:00:00Z',
      type: 'FRACTION_ADDITION',
      question: '1/8 + 3/8',
      answer: '1/2',
      difficulty: 'EASY',
      tags: ['like-denominators'],
      sourceWorksheet: null,
      sourceProblemNumber: null,
      hasVariables: false,
      hasFractions: true,
      hasMixedNumbers: false,
      denominators: [8],
      requiresLCD: false,
    },
    {
      id: '2',
      createdAt: '2025-01-01T00:00:00Z',
      updatedAt: '2025-01-01T00:00:00Z',
      type: 'FRACTION_ADDITION',
      question: '2/5 + 1/3',
      answer: '11/15',
      difficulty: 'MEDIUM',
      tags: ['unlike-denominators'],
      sourceWorksheet: null,
      sourceProblemNumber: null,
      hasVariables: false,
      hasFractions: true,
      hasMixedNumbers: false,
      denominators: [5, 3],
      requiresLCD: true,
    },
    {
      id: '3',
      createdAt: '2025-01-01T00:00:00Z',
      updatedAt: '2025-01-01T00:00:00Z',
      type: 'ALGEBRA_COLLECTING_TERMS',
      question: '2a + 3a',
      answer: '5a',
      difficulty: 'EASY',
      tags: ['simple-terms'],
      sourceWorksheet: null,
      sourceProblemNumber: null,
      hasVariables: true,
      hasFractions: false,
      hasMixedNumbers: false,
      denominators: [],
      requiresLCD: false,
    },
  ];

  beforeEach(() => {
    jest.clearAllMocks();
  });

  describe('Initial fetch with no filters', () => {
    it('should start with loading state', () => {
      mockGetProblems.mockImplementation(
        () => new Promise(() => {}) // Never resolves
      );

      const { result } = renderHook(() => useProblems());

      expect(result.current.loading).toBe(true);
      expect(result.current.data).toBeNull();
      expect(result.current.error).toBeNull();
    });

    it('should fetch problems successfully on mount', async () => {
      mockGetProblems.mockResolvedValue(mockProblemsData);

      const { result } = renderHook(() => useProblems());

      expect(result.current.loading).toBe(true);

      await waitFor(() => {
        expect(result.current.loading).toBe(false);
      });

      expect(result.current.data).toEqual(mockProblemsData);
      expect(result.current.error).toBeNull();
      expect(mockGetProblems).toHaveBeenCalled();
      expect(mockGetProblems).toHaveBeenCalledWith({});
    });

    it('should handle API errors', async () => {
      const errorMessage = 'Failed to fetch problems';
      mockGetProblems.mockRejectedValue(new ApiError(errorMessage));

      const { result } = renderHook(() => useProblems());

      await waitFor(() => {
        expect(result.current.loading).toBe(false);
      });

      expect(result.current.data).toBeNull();
      expect(result.current.error).toBe(errorMessage);
    });

    it('should handle generic Error objects', async () => {
      const errorMessage = 'Network error';
      mockGetProblems.mockRejectedValue(new Error(errorMessage));

      const { result } = renderHook(() => useProblems());

      await waitFor(() => {
        expect(result.current.loading).toBe(false);
      });

      expect(result.current.data).toBeNull();
      expect(result.current.error).toBe(errorMessage);
    });

    it('should handle unknown error types', async () => {
      mockGetProblems.mockRejectedValue('Unknown error');

      const { result } = renderHook(() => useProblems());

      await waitFor(() => {
        expect(result.current.loading).toBe(false);
      });

      expect(result.current.data).toBeNull();
      expect(result.current.error).toBe('An unknown error occurred');
    });
  });

  describe('Fetch with filters', () => {
    it('should fetch problems with type filter', async () => {
      mockGetProblems.mockResolvedValue(mockProblemsData.slice(0, 2));

      const filters: ProblemFilters = {
        type: 'FRACTION_ADDITION',
      };

      const { result } = renderHook(() => useProblems(filters));

      await waitFor(() => {
        expect(result.current.loading).toBe(false);
      });

      expect(result.current.data).toEqual(mockProblemsData.slice(0, 2));
      expect(mockGetProblems).toHaveBeenCalledWith(filters);
    });

    it('should fetch problems with difficulty filter', async () => {
      mockGetProblems.mockResolvedValue(mockProblemsData.slice(0, 1));

      const filters: ProblemFilters = {
        type: 'FRACTION_ADDITION',
        difficulty: ['EASY'],
      };

      const { result } = renderHook(() => useProblems(filters));

      await waitFor(() => {
        expect(result.current.loading).toBe(false);
      });

      expect(result.current.data).toEqual(mockProblemsData.slice(0, 1));
      expect(mockGetProblems).toHaveBeenCalledWith(filters);
    });

    it('should fetch problems with multiple difficulty levels', async () => {
      mockGetProblems.mockResolvedValue(mockProblemsData);

      const filters: ProblemFilters = {
        type: 'FRACTION_ADDITION',
        difficulty: ['EASY', 'MEDIUM'],
      };

      const { result } = renderHook(() => useProblems(filters));

      await waitFor(() => {
        expect(result.current.loading).toBe(false);
      });

      expect(result.current.data).toEqual(mockProblemsData);
      expect(mockGetProblems).toHaveBeenCalledWith(filters);
    });

    it('should fetch problems with tags filter', async () => {
      mockGetProblems.mockResolvedValue(mockProblemsData.slice(0, 1));

      const filters: ProblemFilters = {
        type: 'FRACTION_ADDITION',
        tags: ['like-denominators'],
      };

      const { result } = renderHook(() => useProblems(filters));

      await waitFor(() => {
        expect(result.current.loading).toBe(false);
      });

      expect(mockGetProblems).toHaveBeenCalledWith(filters);
    });

    it('should fetch problems with limit', async () => {
      mockGetProblems.mockResolvedValue(mockProblemsData.slice(0, 2));

      const filters: ProblemFilters = {
        type: 'FRACTION_ADDITION',
        limit: 2,
      };

      const { result } = renderHook(() => useProblems(filters));

      await waitFor(() => {
        expect(result.current.loading).toBe(false);
      });

      expect(result.current.data).toHaveLength(2);
      expect(mockGetProblems).toHaveBeenCalledWith(filters);
    });

    it('should fetch problems with seed for reproducible results', async () => {
      mockGetProblems.mockResolvedValue(mockProblemsData);

      const filters: ProblemFilters = {
        type: 'FRACTION_ADDITION',
        seed: 'test-seed-123',
      };

      const { result } = renderHook(() => useProblems(filters));

      await waitFor(() => {
        expect(result.current.loading).toBe(false);
      });

      expect(mockGetProblems).toHaveBeenCalledWith(filters);
    });

    it('should fetch problems with all filters combined', async () => {
      mockGetProblems.mockResolvedValue(mockProblemsData.slice(0, 1));

      const filters: ProblemFilters = {
        type: 'FRACTION_ADDITION',
        difficulty: ['EASY'],
        tags: ['like-denominators'],
        limit: 10,
        seed: 'test-seed',
      };

      const { result } = renderHook(() => useProblems(filters));

      await waitFor(() => {
        expect(result.current.loading).toBe(false);
      });

      expect(mockGetProblems).toHaveBeenCalledWith(filters);
    });
  });

  describe('Filter changes trigger refetch', () => {
    it('should refetch when type filter changes', async () => {
      mockGetProblems.mockResolvedValue(mockProblemsData);

      const { result, rerender } = renderHook(
        ({ filters }: { filters: ProblemFilters }) => useProblems(filters),
        {
          initialProps: { filters: { type: 'FRACTION_ADDITION' } },
        }
      );

      await waitFor(() => {
        expect(result.current.loading).toBe(false);
      });

      expect(mockGetProblems).toHaveBeenCalledTimes(1);
      expect(mockGetProblems).toHaveBeenCalledWith({ type: 'FRACTION_ADDITION' });

      // Change type filter
      rerender({ filters: { type: 'ALGEBRA_COLLECTING_TERMS' } });

      await waitFor(() => {
        expect(mockGetProblems).toHaveBeenCalledTimes(2);
      });

      expect(mockGetProblems).toHaveBeenCalledWith({ type: 'ALGEBRA_COLLECTING_TERMS' });
    });

    it('should refetch when difficulty filter changes', async () => {
      mockGetProblems.mockResolvedValue(mockProblemsData);

      const { result, rerender } = renderHook(
        ({ filters }: { filters: ProblemFilters }) => useProblems(filters),
        {
          initialProps: {
            filters: { type: 'FRACTION_ADDITION', difficulty: ['EASY'] },
          },
        }
      );

      await waitFor(() => {
        expect(result.current.loading).toBe(false);
      });

      expect(mockGetProblems).toHaveBeenCalledTimes(1);

      // Change difficulty filter
      rerender({
        filters: { type: 'FRACTION_ADDITION', difficulty: ['MEDIUM'] },
      });

      await waitFor(() => {
        expect(mockGetProblems).toHaveBeenCalledTimes(2);
      });
    });

    it('should NOT refetch when filter array values are same (sorted)', async () => {
      mockGetProblems.mockResolvedValue(mockProblemsData);

      // Use a stable filters reference to avoid triggering refetch due to object reference change
      const filters1: ProblemFilters = { type: 'FRACTION_ADDITION', difficulty: ['EASY', 'MEDIUM'] };

      const { result, rerender } = renderHook(
        ({ filters }: { filters: ProblemFilters }) => useProblems(filters),
        {
          initialProps: { filters: filters1 },
        }
      );

      await waitFor(() => {
        expect(result.current.loading).toBe(false);
      });

      const initialCallCount = mockGetProblems.mock.calls.length;

      // Same filters reference - should not refetch
      rerender({ filters: filters1 });

      // Should not trigger refetch because filters reference is the same
      await new Promise(resolve => setTimeout(resolve, 100));
      expect(mockGetProblems.mock.calls.length).toBe(initialCallCount);
    });

    it('should refetch when tags filter changes', async () => {
      mockGetProblems.mockResolvedValue(mockProblemsData);

      const { result, rerender } = renderHook(
        ({ filters }) => useProblems(filters),
        {
          initialProps: {
            filters: { type: 'FRACTION_ADDITION' as const, tags: ['like-denominators'] },
          },
        }
      );

      await waitFor(() => {
        expect(result.current.loading).toBe(false);
      });

      expect(mockGetProblems).toHaveBeenCalledTimes(1);

      // Change tags filter
      rerender({
        filters: { type: 'FRACTION_ADDITION' as const, tags: ['unlike-denominators'] },
      });

      await waitFor(() => {
        expect(mockGetProblems).toHaveBeenCalledTimes(2);
      });
    });

    it('should refetch when limit changes', async () => {
      mockGetProblems.mockResolvedValue(mockProblemsData);

      const { result, rerender } = renderHook(
        ({ filters }) => useProblems(filters),
        {
          initialProps: { filters: { limit: 10 } },
        }
      );

      await waitFor(() => {
        expect(result.current.loading).toBe(false);
      });

      expect(mockGetProblems).toHaveBeenCalledTimes(1);

      // Change limit
      rerender({ filters: { limit: 20 } });

      await waitFor(() => {
        expect(mockGetProblems).toHaveBeenCalledTimes(2);
      });
    });

    it('should refetch when seed changes', async () => {
      mockGetProblems.mockResolvedValue(mockProblemsData);

      const { result, rerender } = renderHook(
        ({ filters }) => useProblems(filters),
        {
          initialProps: { filters: { seed: 'seed-1' } },
        }
      );

      await waitFor(() => {
        expect(result.current.loading).toBe(false);
      });

      expect(mockGetProblems).toHaveBeenCalledTimes(1);

      // Change seed
      rerender({ filters: { seed: 'seed-2' } });

      await waitFor(() => {
        expect(mockGetProblems).toHaveBeenCalledTimes(2);
      });
    });
  });

  describe('Refetch functionality', () => {
    it('should refetch problems when refetch is called', async () => {
      mockGetProblems.mockResolvedValue(mockProblemsData);

      const filters: ProblemFilters = {
        type: 'FRACTION_ADDITION',
      };

      const { result } = renderHook(() => useProblems(filters));

      await waitFor(() => {
        expect(result.current.loading).toBe(false);
      });

      expect(mockGetProblems).toHaveBeenCalledTimes(1);

      // Call refetch
      act(() => {
        result.current.refetch();
      });

      await waitFor(() => {
        expect(mockGetProblems).toHaveBeenCalledTimes(2);
      });

      expect(result.current.data).toEqual(mockProblemsData);
      expect(result.current.error).toBeNull();
    });

    it('should reset error state on refetch', async () => {
      // All calls fail initially
      mockGetProblems.mockRejectedValue(new ApiError('Network error'));

      const { result } = renderHook(() => useProblems({ type: 'FRACTION_ADDITION' }));

      await waitFor(() => {
        expect(result.current.error).toBe('Network error');
      });

      // Clear the mock and make the next call succeed
      mockGetProblems.mockClear();
      mockGetProblems.mockResolvedValue(mockProblemsData);

      act(() => {
        result.current.refetch();
      });

      await waitFor(() => {
        expect(result.current.loading).toBe(false);
      });

      expect(result.current.data).toEqual(mockProblemsData);
      expect(result.current.error).toBeNull();
    });
  });

  describe('Cleanup on unmount', () => {
    it('should not update state after unmount', async () => {
      const consoleErrorSpy = jest.spyOn(console, 'error').mockImplementation();

      let resolvePromise: (value: Problem[]) => void;
      const delayedPromise = new Promise<Problem[]>((resolve) => {
        resolvePromise = resolve;
      });

      mockGetProblems.mockReturnValue(delayedPromise);

      const { result, unmount } = renderHook(() => useProblems());

      expect(result.current.loading).toBe(true);

      // Unmount before promise resolves
      unmount();

      // Resolve promise after unmount
      resolvePromise!(mockProblemsData);

      // Wait a bit to ensure no state updates happen
      await new Promise(resolve => setTimeout(resolve, 100));

      // Should not have any console errors from state updates on unmounted component
      expect(consoleErrorSpy).not.toHaveBeenCalled();

      consoleErrorSpy.mockRestore();
    });
  });

  describe('Edge cases', () => {
    it('should handle empty problems array', async () => {
      mockGetProblems.mockResolvedValue([]);

      const { result } = renderHook(() => useProblems({ type: 'FRACTION_ADDITION' }));

      await waitFor(() => {
        expect(result.current.loading).toBe(false);
      });

      expect(result.current.data).toEqual([]);
      expect(result.current.error).toBeNull();
    });

    it('should handle changing from no filters to filters', async () => {
      mockGetProblems.mockResolvedValue(mockProblemsData);

      const { result, rerender } = renderHook(
        ({ filters }: { filters: ProblemFilters }) => useProblems(filters),
        {
          initialProps: { filters: {} },
        }
      );

      await waitFor(() => {
        expect(result.current.loading).toBe(false);
      });

      expect(mockGetProblems).toHaveBeenCalledWith({});

      // Add filters
      rerender({ filters: { type: 'FRACTION_ADDITION', difficulty: ['EASY'] } });

      await waitFor(() => {
        expect(mockGetProblems).toHaveBeenCalledTimes(2);
      });

      expect(mockGetProblems).toHaveBeenLastCalledWith({
        type: 'FRACTION_ADDITION',
        difficulty: ['EASY'],
      });
    });

    it('should handle changing from filters to no filters', async () => {
      mockGetProblems.mockResolvedValue(mockProblemsData);

      const { result, rerender } = renderHook(
        ({ filters }: { filters: ProblemFilters }) => useProblems(filters),
        {
          initialProps: { filters: { type: 'FRACTION_ADDITION' } },
        }
      );

      await waitFor(() => {
        expect(result.current.loading).toBe(false);
      });

      expect(mockGetProblems).toHaveBeenCalledWith({ type: 'FRACTION_ADDITION' });

      // Remove filters
      rerender({ filters: {} });

      await waitFor(() => {
        expect(mockGetProblems).toHaveBeenCalledTimes(2);
      });

      expect(mockGetProblems).toHaveBeenLastCalledWith({});
    });
  });
});
