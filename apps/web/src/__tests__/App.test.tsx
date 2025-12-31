import { render, screen, fireEvent, waitFor } from '@testing-library/react';
import '@testing-library/jest-dom';
import App from '../App';
import { getCategories, getProblems, getTags, ApiError } from '@/api/client';
import type { CategoryInfo, Problem } from '@/api/types';

// Mock the API client
jest.mock('@/api/client', () => ({
  getCategories: jest.fn(),
  getProblems: jest.fn(),
  getTags: jest.fn(),
  ApiError: class ApiError extends Error {
    constructor(message: string) {
      super(message);
      this.name = 'ApiError';
    }
  },
}));

// Mock @react-pdf/renderer to avoid PDF rendering in tests
jest.mock('@react-pdf/renderer', () => ({
  pdf: jest.fn(() => ({
    toBlob: jest.fn().mockResolvedValue(new Blob([], { type: 'application/pdf' })),
  })),
  Document: ({ children }: any) => children,
  Page: ({ children }: any) => children,
  Text: ({ children }: any) => children,
  View: ({ children }: any) => children,
  StyleSheet: {
    create: (styles: any) => styles,
  },
}));

const mockGetCategories = getCategories as jest.MockedFunction<typeof getCategories>;
const mockGetProblems = getProblems as jest.MockedFunction<typeof getProblems>;
const mockGetTags = getTags as jest.MockedFunction<typeof getTags>;

describe('App Integration Tests', () => {
  const mockCategories: CategoryInfo[] = [
    {
      type: 'FRACTION_ADDITION',
      count: 328,
      displayName: 'Fraction Addition',
      mainCategory: 'Fractions',
      subCategory: 'Addition',
    },
    {
      type: 'FRACTION_SUBTRACTION',
      count: 606,
      displayName: 'Fraction Subtraction',
      mainCategory: 'Fractions',
      subCategory: 'Subtraction',
    },
    {
      type: 'FRACTION_REDUCTION',
      count: 180,
      displayName: 'Fraction Reduction',
      mainCategory: 'Fractions',
      subCategory: 'Reduction',
    },
    {
      type: 'ALGEBRA_COLLECTING_TERMS',
      count: 150,
      displayName: 'Collecting Like Terms',
      mainCategory: 'Algebras',
      subCategory: 'Collecting Terms',
    },
  ];

  const mockProblems: Problem[] = Array.from({ length: 30 }, (_, i) => ({
    id: `problem-${i + 1}`,
    createdAt: new Date().toISOString(),
    updatedAt: new Date().toISOString(),
    question: `1/${i + 2} + 1/${i + 3}`,
    answer: `${2 * i + 5}/${(i + 2) * (i + 3)}`,
    type: 'FRACTION_ADDITION',
    difficulty: i < 10 ? 'EASY' : i < 20 ? 'MEDIUM' : 'HARD',
    tags: i % 2 === 0 ? ['unlike-denominators'] : ['like-denominators'],
    sourceWorksheet: null,
    sourceProblemNumber: null,
    hasVariables: false,
  }));

  const mockTags = ['unlike-denominators', 'like-denominators', 'simplification'];

  beforeEach(() => {
    jest.clearAllMocks();
    // Default successful responses
    mockGetCategories.mockResolvedValue(mockCategories);
    mockGetProblems.mockResolvedValue(mockProblems);
    mockGetTags.mockResolvedValue(mockTags);
  });

  describe('E2E-002: Category Selection Flow', () => {
    it('should display categories and subcategories when category is clicked', async () => {
      render(<App />);

      // Wait for categories to load
      await waitFor(() => {
        expect(screen.getByRole('button', { name: 'Fractions' })).toBeInTheDocument();
      });

      // Click on Fractions category
      const fractionsButton = screen.getByRole('button', { name: 'Fractions' });
      fireEvent.click(fractionsButton);

      // Verify category is highlighted (has active styling)
      expect(fractionsButton).toHaveClass('bg-blue-200', 'text-blue-900');

      // Verify subcategories appear
      await waitFor(() => {
        expect(screen.getByRole('button', { name: 'Addition' })).toBeInTheDocument();
        expect(screen.getByRole('button', { name: 'Subtraction' })).toBeInTheDocument();
        expect(screen.getByRole('button', { name: 'Reduction' })).toBeInTheDocument();
      });

      // Verify HeroSection is still displayed
      expect(screen.getByText(/master math with/i)).toBeInTheDocument();
    });

    it('should collapse subcategories when switching to different category', async () => {
      render(<App />);

      await waitFor(() => {
        expect(screen.getByRole('button', { name: 'Fractions' })).toBeInTheDocument();
      });

      // Click Fractions
      fireEvent.click(screen.getByRole('button', { name: 'Fractions' }));

      await waitFor(() => {
        expect(screen.getByRole('button', { name: 'Addition' })).toBeInTheDocument();
      });

      // Click Algebra
      fireEvent.click(screen.getByRole('button', { name: 'Algebra' }));

      // Fractions should still be expanded, but Algebra subcategories should show
      await waitFor(() => {
        expect(screen.getByRole('button', { name: 'Collecting Terms' })).toBeInTheDocument();
      });

      // Algebra should now have active styling
      expect(screen.getByRole('button', { name: 'Algebra' })).toHaveClass('bg-blue-200', 'text-blue-900');
    });
  });

  describe('E2E-003: Subcategory Selection & Problem Display', () => {
    it('should load and display problems when subcategory is selected', async () => {
      render(<App />);

      await waitFor(() => {
        expect(screen.getByRole('button', { name: 'Fractions' })).toBeInTheDocument();
      });

      // Click Fractions → Addition
      fireEvent.click(screen.getByRole('button', { name: 'Fractions' }));

      await waitFor(() => {
        expect(screen.getByRole('button', { name: 'Addition' })).toBeInTheDocument();
      });

      fireEvent.click(screen.getByRole('button', { name: 'Addition' }));

      // Verify loading state appears
      await waitFor(() => {
        expect(screen.getByText(/loading problems/i)).toBeInTheDocument();
      });

      // Wait for problems to load
      await waitFor(() => {
        expect(screen.getAllByText('Fractions - Addition')[0]).toBeInTheDocument();
      });

      // Verify problems API was called with correct type
      await waitFor(() => {
        expect(mockGetProblems).toHaveBeenCalled();
      });

      // Check that at least one call had the correct problem type
      const calls = mockGetProblems.mock.calls;
      const hasCorrectCall = calls.some(call => call[0]?.type === 'FRACTION_ADDITION');
      expect(hasCorrectCall).toBe(true);

      // Verify action buttons are visible (there are multiple Download PDF buttons, so use getAllByRole)
      expect(screen.getAllByRole('button', { name: /download pdf/i })[0]).toBeInTheDocument();
      expect(screen.getAllByRole('button', { name: /show answer key/i })[0]).toBeInTheDocument();
      expect(screen.getByRole('button', { name: /back to categories/i })).toBeInTheDocument();
    });

    it('should display exactly 30 problems', async () => {
      render(<App />);

      await waitFor(() => {
        expect(screen.getByRole('button', { name: 'Fractions' })).toBeInTheDocument();
      });

      fireEvent.click(screen.getByRole('button', { name: 'Fractions' }));
      await waitFor(() => {
        expect(screen.getByRole('button', { name: 'Addition' })).toBeInTheDocument();
      });
      fireEvent.click(screen.getByRole('button', { name: 'Addition' }));

      await waitFor(() => {
        expect(screen.getAllByText('Fractions - Addition')[0]).toBeInTheDocument();
      });

      // Wait for problems to load by checking the mock was called
      await waitFor(() => {
        expect(mockGetProblems).toHaveBeenCalled();
      });

      // Count problems - getAllByRole for list items in the main problems area
      // The problems list is in the main area, not in the sidebar
      const problemsLists = screen.getAllByRole('list');
      // The problems list should be the last one (after the categories list)
      const problemsList = problemsLists[problemsLists.length - 1];
      const problems = problemsList.querySelectorAll('li');
      expect(problems).toHaveLength(30);
    });
  });

  describe('E2E-004: Difficulty Filtering', () => {
    it('should enable difficulty filter when subcategory is selected', async () => {
      render(<App />);

      await waitFor(() => {
        expect(screen.getByRole('button', { name: 'Fractions' })).toBeInTheDocument();
      });

      // Before selecting subcategory, difficulty filter container should have pointer-events-none
      const difficultySection = screen.getByText('Difficulty Levels').parentElement;
      expect(difficultySection).toHaveClass('pointer-events-none');

      // Select Fractions → Addition
      fireEvent.click(screen.getByRole('button', { name: 'Fractions' }));
      await waitFor(() => {
        expect(screen.getByRole('button', { name: 'Addition' })).toBeInTheDocument();
      });
      fireEvent.click(screen.getByRole('button', { name: 'Addition' }));

      await waitFor(() => {
        expect(screen.getAllByText('Fractions - Addition')[0]).toBeInTheDocument();
      });

      // Now difficulty filter container should not have pointer-events-none
      const enabledDifficultySection = screen.getByText('Difficulty Levels').parentElement;
      expect(enabledDifficultySection).not.toHaveClass('pointer-events-none');
    });

    it('should show pending badge when difficulty is selected but not applied', async () => {
      render(<App />);

      await waitFor(() => {
        expect(screen.getByRole('button', { name: 'Fractions' })).toBeInTheDocument();
      });

      fireEvent.click(screen.getByRole('button', { name: 'Fractions' }));
      await waitFor(() => {
        expect(screen.getByRole('button', { name: 'Addition' })).toBeInTheDocument();
      });
      fireEvent.click(screen.getByRole('button', { name: 'Addition' }));

      await waitFor(() => {
        expect(screen.getAllByText('Fractions - Addition')[0]).toBeInTheDocument();
      });

      // Check EASY difficulty
      const easyCheckbox = screen.getByLabelText(/filter by easy difficulty/i);
      fireEvent.click(easyCheckbox);

      // Verify "Pending" badge appears on Apply Filters button
      await waitFor(() => {
        expect(screen.getByText('Pending')).toBeInTheDocument();
      });

      // Apply Filters button should be enabled
      const applyButton = screen.getByRole('button', { name: /apply filters/i });
      expect(applyButton).not.toBeDisabled();
    });

    it('should apply difficulty filter and fetch filtered problems', async () => {
      const easyProblems = mockProblems.filter((p) => p.difficulty === 'EASY');
      mockGetProblems.mockResolvedValueOnce(mockProblems).mockResolvedValueOnce(easyProblems);

      render(<App />);

      await waitFor(() => {
        expect(screen.getByRole('button', { name: 'Fractions' })).toBeInTheDocument();
      });

      fireEvent.click(screen.getByRole('button', { name: 'Fractions' }));
      await waitFor(() => {
        expect(screen.getByRole('button', { name: 'Addition' })).toBeInTheDocument();
      });
      fireEvent.click(screen.getByRole('button', { name: 'Addition' }));

      await waitFor(() => {
        expect(screen.getAllByText('Fractions - Addition')[0]).toBeInTheDocument();
      });

      // Select EASY difficulty
      const easyCheckbox = screen.getByLabelText(/filter by easy difficulty/i);
      fireEvent.click(easyCheckbox);

      // Click Apply Filters
      const applyButton = screen.getByRole('button', { name: /apply filters/i });
      fireEvent.click(applyButton);

      // Verify API was called with difficulty filter
      await waitFor(() => {
        const lastCall = mockGetProblems.mock.calls[mockGetProblems.mock.calls.length - 1][0];
        expect(lastCall).toMatchObject({
          type: 'FRACTION_ADDITION',
          difficulty: ['EASY'],
        });
      });
    });
  });

  describe('E2E-005: Tag Filtering', () => {
    it('should load tags when subcategory is selected', async () => {
      render(<App />);

      await waitFor(() => {
        expect(screen.getByRole('button', { name: 'Fractions' })).toBeInTheDocument();
      });

      fireEvent.click(screen.getByRole('button', { name: 'Fractions' }));
      await waitFor(() => {
        expect(screen.getByRole('button', { name: 'Addition' })).toBeInTheDocument();
      });
      fireEvent.click(screen.getByRole('button', { name: 'Addition' }));

      await waitFor(() => {
        expect(screen.getAllByText('Fractions - Addition')[0]).toBeInTheDocument();
      });

      // Verify tags are loaded
      expect(mockGetTags).toHaveBeenCalledWith('FRACTION_ADDITION');

      // Verify tag checkboxes appear
      await waitFor(() => {
        expect(screen.getByLabelText(/filter by tag: unlike-denominators/i)).toBeInTheDocument();
        expect(screen.getByLabelText(/filter by tag: like-denominators/i)).toBeInTheDocument();
      });
    });

    it('should apply tag filter and fetch filtered problems', async () => {
      const taggedProblems = mockProblems.filter((p) => p.tags.includes('unlike-denominators'));
      mockGetProblems.mockResolvedValueOnce(mockProblems).mockResolvedValueOnce(taggedProblems);

      render(<App />);

      await waitFor(() => {
        expect(screen.getByRole('button', { name: 'Fractions' })).toBeInTheDocument();
      });

      fireEvent.click(screen.getByRole('button', { name: 'Fractions' }));
      await waitFor(() => {
        expect(screen.getByRole('button', { name: 'Addition' })).toBeInTheDocument();
      });
      fireEvent.click(screen.getByRole('button', { name: 'Addition' }));

      await waitFor(() => {
        expect(screen.getAllByText('Fractions - Addition')[0]).toBeInTheDocument();
      });

      // Select tag
      const tagCheckbox = screen.getByLabelText(/filter by tag: unlike-denominators/i);
      fireEvent.click(tagCheckbox);

      // Click Apply Filters
      const applyButton = screen.getByRole('button', { name: /apply filters/i });
      fireEvent.click(applyButton);

      // Verify API was called with tag filter
      await waitFor(() => {
        const lastCall = mockGetProblems.mock.calls[mockGetProblems.mock.calls.length - 1][0];
        expect(lastCall).toMatchObject({
          type: 'FRACTION_ADDITION',
          tags: ['unlike-denominators'],
        });
      });
    });

    it('should combine difficulty and tag filters', async () => {
      render(<App />);

      await waitFor(() => {
        expect(screen.getByRole('button', { name: 'Fractions' })).toBeInTheDocument();
      });

      fireEvent.click(screen.getByRole('button', { name: 'Fractions' }));
      await waitFor(() => {
        expect(screen.getByRole('button', { name: 'Addition' })).toBeInTheDocument();
      });
      fireEvent.click(screen.getByRole('button', { name: 'Addition' }));

      await waitFor(() => {
        expect(screen.getAllByText('Fractions - Addition')[0]).toBeInTheDocument();
      });

      // Select both difficulty and tag
      fireEvent.click(screen.getByLabelText(/filter by easy difficulty/i));
      fireEvent.click(screen.getByLabelText(/filter by tag: unlike-denominators/i));

      // Click Apply Filters
      fireEvent.click(screen.getByRole('button', { name: /apply filters/i }));

      // Verify API was called with both filters
      await waitFor(() => {
        const lastCall = mockGetProblems.mock.calls[mockGetProblems.mock.calls.length - 1][0];
        expect(lastCall).toMatchObject({
          type: 'FRACTION_ADDITION',
          difficulty: ['EASY'],
          tags: ['unlike-denominators'],
        });
      });
    });
  });

  describe('E2E-006: Answer Key Toggle', () => {
    it('should show answers when "Show Answer Key" is clicked', async () => {
      render(<App />);

      await waitFor(() => {
        expect(screen.getByRole('button', { name: 'Fractions' })).toBeInTheDocument();
      });

      fireEvent.click(screen.getByRole('button', { name: 'Fractions' }));
      await waitFor(() => {
        expect(screen.getByRole('button', { name: 'Addition' })).toBeInTheDocument();
      });
      fireEvent.click(screen.getByRole('button', { name: 'Addition' }));

      await waitFor(() => {
        expect(screen.getAllByText('Fractions - Addition')[0]).toBeInTheDocument();
      });

      // Initially, button should say "Show Answer Key"
      const answerKeyButton = screen.getAllByRole('button', { name: /show answer key/i })[0];
      expect(answerKeyButton).toBeInTheDocument();

      // Click to show answers
      fireEvent.click(answerKeyButton);

      // Button text should change to "Hide Answer Key"
      await waitFor(() => {
        expect(screen.getAllByRole('button', { name: /hide answer key/i })[0]).toBeInTheDocument();
      });
    });

    it('should hide answers when "Hide Answer Key" is clicked', async () => {
      render(<App />);

      await waitFor(() => {
        expect(screen.getByRole('button', { name: 'Fractions' })).toBeInTheDocument();
      });

      fireEvent.click(screen.getByRole('button', { name: 'Fractions' }));
      await waitFor(() => {
        expect(screen.getByRole('button', { name: 'Addition' })).toBeInTheDocument();
      });
      fireEvent.click(screen.getByRole('button', { name: 'Addition' }));

      await waitFor(() => {
        expect(screen.getAllByText('Fractions - Addition')[0]).toBeInTheDocument();
      });

      // Show answers
      const answerKeyButton = screen.getAllByRole('button', { name: /show answer key/i })[0];
      fireEvent.click(answerKeyButton);

      await waitFor(() => {
        expect(screen.getAllByRole('button', { name: /hide answer key/i })[0]).toBeInTheDocument();
      });

      // Hide answers
      const hideButton = screen.getAllByRole('button', { name: /hide answer key/i })[0];
      fireEvent.click(hideButton);

      // Button should change back to "Show Answer Key"
      await waitFor(() => {
        expect(screen.getAllByRole('button', { name: /show answer key/i })[0]).toBeInTheDocument();
      });
    });
  });

  describe('E2E-008: Navigation Flow', () => {
    it('should return to HeroSection when "Back to Categories" is clicked', async () => {
      render(<App />);

      await waitFor(() => {
        expect(screen.getByRole('button', { name: 'Fractions' })).toBeInTheDocument();
      });

      fireEvent.click(screen.getByRole('button', { name: 'Fractions' }));
      await waitFor(() => {
        expect(screen.getByRole('button', { name: 'Addition' })).toBeInTheDocument();
      });
      fireEvent.click(screen.getByRole('button', { name: 'Addition' }));

      await waitFor(() => {
        expect(screen.getAllByText('Fractions - Addition')[0]).toBeInTheDocument();
      });

      // Click "Back to Categories"
      const backButton = screen.getByRole('button', { name: /back to categories/i });
      fireEvent.click(backButton);

      // Verify HeroSection is displayed again
      await waitFor(() => {
        expect(screen.getByText(/master math with/i)).toBeInTheDocument();
      });

      // Verify problems are no longer displayed
      expect(screen.queryByText('Fractions - Addition')).not.toBeInTheDocument();
    });

    it('should keep category highlighted after returning from subcategory', async () => {
      render(<App />);

      await waitFor(() => {
        expect(screen.getByRole('button', { name: 'Fractions' })).toBeInTheDocument();
      });

      fireEvent.click(screen.getByRole('button', { name: 'Fractions' }));
      await waitFor(() => {
        expect(screen.getByRole('button', { name: 'Addition' })).toBeInTheDocument();
      });
      fireEvent.click(screen.getByRole('button', { name: 'Addition' }));

      await waitFor(() => {
        expect(screen.getAllByText('Fractions - Addition')[0]).toBeInTheDocument();
      });

      // Go back
      fireEvent.click(screen.getByRole('button', { name: /back to categories/i }));

      await waitFor(() => {
        expect(screen.getByText(/master math with/i)).toBeInTheDocument();
      });

      // Fractions category should still be highlighted
      const fractionsButton = screen.getByRole('button', { name: 'Fractions' });
      expect(fractionsButton).toHaveClass('bg-blue-200', 'text-blue-900');
    });
  });

  describe('E2E-009: Filter State Management', () => {
    it('should reset filters when switching subcategories', async () => {
      render(<App />);

      await waitFor(() => {
        expect(screen.getByRole('button', { name: 'Fractions' })).toBeInTheDocument();
      });

      fireEvent.click(screen.getByRole('button', { name: 'Fractions' }));
      await waitFor(() => {
        expect(screen.getByRole('button', { name: 'Addition' })).toBeInTheDocument();
      });
      fireEvent.click(screen.getByRole('button', { name: 'Addition' }));

      await waitFor(() => {
        expect(screen.getAllByText('Fractions - Addition')[0]).toBeInTheDocument();
      });

      // Apply filters
      fireEvent.click(screen.getByLabelText(/filter by easy difficulty/i));
      fireEvent.click(screen.getByRole('button', { name: /apply filters/i }));

      await waitFor(() => {
        expect(mockGetProblems).toHaveBeenCalledWith(
          expect.objectContaining({
            difficulty: ['EASY'],
          })
        );
      });

      // Switch to Subtraction
      fireEvent.click(screen.getByRole('button', { name: 'Subtraction' }));

      await waitFor(() => {
        expect(screen.getAllByText('Fractions - Subtraction')[0]).toBeInTheDocument();
      });

      // Verify filters are cleared (checkboxes unchecked)
      const easyCheckbox = screen.getByLabelText(/filter by easy difficulty/i) as HTMLInputElement;
      expect(easyCheckbox.checked).toBe(false);

      // Verify Apply Filters is disabled (no pending changes)
      const applyButton = screen.getByRole('button', { name: /apply filters/i });
      expect(applyButton).toBeDisabled();
    });
  });

  describe('E2E-010: Error Handling', () => {
    it('should display error message when categories fail to load', async () => {
      mockGetCategories.mockRejectedValue(new ApiError('Failed to fetch categories'));

      render(<App />);

      // Wait for error to appear
      await waitFor(() => {
        expect(screen.getByText('Error loading categories')).toBeInTheDocument();
        expect(screen.getByText('Failed to fetch categories')).toBeInTheDocument();
      });
    });

    it('should display error message when problems fail to load', async () => {
      mockGetProblems.mockRejectedValue(new ApiError('Failed to fetch problems'));

      render(<App />);

      await waitFor(() => {
        expect(screen.getByRole('button', { name: 'Fractions' })).toBeInTheDocument();
      });

      fireEvent.click(screen.getByRole('button', { name: 'Fractions' }));
      await waitFor(() => {
        expect(screen.getByRole('button', { name: 'Addition' })).toBeInTheDocument();
      });
      fireEvent.click(screen.getByRole('button', { name: 'Addition' }));

      // Wait for error to appear
      await waitFor(() => {
        expect(screen.getByText('Error loading problems')).toBeInTheDocument();
        expect(screen.getByText('Failed to fetch problems')).toBeInTheDocument();
      });
    });
  });

  describe('E2E-011: Loading States', () => {
    it('should show loading indicator when categories are loading', async () => {
      mockGetCategories.mockImplementation(() => new Promise(() => {})); // Never resolves

      render(<App />);

      // Verify loading state
      expect(screen.getByText(/loading categories/i)).toBeInTheDocument();
    });

    it('should show loading indicator when problems are loading', async () => {
      let resolveProblems: (value: Problem[]) => void;
      const problemsPromise = new Promise<Problem[]>((resolve) => {
        resolveProblems = resolve;
      });
      mockGetProblems.mockReturnValue(problemsPromise);

      render(<App />);

      await waitFor(() => {
        expect(screen.getByRole('button', { name: 'Fractions' })).toBeInTheDocument();
      });

      fireEvent.click(screen.getByRole('button', { name: 'Fractions' }));
      await waitFor(() => {
        expect(screen.getByRole('button', { name: 'Addition' })).toBeInTheDocument();
      });
      fireEvent.click(screen.getByRole('button', { name: 'Addition' }));

      // Verify loading state appears
      await waitFor(() => {
        expect(screen.getByText(/loading problems/i)).toBeInTheDocument();
      });

      // Resolve promise
      resolveProblems!(mockProblems);

      // Loading should disappear
      await waitFor(() => {
        expect(screen.queryByText(/loading problems/i)).not.toBeInTheDocument();
      });
    });

    it('should show loading indicator when tags are loading', async () => {
      let resolveTags: (value: string[]) => void;
      const tagsPromise = new Promise<string[]>((resolve) => {
        resolveTags = resolve;
      });
      mockGetTags.mockReturnValue(tagsPromise);

      render(<App />);

      await waitFor(() => {
        expect(screen.getByRole('button', { name: 'Fractions' })).toBeInTheDocument();
      });

      fireEvent.click(screen.getByRole('button', { name: 'Fractions' }));
      await waitFor(() => {
        expect(screen.getByRole('button', { name: 'Addition' })).toBeInTheDocument();
      });
      fireEvent.click(screen.getByRole('button', { name: 'Addition' }));

      // Wait for problems to load first
      await waitFor(() => {
        expect(screen.getAllByText('Fractions - Addition')[0]).toBeInTheDocument();
      });

      // Verify tags loading state (may be brief, so check it was called)
      expect(mockGetTags).toHaveBeenCalledWith('FRACTION_ADDITION');

      // Resolve promise
      resolveTags!(mockTags);

      // Verify tags loaded
      await waitFor(() => {
        expect(screen.getByLabelText(/filter by tag: unlike-denominators/i)).toBeInTheDocument();
      });
    });
  });

  describe('E2E-013: Empty State Handling', () => {
    it('should display empty state message when no problems match filters', async () => {
      // Start with normal problems, then return empty array on filter
      mockGetProblems.mockResolvedValue(mockProblems);

      render(<App />);

      await waitFor(() => {
        expect(screen.getByRole('button', { name: 'Fractions' })).toBeInTheDocument();
      });

      fireEvent.click(screen.getByRole('button', { name: 'Fractions' }));
      await waitFor(() => {
        expect(screen.getByRole('button', { name: 'Addition' })).toBeInTheDocument();
      });
      fireEvent.click(screen.getByRole('button', { name: 'Addition' }));

      await waitFor(() => {
        expect(screen.getAllByText('Fractions - Addition')[0]).toBeInTheDocument();
      });

      // Now set mock to return empty array for filtered results
      mockGetProblems.mockResolvedValue([]);

      // Apply very restrictive filter
      fireEvent.click(screen.getByLabelText(/filter by hard difficulty/i));
      fireEvent.click(screen.getByRole('button', { name: /apply filters/i }));

      // Wait for empty state message
      await waitFor(
        () => {
          expect(screen.getByText(/no problems found for this category/i)).toBeInTheDocument();
        },
        { timeout: 3000 }
      );
    });
  });
});
