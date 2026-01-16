# Testing Implementation Guide

**Step-by-step guide to test existing components in the maths-tutor project.**

---

## ⚠️ IMPORTANT: Fix Failing Tests First!

**Before adding new tests, fix the existing failing tests:**

👉 **See [`FIX-FAILING-TESTS.md`](./FIX-FAILING-TESTS.md)** for step-by-step instructions.

**Quick fix:**
1. Remove `ApiError` from import statements in hook tests
2. Restore `App.tsx` from backup
3. Run `npm test` to verify

**Expected result:** All 74 tests passing ✅

---

## Current Test Coverage

### ✅ Already Tested (74 tests)
- `App.tsx` - Integration tests (21 tests)
- `useCategories` hook (tests exist)
- `useProblems` hook (tests exist)
- `useTags` hook (tests exist)

### ❌ Needs Testing
**Components:**
- `Fraction.tsx` - Display component for fractions
- `MixedNumber.tsx` - Display component for mixed numbers
- `MainCategory.tsx` - Category selection button
- `ErrorBoundary.tsx` - Error boundary component
- `DifficultyFilter.tsx` - Filter UI component
- `HeroSection.tsx` - Hero section component
- `PrintableWorksheet.tsx` - PDF worksheet component

**Hooks:**
- `usePDFGenerator.ts` - PDF generation hook

---

## Prerequisites

### Step 1: Create Test Utilities (if not exists)

Create `apps/web/src/__tests__/utils/test-utils.tsx`:

```typescript
import { render, type RenderOptions, type RenderResult } from '@testing-library/react';
import { type ReactElement } from 'react';

/**
 * Custom render function for testing
 * Extend this as needed for providers (Router, Context, etc.)
 */
export function renderWithProviders(
  ui: ReactElement,
  options?: Omit<RenderOptions, 'wrapper'>
): RenderResult {
  return render(ui, options);
}

// Re-export everything from testing library
export * from '@testing-library/react';
```

---

## Testing Components

### Strategy 1: Test Simple Display Components

**Target:** `Fraction.tsx`, `MixedNumber.tsx`

**What to test:**
- Renders with correct props
- Displays correct content
- Applies custom className
- Handles edge cases

#### Step-by-Step: Testing Fraction Component

**1. Create test file:**

```bash
mkdir -p apps/web/src/components/__tests__
touch apps/web/src/components/__tests__/Fraction.test.tsx
```

**2. Write the test:**

```typescript
// apps/web/src/components/__tests__/Fraction.test.tsx
import { screen } from '@testing-library/react';
import { Fraction } from '../Fraction';
import { renderWithProviders } from '../../__tests__/utils/test-utils';

describe('Fraction', () => {
  it('should render numerator and denominator', () => {
    renderWithProviders(
      <Fraction numerator="3" denominator="4" />
    );

    expect(screen.getByText('3')).toBeInTheDocument();
    expect(screen.getByText('4')).toBeInTheDocument();
  });

  it('should apply custom className', () => {
    const { container } = renderWithProviders(
      <Fraction numerator="1" denominator="2" className="custom-class" />
    );

    const fractionElement = container.querySelector('.custom-class');
    expect(fractionElement).toBeInTheDocument();
  });

  it('should render complex fractions with variables', () => {
    renderWithProviders(
      <Fraction numerator="2a+3" denominator="5b" />
    );

    expect(screen.getByText('2a+3')).toBeInTheDocument();
    expect(screen.getByText('5b')).toBeInTheDocument();
  });

  it('should handle single digit fractions', () => {
    renderWithProviders(
      <Fraction numerator="1" denominator="2" />
    );

    expect(screen.getByText('1')).toBeInTheDocument();
    expect(screen.getByText('2')).toBeInTheDocument();
  });

  it('should handle improper fractions', () => {
    renderWithProviders(
      <Fraction numerator="10" denominator="3" />
    );

    expect(screen.getByText('10')).toBeInTheDocument();
    expect(screen.getByText('3')).toBeInTheDocument();
  });
});
```

**3. Run the test:**

```bash
npm test -- Fraction.test.tsx
```

---

### Strategy 2: Test Interactive Components

**Target:** `MainCategory.tsx`, `DifficultyFilter.tsx`

**What to test:**
- User interactions (clicks, changes)
- Callback functions are called
- Visual states (selected, disabled)
- Conditional rendering

#### Step-by-Step: Testing MainCategory Component

**1. Create test file:**

```bash
touch apps/web/src/components/__tests__/MainCategory.test.tsx
```

**2. Write the test:**

```typescript
// apps/web/src/components/__tests__/MainCategory.test.tsx
import { screen } from '@testing-library/react';
import userEvent from '@testing-library/user-event';
import MainCategory from '../MainCategory';
import { renderWithProviders } from '../../__tests__/utils/test-utils';

describe('MainCategory', () => {
  const defaultProps = {
    selectedCategory: null,
    category: 'Fractions',
    setSelectedCategory: jest.fn(),
    setSelectedSubCategory: jest.fn(),
  };

  beforeEach(() => {
    jest.clearAllMocks();
  });

  it('should render category name', () => {
    renderWithProviders(<MainCategory {...defaultProps} />);

    expect(screen.getByText('Fractions')).toBeInTheDocument();
  });

  it('should call callbacks when clicked', async () => {
    const user = userEvent.setup();
    renderWithProviders(<MainCategory {...defaultProps} />);

    const button = screen.getByRole('button', { name: /fractions/i });
    await user.click(button);

    expect(defaultProps.setSelectedCategory).toHaveBeenCalledWith('Fractions');
    expect(defaultProps.setSelectedSubCategory).toHaveBeenCalledWith(null);
  });

  it('should apply selected styling when category is selected', () => {
    renderWithProviders(
      <MainCategory
        {...defaultProps}
        selectedCategory="Fractions"
      />
    );

    const button = screen.getByRole('button', { name: /fractions/i });
    expect(button).toHaveClass('bg-blue-200', 'text-blue-900');
  });

  it('should apply hover styling when category is not selected', () => {
    renderWithProviders(<MainCategory {...defaultProps} />);

    const button = screen.getByRole('button', { name: /fractions/i });
    expect(button).toHaveClass('hover:bg-blue-100', 'text-blue-700');
    expect(button).not.toHaveClass('bg-blue-200');
  });

  it('should render chevron icon', () => {
    const { container } = renderWithProviders(<MainCategory {...defaultProps} />);

    // ChevronRight renders as SVG
    const svg = container.querySelector('svg');
    expect(svg).toBeInTheDocument();
  });

  it('should reset subcategory when changing category', async () => {
    const user = userEvent.setup();
    renderWithProviders(
      <MainCategory
        {...defaultProps}
        selectedCategory="Algebra"
      />
    );

    const button = screen.getByRole('button', { name: /fractions/i });
    await user.click(button);

    // Should reset subcategory to null
    expect(defaultProps.setSelectedSubCategory).toHaveBeenCalledWith(null);
  });
});
```

**3. Run the test:**

```bash
npm test -- MainCategory.test.tsx
```

---

#### Step-by-Step: Testing DifficultyFilter Component

**1. Create test file:**

```bash
touch apps/web/src/components/__tests__/DifficultyFilter.test.tsx
```

**2. Write the test:**

```typescript
// apps/web/src/components/__tests__/DifficultyFilter.test.tsx
import { screen } from '@testing-library/react';
import userEvent from '@testing-library/user-event';
import DifficultyFilter from '../DifficultyFilter';
import { renderWithProviders } from '../../__tests__/utils/test-utils';
import type { Difficulty } from '@/api/types';

describe('DifficultyFilter', () => {
  const defaultProps = {
    selectedSubCategory: 'FRACTION_ADDITION',
    stagedDifficulties: [] as Difficulty[],
    toggleDifficulty: jest.fn(),
  };

  beforeEach(() => {
    jest.clearAllMocks();
  });

  it('should render all difficulty levels', () => {
    renderWithProviders(<DifficultyFilter {...defaultProps} />);

    expect(screen.getByLabelText(/filter by easy difficulty/i)).toBeInTheDocument();
    expect(screen.getByLabelText(/filter by medium difficulty/i)).toBeInTheDocument();
    expect(screen.getByLabelText(/filter by hard difficulty/i)).toBeInTheDocument();
  });

  it('should be disabled when no subcategory is selected', () => {
    renderWithProviders(
      <DifficultyFilter
        {...defaultProps}
        selectedSubCategory={null}
      />
    );

    const container = screen.getByText('Difficulty Levels').parentElement;
    expect(container).toHaveClass('pointer-events-none', 'opacity-50');
  });

  it('should be enabled when subcategory is selected', () => {
    renderWithProviders(<DifficultyFilter {...defaultProps} />);

    const container = screen.getByText('Difficulty Levels').parentElement;
    expect(container).toHaveClass('bg-white', 'border-blue-200');
    expect(container).not.toHaveClass('pointer-events-none');
  });

  it('should call toggleDifficulty when checkbox is clicked', async () => {
    const user = userEvent.setup();
    renderWithProviders(<DifficultyFilter {...defaultProps} />);

    const easyCheckbox = screen.getByLabelText(/filter by easy difficulty/i);
    await user.click(easyCheckbox);

    expect(defaultProps.toggleDifficulty).toHaveBeenCalledWith('EASY');
  });

  it('should check boxes for selected difficulties', () => {
    renderWithProviders(
      <DifficultyFilter
        {...defaultProps}
        stagedDifficulties={['EASY', 'HARD']}
      />
    );

    const easyCheckbox = screen.getByLabelText(/filter by easy difficulty/i) as HTMLInputElement;
    const mediumCheckbox = screen.getByLabelText(/filter by medium difficulty/i) as HTMLInputElement;
    const hardCheckbox = screen.getByLabelText(/filter by hard difficulty/i) as HTMLInputElement;

    expect(easyCheckbox.checked).toBe(true);
    expect(mediumCheckbox.checked).toBe(false);
    expect(hardCheckbox.checked).toBe(true);
  });

  it('should show "All difficulties shown" when none selected', () => {
    renderWithProviders(<DifficultyFilter {...defaultProps} />);

    expect(screen.getByText('All difficulties shown')).toBeInTheDocument();
  });

  it('should not show "All difficulties shown" when some selected', () => {
    renderWithProviders(
      <DifficultyFilter
        {...defaultProps}
        stagedDifficulties={['EASY']}
      />
    );

    expect(screen.queryByText('All difficulties shown')).not.toBeInTheDocument();
  });
});
```

**3. Run the test:**

```bash
npm test -- DifficultyFilter.test.tsx
```

---

### Strategy 3: Test Error Boundary Component

**Target:** `ErrorBoundary.tsx`

Error boundaries require special testing because they catch React errors.

#### Step-by-Step: Testing ErrorBoundary

**1. Read the ErrorBoundary component:**

```bash
cat apps/web/src/components/ErrorBoundary.tsx
```

**2. Create test file:**

```bash
touch apps/web/src/components/__tests__/ErrorBoundary.test.tsx
```

**3. Write the test:**

```typescript
// apps/web/src/components/__tests__/ErrorBoundary.test.tsx
import { type ReactElement } from 'react';
import { screen } from '@testing-library/react';
import ErrorBoundary from '../ErrorBoundary';
import { renderWithProviders } from '../../__tests__/utils/test-utils';

// Component that throws an error
const ThrowError = ({ shouldThrow }: { shouldThrow: boolean }): ReactElement => {
  if (shouldThrow) {
    throw new Error('Test error');
  }
  return <div>No error</div>;
};

describe('ErrorBoundary', () => {
  // Suppress console.error for cleaner test output
  const originalError = console.error;
  beforeAll(() => {
    console.error = jest.fn();
  });

  afterAll(() => {
    console.error = originalError;
  });

  it('should render children when there is no error', () => {
    renderWithProviders(
      <ErrorBoundary>
        <div>Test content</div>
      </ErrorBoundary>
    );

    expect(screen.getByText('Test content')).toBeInTheDocument();
  });

  it('should render error UI when child component throws', () => {
    renderWithProviders(
      <ErrorBoundary>
        <ThrowError shouldThrow={true} />
      </ErrorBoundary>
    );

    // Check for error message (adjust based on your ErrorBoundary implementation)
    expect(screen.getByText(/something went wrong/i)).toBeInTheDocument();
  });

  it('should display error details in development mode', () => {
    renderWithProviders(
      <ErrorBoundary>
        <ThrowError shouldThrow={true} />
      </ErrorBoundary>
    );

    // If your ErrorBoundary shows error details
    expect(screen.getByText(/test error/i)).toBeInTheDocument();
  });

  it('should not render error UI when no error occurs', () => {
    renderWithProviders(
      <ErrorBoundary>
        <ThrowError shouldThrow={false} />
      </ErrorBoundary>
    );

    expect(screen.getByText('No error')).toBeInTheDocument();
    expect(screen.queryByText(/something went wrong/i)).not.toBeInTheDocument();
  });
});
```

---

### Strategy 4: Test Components with Complex Logic

**Target:** `HeroSection.tsx`, `PrintableWorksheet.tsx`

#### Step-by-Step: Testing HeroSection

**1. Create test file:**

```bash
touch apps/web/src/components/__tests__/HeroSection.test.tsx
```

**2. Write the test:**

```typescript
// apps/web/src/components/__tests__/HeroSection.test.tsx
import { screen } from '@testing-library/react';
import HeroSection from '../HeroSection';
import { renderWithProviders } from '../../__tests__/utils/test-utils';

describe('HeroSection', () => {
  it('should render hero title', () => {
    renderWithProviders(<HeroSection />);

    expect(screen.getByText(/master math with/i)).toBeInTheDocument();
  });

  it('should render hero description', () => {
    renderWithProviders(<HeroSection />);

    // Adjust text to match your actual component
    expect(screen.getByText(/practice problems/i)).toBeInTheDocument();
  });

  it('should render with correct styling', () => {
    const { container } = renderWithProviders(<HeroSection />);

    // Check for hero section container
    const heroSection = container.firstChild;
    expect(heroSection).toHaveClass('bg-gradient-to-r');
  });

  it('should be accessible', () => {
    renderWithProviders(<HeroSection />);

    // Check for heading level 1
    const heading = screen.getByRole('heading', { level: 1 });
    expect(heading).toBeInTheDocument();
  });
});
```

---

## Testing Hooks

### Strategy 5: Test Custom Hooks

**Target:** `usePDFGenerator.ts`

Custom hooks need `renderHook` from Testing Library.

#### Step-by-Step: Testing usePDFGenerator

**1. Create test file:**

```bash
touch apps/web/src/hooks/__tests__/usePDFGenerator.test.ts
```

**2. Write the test:**

```typescript
// apps/web/src/hooks/__tests__/usePDFGenerator.test.ts
import { renderHook, waitFor } from '@testing-library/react';
import { usePDFGenerator } from '../usePDFGenerator';
import type { Problem } from '@/api/types';

// Mock @react-pdf/renderer
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

describe('usePDFGenerator', () => {
  const mockProblems: Problem[] = [
    {
      id: '1',
      question: '1/2 + 1/3',
      answer: '5/6',
      type: 'FRACTION_ADDITION',
      difficulty: 'EASY',
      tags: [],
      createdAt: new Date().toISOString(),
      updatedAt: new Date().toISOString(),
    },
  ];

  it('should initialize with default state', () => {
    const { result } = renderHook(() => usePDFGenerator());

    expect(result.current.isGenerating).toBe(false);
    expect(result.current.error).toBeNull();
  });

  it('should generate PDF successfully', async () => {
    const { result } = renderHook(() => usePDFGenerator());

    // Call generatePDF
    result.current.generatePDF(mockProblems, 'Test Worksheet', false);

    // Should be generating
    expect(result.current.isGenerating).toBe(true);

    // Wait for completion
    await waitFor(() => {
      expect(result.current.isGenerating).toBe(false);
    });

    // Should have no error
    expect(result.current.error).toBeNull();
  });

  it('should handle errors during PDF generation', async () => {
    const { result } = renderHook(() => usePDFGenerator());

    // Pass invalid data to trigger error
    result.current.generatePDF([], 'Empty Worksheet', false);

    await waitFor(() => {
      expect(result.current.isGenerating).toBe(false);
    });

    // Adjust based on your error handling
    // expect(result.current.error).toBeTruthy();
  });

  it('should include answer key when requested', async () => {
    const { result } = renderHook(() => usePDFGenerator());

    result.current.generatePDF(mockProblems, 'Test Worksheet', true);

    await waitFor(() => {
      expect(result.current.isGenerating).toBe(false);
    });

    // Verify PDF was generated with answers
    // This depends on your implementation
  });
});
```

---

## Running Tests

### Run All Tests

```bash
# Run all tests
npm test

# Run integration tests only
npm run test:integration

# Run hook tests only
npm run test:hooks

# Run with coverage
npm run test:coverage
```

### Run Specific Test File

```bash
# Run specific test file
npm test -- Fraction.test.tsx

# Run tests matching pattern
npm test -- DifficultyFilter

# Run in watch mode
npm run test:watch
```

### Check Coverage

```bash
npm run test:coverage
```

**Target coverage:** 80%+ for components

---

## Testing Checklist

### For Each Component

- [ ] **Rendering**: Component renders without errors
- [ ] **Props**: Component handles all props correctly
- [ ] **User Interactions**: Clicks, changes, inputs work
- [ ] **Callbacks**: Callback functions are called with correct args
- [ ] **Conditional Rendering**: Shows/hides elements based on state
- [ ] **Styling**: Applies correct classes based on props/state
- [ ] **Accessibility**: Has proper ARIA labels, roles
- [ ] **Edge Cases**: Handles empty, null, undefined values

### For Each Hook

- [ ] **Initial State**: Returns correct initial values
- [ ] **State Updates**: Updates state correctly
- [ ] **Side Effects**: Triggers effects at right times
- [ ] **Cleanup**: Cleans up on unmount
- [ ] **Error Handling**: Handles errors gracefully
- [ ] **Dependencies**: Re-runs when dependencies change

---

## Quick Reference: Test Patterns

### Pattern 1: Simple Render Test

```typescript
it('should render component', () => {
  renderWithProviders(<MyComponent prop="value" />);
  expect(screen.getByText('Expected Text')).toBeInTheDocument();
});
```

### Pattern 2: User Interaction Test

```typescript
it('should handle click', async () => {
  const user = userEvent.setup();
  const mockFn = jest.fn();

  renderWithProviders(<MyComponent onClick={mockFn} />);

  await user.click(screen.getByRole('button'));
  expect(mockFn).toHaveBeenCalled();
});
```

### Pattern 3: Conditional Rendering Test

```typescript
it('should show element when condition is true', () => {
  renderWithProviders(<MyComponent showElement={true} />);
  expect(screen.getByText('Conditional Element')).toBeInTheDocument();
});

it('should hide element when condition is false', () => {
  renderWithProviders(<MyComponent showElement={false} />);
  expect(screen.queryByText('Conditional Element')).not.toBeInTheDocument();
});
```

### Pattern 4: Prop Validation Test

```typescript
it('should handle all prop combinations', () => {
  const { rerender } = renderWithProviders(
    <MyComponent variant="primary" />
  );

  expect(screen.getByRole('button')).toHaveClass('btn-primary');

  rerender(<MyComponent variant="secondary" />);

  expect(screen.getByRole('button')).toHaveClass('btn-secondary');
});
```

### Pattern 5: Async State Test

```typescript
it('should load data', async () => {
  renderWithProviders(<MyComponent />);

  expect(screen.getByText('Loading...')).toBeInTheDocument();

  await waitFor(() => {
    expect(screen.getByText('Data Loaded')).toBeInTheDocument();
  });
});
```

---

## Common Mistakes to Avoid

### ❌ Don't: Test Implementation Details

```typescript
// BAD - testing internal state
expect(component.state.count).toBe(5);

// GOOD - test user-visible behavior
expect(screen.getByText('Count: 5')).toBeInTheDocument();
```

### ❌ Don't: Use `container.querySelector` Unnecessarily

```typescript
// BAD
const element = container.querySelector('.my-class');

// GOOD - use semantic queries
const element = screen.getByRole('button', { name: 'Click me' });
```

### ❌ Don't: Forget to Clear Mocks

```typescript
// BAD - mocks leak between tests
describe('Tests', () => {
  it('test 1', () => { ... });
  it('test 2', () => { ... }); // May fail due to lingering mocks
});

// GOOD
describe('Tests', () => {
  beforeEach(() => {
    jest.clearAllMocks();
  });

  it('test 1', () => { ... });
  it('test 2', () => { ... });
});
```

### ❌ Don't: Test Third-Party Libraries

```typescript
// BAD - testing lucide-react's ChevronRight
expect(svg.getAttribute('width')).toBe('24');

// GOOD - just verify it renders
expect(container.querySelector('svg')).toBeInTheDocument();
```

---

## Next Steps

1. **Start with simple components** (Fraction, MixedNumber)
2. **Move to interactive components** (MainCategory, DifficultyFilter)
3. **Test error cases** (ErrorBoundary)
4. **Test hooks** (usePDFGenerator)
5. **Run coverage report** to identify gaps
6. **Add E2E tests** in Playwright for critical flows

## Resources

- **Testing Library Docs**: https://testing-library.com/docs/react-testing-library/intro/
- **Jest Matchers**: https://jestjs.io/docs/expect
- **User Event API**: https://testing-library.com/docs/user-event/intro
- **Project Tests**: `apps/web/src/__tests__/App.test.tsx` (examples)
- **Hook Tests**: `apps/web/src/hooks/__tests__/` (examples)
