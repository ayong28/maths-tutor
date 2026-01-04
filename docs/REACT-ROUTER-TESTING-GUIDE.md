# React Router Testing Guide

Step-by-step documentation for fixing tests after implementing React Router 7 in this project.

## Table of Contents

1. [Overview](#overview)
2. [Common Issues](#common-issues)
3. [Setup Test Utilities](#setup-test-utilities)
4. [Unit Testing Components](#unit-testing-components)
5. [Testing React Router Hooks](#testing-react-router-hooks)
6. [Integration Testing](#integration-testing)
7. [E2E Testing with Playwright](#e2e-testing-with-playwright)
8. [Common Errors & Solutions](#common-errors--solutions)

## Overview

When React Router is added to a project, existing tests often fail because:
- Components now require router context
- Navigation and links need router providers
- Route parameters and search params require mocking
- Location changes need proper handling

**Test Stack:**
- **Unit/Integration**: Jest + @testing-library/react (74 tests)
- **E2E**: Playwright (47 tests)
- **Router**: React Router 7

## Common Issues

### Issue 1: "useNavigate() may be used only in the context of a <Router> component"

**Error:**
```
Error: useNavigate() may be used only in the context of a <Router> component
```

**Cause:** Component uses React Router hooks but test doesn't provide router context.

**Solution:** Wrap component in router provider (see [Setup Test Utilities](#setup-test-utilities)).

---

### Issue 2: "useParams() may be used only in the context of a <Router> component"

**Error:**
```
Error: useParams() may be used only in the context of a <Router> component
```

**Cause:** Component reads route params without router context.

**Solution:** Mock route with parameters (see [Testing Components with Route Params](#testing-components-with-route-params)).

---

### Issue 3: Links Don't Navigate in Tests

**Issue:** `<Link>` components render but don't update location.

**Cause:** Tests need to wait for navigation and re-renders.

**Solution:** Use `waitFor` and `userEvent` (see [Testing Navigation](#testing-navigation)).

---

### Issue 4: E2E Tests Fail on Navigation

**Issue:** Playwright tests timeout or fail on route changes.

**Cause:** Need to wait for React Router navigation and hydration.

**Solution:** Use proper Playwright waiters (see [E2E Testing](#e2e-testing-with-playwright)).

## Test File Organization

This project follows Jest best practices for test organization:

**Structure:**
```
src/
  components/
    Navigation.tsx
    __tests__/
      Navigation.test.tsx        # ✅ Test next to component
  hooks/
    useURLFilters.ts
    __tests__/
      useURLFilters.test.ts      # ✅ Test next to hook
  __tests__/
    App.test.tsx                 # ✅ Root-level tests
    utils/
      test-utils.tsx             # ✅ Shared test utilities
```

**Conventions:**
- Tests in `__tests__/` folders (collocated with code)
- Test files end with `.test.ts` or `.test.tsx`
- Import from parent: `import { Navigation } from '../Navigation';`
- Shared utilities in `src/__tests__/utils/`

**Jest config supports both:**
```javascript
testMatch: [
  '**/__tests__/**/*.test.ts',     // Tests in __tests__ folders
  '**/__tests__/**/*.test.tsx',
  '**/*.test.ts',                  // Tests anywhere with .test extension
  '**/*.test.tsx'
]
```

## Setup Test Utilities

### Create Test Wrapper Utility

Create `apps/web/src/__tests__/utils/test-utils.tsx`:

```typescript
import { render, type RenderOptions, type RenderResult } from '@testing-library/react';
import { type ReactElement, type ReactNode } from 'react';
import { MemoryRouter, Routes, Route } from 'react-router-dom';

type WrapperProps = {
  children: ReactNode;
};

type CustomRenderOptions = Omit<RenderOptions, 'wrapper'> & {
  initialEntries?: string[];
  initialIndex?: number;
  route?: string;
};

/**
 * Renders component with MemoryRouter for testing
 *
 * @example
 * renderWithRouter(<MyComponent />, { route: '/users/123' })
 */
export function renderWithRouter(
  ui: ReactElement,
  {
    initialEntries = ['/'],
    initialIndex = 0,
    route = '/',
    ...renderOptions
  }: CustomRenderOptions = {}
): RenderResult {
  const Wrapper = ({ children }: WrapperProps): ReactElement => (
    <MemoryRouter initialEntries={initialEntries} initialIndex={initialIndex}>
      <Routes>
        <Route path={route} element={children} />
      </Routes>
    </MemoryRouter>
  );

  return render(ui, { wrapper: Wrapper, ...renderOptions });
}

/**
 * Renders component with full route configuration
 * Useful for testing nested routes or multiple route scenarios
 */
export function renderWithRoutes(
  routes: Array<{ path: string; element: ReactElement }>,
  { initialEntries = ['/'], initialIndex = 0 }: CustomRenderOptions = {}
): RenderResult {
  return render(
    <MemoryRouter initialEntries={initialEntries} initialIndex={initialIndex}>
      <Routes>
        {routes.map((route, idx) => (
          <Route key={idx} path={route.path} element={route.element} />
        ))}
      </Routes>
    </MemoryRouter>
  );
}
```

### Verify Jest Config

Your `apps/web/jest.config.cjs` should already be set up:

```javascript
// jest.config.cjs
module.exports = {
  preset: 'ts-jest',
  testEnvironment: 'jsdom',
  setupFilesAfterEnv: ['<rootDir>/src/setupTests.ts'],
  moduleNameMapper: {
    '^@/(.*)$': '<rootDir>/src/$1',
  },
};
```

### Test Setup File

The setup file `apps/web/src/setupTests.ts` already exists:

```typescript
import '@testing-library/jest-dom';
```

**Optional: Add mocks if needed:**

```typescript
import '@testing-library/jest-dom';

// Mock window.matchMedia (required for some components)
Object.defineProperty(window, 'matchMedia', {
  writable: true,
  value: jest.fn().mockImplementation(query => ({
    matches: false,
    media: query,
    onchange: null,
    addListener: jest.fn(),
    removeListener: jest.fn(),
    addEventListener: jest.fn(),
    removeEventListener: jest.fn(),
    dispatchEvent: jest.fn(),
  })),
});

// Mock scrollTo (often used with navigation)
window.scrollTo = jest.fn();
```

## Unit Testing Components

### Testing Components with Links

**Component:**
```typescript
// src/components/Navigation.tsx
import { type ReactElement } from 'react';
import { Link } from 'react-router-dom';

export function Navigation(): ReactElement {
  return (
    <nav>
      <Link to="/">Home</Link>
      <Link to="/about">About</Link>
      <Link to="/fractions/addition">Fractions</Link>
    </nav>
  );
}
```

**Test:**
```typescript
// src/components/__tests__/Navigation.test.tsx
import { screen } from '@testing-library/react';
import { Navigation } from '../Navigation';
import { renderWithRouter } from '../../__tests__/utils/test-utils';

describe('Navigation', () => {
  it('should render navigation links', () => {
    renderWithRouter(<Navigation />);

    expect(screen.getByRole('link', { name: 'Home' })).toBeInTheDocument();
    expect(screen.getByRole('link', { name: 'About' })).toBeInTheDocument();
    expect(screen.getByRole('link', { name: 'Fractions' })).toBeInTheDocument();
  });

  it('should have correct href attributes', () => {
    renderWithRouter(<Navigation />);

    const homeLink = screen.getByRole('link', { name: 'Home' });
    expect(homeLink).toHaveAttribute('href', '/');

    const fractionsLink = screen.getByRole('link', { name: 'Fractions' });
    expect(fractionsLink).toHaveAttribute('href', '/fractions/addition');
  });
});
```

### Testing Components with Route Params

**Component:**
```typescript
// src/components/ProblemDetails.tsx
import { type ReactElement } from 'react';
import { useParams } from 'react-router-dom';

export function ProblemDetails(): ReactElement {
  const { problemType } = useParams<{ problemType: string }>();

  return (
    <div>
      <h1>Problem Type: {problemType ?? 'Unknown'}</h1>
    </div>
  );
}
```

**Test:**
```typescript
// src/components/__tests__/ProblemDetails.test.tsx
import { screen } from '@testing-library/react';
import { ProblemDetails } from '../ProblemDetails';
import { renderWithRouter } from '../../__tests__/utils/test-utils';

describe('ProblemDetails', () => {
  it('should display problem type from route params', () => {
    renderWithRouter(<ProblemDetails />, {
      route: '/problems/:problemType',
      initialEntries: ['/problems/FRACTION_ADDITION'],
    });

    expect(screen.getByText('Problem Type: FRACTION_ADDITION')).toBeInTheDocument();
  });

  it('should handle different problem types', () => {
    renderWithRouter(<ProblemDetails />, {
      route: '/problems/:problemType',
      initialEntries: ['/problems/ALGEBRA_SIMPLIFICATION'],
    });

    expect(screen.getByText('Problem Type: ALGEBRA_SIMPLIFICATION')).toBeInTheDocument();
  });
});
```

### Testing Components with Search Params

**Component:**
```typescript
// src/components/FilteredProblems.tsx
import { type ReactElement } from 'react';
import { useSearchParams } from 'react-router-dom';

export function FilteredProblems(): ReactElement {
  const [searchParams] = useSearchParams();
  const difficulty = searchParams.get('difficulty') ?? 'all';
  const category = searchParams.get('category') ?? 'all';

  return (
    <div>
      <p>Difficulty: {difficulty}</p>
      <p>Category: {category}</p>
    </div>
  );
}
```

**Test:**
```typescript
// src/components/__tests__/FilteredProblems.test.tsx
import { screen } from '@testing-library/react';
import { FilteredProblems } from '../FilteredProblems';
import { renderWithRouter } from '../../__tests__/utils/test-utils';

describe('FilteredProblems', () => {
  it('should display default filters when no params', () => {
    renderWithRouter(<FilteredProblems />);

    expect(screen.getByText('Difficulty: all')).toBeInTheDocument();
    expect(screen.getByText('Category: all')).toBeInTheDocument();
  });

  it('should display filters from search params', () => {
    renderWithRouter(<FilteredProblems />, {
      initialEntries: ['/?difficulty=hard&category=fractions'],
    });

    expect(screen.getByText('Difficulty: hard')).toBeInTheDocument();
    expect(screen.getByText('Category: fractions')).toBeInTheDocument();
  });

  it('should handle partial search params', () => {
    renderWithRouter(<FilteredProblems />, {
      initialEntries: ['/?difficulty=easy'],
    });

    expect(screen.getByText('Difficulty: easy')).toBeInTheDocument();
    expect(screen.getByText('Category: all')).toBeInTheDocument();
  });
});
```

### Testing Navigation

**Component:**
```typescript
// src/components/ProblemCard.tsx
import { type ReactElement } from 'react';
import { useNavigate } from 'react-router-dom';

type ProblemCardProps = {
  problemId: string;
  title: string;
};

export function ProblemCard({ problemId, title }: ProblemCardProps): ReactElement {
  const navigate = useNavigate();

  const handleClick = (): void => {
    navigate(`/problems/${problemId}`);
  };

  return (
    <div>
      <h3>{title}</h3>
      <button onClick={handleClick}>View Details</button>
    </div>
  );
}
```

**Test:**
```typescript
// src/components/__tests__/ProblemCard.test.tsx
import { screen, waitFor } from '@testing-library/react';
import userEvent from '@testing-library/user-event';
import { ProblemCard } from '../ProblemCard';
import { renderWithRouter } from '../../__tests__/utils/test-utils';

describe('ProblemCard', () => {
  it('should navigate to problem details on button click', async (): Promise<void> => {
    const user = userEvent.setup();

    renderWithRouter(
      <>
        <ProblemCard problemId="123" title="Fraction Addition" />
        {/* Route to verify navigation */}
        <div data-testid="details-page">Details Page</div>
      </>,
      {
        route: '/problems/:problemId',
        initialEntries: ['/'],
      }
    );

    const button = screen.getByRole('button', { name: 'View Details' });
    await user.click(button);

    // Verify navigation occurred (location would change in real app)
    // In MemoryRouter, we can check if the route changed
    await waitFor(() => {
      expect(screen.queryByText('Details Page')).toBeInTheDocument();
    });
  });
});
```

## Testing React Router Hooks

### Mocking useNavigate

**Component:**
```typescript
// src/components/LogoutButton.tsx
import { type ReactElement } from 'react';
import { useNavigate } from 'react-router-dom';

export function LogoutButton(): ReactElement {
  const navigate = useNavigate();

  const handleLogout = (): void => {
    // Logout logic
    navigate('/login');
  };

  return <button onClick={handleLogout}>Logout</button>;
}
```

**Test:**
```typescript
// src/components/__tests__/LogoutButton.test.tsx
import { screen } from '@testing-library/react';
import userEvent from '@testing-library/user-event';
import { LogoutButton } from '../LogoutButton';
import { renderWithRouter } from '../../__tests__/utils/test-utils';
import * as ReactRouter from 'react-router-dom';

describe('LogoutButton', () => {
  it('should navigate to login on logout', async () => {
    const user = userEvent.setup();
    const mockNavigate = jest.fn();

    // Mock useNavigate
    jest.spyOn(ReactRouter, 'useNavigate').mockReturnValue(mockNavigate);

    renderWithRouter(<LogoutButton />);

    const button = screen.getByRole('button', { name: 'Logout' });
    await user.click(button);

    expect(mockNavigate).toHaveBeenCalledWith('/login');
  });
});
```

### Mocking useLocation

**Component:**
```typescript
// src/components/Breadcrumbs.tsx
import { type ReactElement } from 'react';
import { useLocation } from 'react-router-dom';

export function Breadcrumbs(): ReactElement {
  const location = useLocation();
  const paths = location.pathname.split('/').filter(Boolean);

  return (
    <nav>
      {paths.map((path) => (
        <span key={path}>{path} / </span>
      ))}
    </nav>
  );
}
```

**Test:**
```typescript
// src/components/__tests__/Breadcrumbs.test.tsx
import { screen } from '@testing-library/react';
import { Breadcrumbs } from '../Breadcrumbs';
import { renderWithRouter } from '../../__tests__/utils/test-utils';

describe('Breadcrumbs', () => {
  it('should display breadcrumbs from current path', () => {
    renderWithRouter(<Breadcrumbs />, {
      initialEntries: ['/fractions/addition/easy'],
    });

    expect(screen.getByText('fractions /')).toBeInTheDocument();
    expect(screen.getByText('addition /')).toBeInTheDocument();
    expect(screen.getByText('easy /')).toBeInTheDocument();
  });

  it('should handle root path', () => {
    const { container } = renderWithRouter(<Breadcrumbs />, {
      initialEntries: ['/'],
    });

    // Root path should have no breadcrumbs
    expect(container.querySelector('nav')).toBeEmptyDOMElement();
  });
});
```

## Integration Testing

### Testing Route Navigation Flow

**Test:**
```typescript
// src/routes/__tests__/routes.test.tsx
import { screen, waitFor } from '@testing-library/react';
import userEvent from '@testing-library/user-event';
import { renderWithRoutes } from '../../__tests__/utils/test-utils';
import { HomePage } from '../../pages/HomePage';
import { FractionsPage } from '../../pages/FractionsPage';
import { ProblemDetailsPage } from '../../pages/ProblemDetailsPage';

describe('Route Navigation Flow', () => {
  it('should navigate from home to fractions to problem details', async () => {
    const user = userEvent.setup();

    renderWithRoutes([
      { path: '/', element: <HomePage /> },
      { path: '/fractions/:type', element: <FractionsPage /> },
      { path: '/problems/:id', element: <ProblemDetailsPage /> },
    ]);

    // Start at home page
    expect(screen.getByText('Welcome to Math Tutor')).toBeInTheDocument();

    // Navigate to fractions
    const fractionsLink = screen.getByRole('link', { name: 'Fractions' });
    await user.click(fractionsLink);

    await waitFor(() => {
      expect(screen.getByText('Fraction Problems')).toBeInTheDocument();
    });

    // Navigate to specific problem
    const problemLink = screen.getByRole('link', { name: 'Problem 1' });
    await user.click(problemLink);

    await waitFor(() => {
      expect(screen.getByText('Problem Details')).toBeInTheDocument();
    });
  });
});
```

### Testing Protected Routes

**Component:**
```typescript
// src/components/ProtectedRoute.tsx
import { type ReactElement, type ReactNode } from 'react';
import { Navigate } from 'react-router-dom';

type ProtectedRouteProps = {
  children: ReactNode;
  isAuthenticated: boolean;
};

export function ProtectedRoute({ children, isAuthenticated }: ProtectedRouteProps): ReactElement {
  if (!isAuthenticated) {
    return <Navigate to="/login" replace />;
  }

  return <>{children}</>;
}
```

**Test:**
```typescript
// src/components/__tests__/ProtectedRoute.test.tsx
import { screen } from '@testing-library/react';
import { ProtectedRoute } from '../ProtectedRoute';
import { renderWithRoutes } from '../../__tests__/utils/test-utils';

describe('ProtectedRoute', () => {
  it('should render children when authenticated', () => {
    renderWithRoutes([
      {
        path: '/dashboard',
        element: (
          <ProtectedRoute isAuthenticated={true}>
            <div>Dashboard Content</div>
          </ProtectedRoute>
        ),
      },
    ], {
      initialEntries: ['/dashboard'],
    });

    expect(screen.getByText('Dashboard Content')).toBeInTheDocument();
  });

  it('should redirect to login when not authenticated', () => {
    renderWithRoutes([
      {
        path: '/dashboard',
        element: (
          <ProtectedRoute isAuthenticated={false}>
            <div>Dashboard Content</div>
          </ProtectedRoute>
        ),
      },
      {
        path: '/login',
        element: <div>Login Page</div>,
      },
    ], {
      initialEntries: ['/dashboard'],
    });

    expect(screen.queryByText('Dashboard Content')).not.toBeInTheDocument();
    expect(screen.getByText('Login Page')).toBeInTheDocument();
  });
});
```

## E2E Testing with Playwright

### Basic Navigation Test

```typescript
// e2e/navigation.spec.ts
import { test, expect } from '@playwright/test';

test.describe('Navigation', () => {
  test('should navigate between pages', async ({ page }) => {
    // Go to home page
    await page.goto('/');
    await expect(page).toHaveURL('/');

    // Click on fractions link
    await page.click('text=Fractions');

    // Wait for navigation
    await page.waitForURL('/fractions/addition');
    await expect(page).toHaveURL('/fractions/addition');

    // Verify page content loaded
    await expect(page.locator('h1')).toContainText('Fraction Addition');
  });

  test('should handle browser back/forward navigation', async ({ page }) => {
    await page.goto('/');

    // Navigate to fractions page
    await page.click('text=Fractions');
    await page.waitForURL('/fractions/addition');

    // Go back
    await page.goBack();
    await expect(page).toHaveURL('/');

    // Go forward
    await page.goForward();
    await expect(page).toHaveURL('/fractions/addition');
  });
});
```

### Testing Deep Links

```typescript
// e2e/deep-links.spec.ts
import { test, expect } from '@playwright/test';

test.describe('Deep Links', () => {
  test('should load page directly from URL', async ({ page }) => {
    // Navigate directly to deep link
    await page.goto('/fractions/addition?difficulty=hard');

    // Verify correct page loaded
    await expect(page.locator('h1')).toContainText('Fraction Addition');

    // Verify filters applied from URL
    await expect(page.locator('[data-testid="difficulty-filter"]')).toHaveValue('hard');
  });

  test('should handle route parameters', async ({ page }) => {
    await page.goto('/problems/123');

    await expect(page.locator('h1')).toContainText('Problem #123');
  });
});
```

### Testing URL Updates

```typescript
// e2e/url-state.spec.ts
import { test, expect } from '@playwright/test';

test.describe('URL State Management', () => {
  test('should update URL when filters change', async ({ page }) => {
    await page.goto('/fractions/addition');

    // Select difficulty filter
    await page.selectOption('[data-testid="difficulty-filter"]', 'hard');

    // Wait for URL to update
    await page.waitForURL('/fractions/addition?difficulty=hard');
    await expect(page).toHaveURL('/fractions/addition?difficulty=hard');

    // Select category filter
    await page.selectOption('[data-testid="category-filter"]', 'proper');

    // URL should include both params
    await page.waitForURL('/fractions/addition?difficulty=hard&category=proper');
  });

  test('should preserve filters on page reload', async ({ page }) => {
    // Navigate with filters
    await page.goto('/fractions/addition?difficulty=hard&category=proper');

    // Verify filters applied
    await expect(page.locator('[data-testid="difficulty-filter"]')).toHaveValue('hard');
    await expect(page.locator('[data-testid="category-filter"]')).toHaveValue('proper');

    // Reload page
    await page.reload();

    // Filters should persist
    await expect(page.locator('[data-testid="difficulty-filter"]')).toHaveValue('hard');
    await expect(page.locator('[data-testid="category-filter"]')).toHaveValue('proper');
  });
});
```

### Waiting for React Router Navigation

```typescript
// e2e/helpers/navigation.ts
import { type Page } from '@playwright/test';

/**
 * Wait for React Router navigation to complete
 */
export async function waitForNavigation(page: Page, expectedUrl: string): Promise<void> {
  await page.waitForURL(expectedUrl);

  // Wait for React to finish rendering
  await page.waitForLoadState('networkidle');

  // Optional: wait for specific element to ensure hydration
  await page.waitForSelector('[data-testid="app-ready"]', { state: 'attached' });
}

/**
 * Click link and wait for navigation
 */
export async function clickAndNavigate(page: Page, selector: string, expectedUrl: string): Promise<void> {
  await page.click(selector);
  await waitForNavigation(page, expectedUrl);
}
```

**Usage:**
```typescript
import { test, expect } from '@playwright/test';
import { clickAndNavigate } from './helpers/navigation';

test('should navigate with helper', async ({ page }) => {
  await page.goto('/');

  await clickAndNavigate(page, 'text=Fractions', '/fractions/addition');

  await expect(page.locator('h1')).toContainText('Fraction Addition');
});
```

## Common Errors & Solutions

### Error: "Cannot read property 'pathname' of undefined"

**Cause:** Component uses `useLocation()` without router context.

**Solution:**
```typescript
// Before (failing)
render(<MyComponent />);

// After (fixed)
renderWithRouter(<MyComponent />);
```

---

### Error: "Testing Library encountered an uncaught error during test teardown"

**Cause:** Component performs navigation during unmount.

**Solution:**
```typescript
import { act } from '@testing-library/react';

// Cleanup navigation effects
afterEach(() => {
  act(() => {
    // Flush pending effects
  });
});
```

---

### Error: "Warning: Can't perform a React state update on an unmounted component"

**Cause:** Async operations continue after navigation/unmount.

**Solution:**
```typescript
// In component
useEffect(() => {
  let isMounted = true;

  async function fetchData(): Promise<void> {
    const data = await api.getData();
    if (isMounted) {
      setData(data);
    }
  }

  fetchData();

  return (): void => {
    isMounted = false;
  };
}, []);
```

---

### Error: Playwright test times out on navigation

**Cause:** React Router navigation not waited for properly.

**Solution:**
```typescript
// Before (timing out)
await page.click('text=Next Page');

// After (fixed)
await page.click('text=Next Page');
await page.waitForURL('/next-page');
await page.waitForLoadState('networkidle');
```

---

### Error: "No routes matched location"

**Cause:** Test routes don't match actual route configuration.

**Solution:**
```typescript
// Ensure route patterns match your actual routes
renderWithRouter(<MyComponent />, {
  route: '/problems/:id',  // Match your actual route pattern
  initialEntries: ['/problems/123'],
});
```

---

### Error: Search params not updating in tests

**Cause:** Not using `setSearchParams` correctly or not waiting for updates.

**Solution:**
```typescript
import { waitFor } from '@testing-library/react';

it('should update search params', async () => {
  const user = userEvent.setup();
  renderWithRouter(<FilterComponent />);

  const filterButton = screen.getByRole('button', { name: 'Apply Filter' });
  await user.click(filterButton);

  await waitFor(() => {
    // Check URL updated
    expect(window.location.search).toContain('difficulty=hard');
  });
});
```

## Best Practices

### 1. Use MemoryRouter for Tests

✅ **Good:**
```typescript
renderWithRouter(<Component />);
```

❌ **Bad:**
```typescript
render(
  <BrowserRouter>
    <Component />
  </BrowserRouter>
);
```

**Why:** `MemoryRouter` doesn't interact with browser URL, making tests isolated.

---

### 2. Test Navigation Logic, Not Implementation

✅ **Good:**
```typescript
it('should navigate to details page', async () => {
  const user = userEvent.setup();
  renderWithRouter(<ProblemList />);

  await user.click(screen.getByText('Problem 1'));

  await waitFor(() => {
    expect(screen.getByText('Problem Details')).toBeInTheDocument();
  });
});
```

❌ **Bad:**
```typescript
it('should call navigate with correct path', () => {
  const mockNavigate = vi.fn();
  vi.spyOn(ReactRouter, 'useNavigate').mockReturnValue(mockNavigate);

  // Testing implementation, not behavior
});
```

---

### 3. Use Route Parameters in Tests

✅ **Good:**
```typescript
renderWithRouter(<ProblemPage />, {
  route: '/problems/:id',
  initialEntries: ['/problems/123'],
});
```

❌ **Bad:**
```typescript
// Mocking useParams separately
vi.mock('react-router-dom', () => ({
  useParams: () => ({ id: '123' }),
}));
```

---

### 4. Test Full User Flows in E2E

✅ **Good:**
```typescript
test('complete worksheet generation flow', async ({ page }) => {
  await page.goto('/');
  await page.click('text=Create Worksheet');
  await page.waitForURL('/worksheet/new');

  await page.selectOption('[name="type"]', 'FRACTION_ADDITION');
  await page.click('text=Generate');

  await page.waitForURL(/\/worksheet\/\d+/);
  await expect(page.locator('h1')).toContainText('Worksheet Generated');
});
```

---

### 5. Isolate Router Concerns

✅ **Good:**
```typescript
// Separate routing tests from component logic tests
describe('ProblemCard - Rendering', () => {
  it('should display problem title', () => {
    render(<ProblemCard title="Test" problemId="1" />);
    // Test rendering without router
  });
});

describe('ProblemCard - Navigation', () => {
  it('should navigate on click', async () => {
    renderWithRouter(<ProblemCard title="Test" problemId="1" />);
    // Test navigation
  });
});
```

## Migration Checklist

When adding React Router to existing tests:

**File Organization:**
- [ ] Create test files in `__tests__/` folders next to source files
- [ ] Name test files with `.test.ts` or `.test.tsx` extension
- [ ] Create `src/__tests__/utils/test-utils.tsx` for shared utilities

**Test Utilities:**
- [ ] Create `renderWithRouter` utility in `src/__tests__/utils/test-utils.tsx`
- [ ] Create `renderWithRoutes` utility
- [ ] Update `src/setupTests.ts` with required mocks (if needed)

**Component Tests:**
- [ ] Identify components using router hooks
- [ ] Wrap router-dependent components in `renderWithRouter`
- [ ] Add route params to tests using `useParams`
- [ ] Add initial entries for tests using `useSearchParams`
- [ ] Mock `useNavigate` where navigation is tested
- [ ] Update imports to use relative paths from `__tests__/` folder

**E2E Tests:**
- [ ] Update E2E tests to wait for navigation
- [ ] Add `waitForURL` after clicks that trigger navigation
- [ ] Test deep links in E2E suite
- [ ] Verify browser back/forward in E2E
- [ ] Test URL state persistence

## Resources

- **React Router Testing Docs**: https://reactrouter.com/en/main/start/testing
- **Testing Library Router Example**: https://testing-library.com/docs/example-react-router/
- **Playwright Navigation**: https://playwright.dev/docs/navigations
- **Jest Documentation**: https://jestjs.io/docs/getting-started

## See Also

- `docs/E2E-TEST-PLAN.md` - Comprehensive E2E test coverage (47 tests)
- `docs/PROJECT-SETUP.md` - Project structure and routing setup
- `apps/web/src/__tests__/utils/` - Test utilities and helpers
- `apps/web/src/hooks/__tests__/` - Hook test examples
- `apps/web/jest.config.cjs` - Jest configuration
