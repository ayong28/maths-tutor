# Custom React Hooks

React hooks for fetching data from the Maths Tutor API with built-in loading and error states.

## Available Hooks

### `useCategories()`

Fetches all problem categories with counts.

**Usage:**
```tsx
import { useCategories } from '@/hooks';

function CategoryList() {
  const { data: categories, loading, error, refetch } = useCategories();

  if (loading) return <div>Loading categories...</div>;
  if (error) return <div>Error: {error}</div>;

  return (
    <div>
      {categories?.map(cat => (
        <div key={cat.type}>
          {cat.displayName} ({cat.count} problems)
        </div>
      ))}
      <button onClick={refetch}>Refresh</button>
    </div>
  );
}
```

**Returns:**
- `data: CategoryInfo[] | null` - Array of category objects or null while loading
- `loading: boolean` - True while fetching data
- `error: string | null` - Error message if request failed
- `refetch: () => void` - Function to manually trigger a re-fetch

---

### `useProblems(filters)`

Fetches problems with optional filters.

**Parameters:**
- `filters: ProblemFilters` (optional) - Filter options:
  - `type?: ProblemType` - Problem type (e.g., 'FRACTION_ADDITION')
  - `difficulty?: Difficulty[]` - Array of difficulties (['EASY', 'MEDIUM', 'HARD'])
  - `tags?: string[]` - Array of tags to filter by
  - `limit?: number` - Maximum number of problems (default: 30)
  - `seed?: string` - Seed for reproducible random selection

**Usage:**
```tsx
import { useProblems } from '@/hooks';

function Worksheet() {
  const { data: problems, loading, error, refetch } = useProblems({
    type: 'FRACTION_ADDITION',
    difficulty: ['EASY', 'MEDIUM'],
    tags: ['unlike-denominators'],
    limit: 15,
  });

  if (loading) return <div>Loading problems...</div>;
  if (error) return <div>Error: {error}</div>;

  return (
    <div>
      {problems?.map(problem => (
        <div key={problem.id}>
          <p>{problem.question}</p>
          <p>Answer: {problem.answer}</p>
        </div>
      ))}
    </div>
  );
}
```

**Returns:**
- `data: Problem[] | null` - Array of problem objects or null while loading
- `loading: boolean` - True while fetching data
- `error: string | null` - Error message if request failed
- `refetch: () => void` - Function to manually trigger a re-fetch

---

### `useTags(type)`

Fetches available tags for a specific problem type.

**Parameters:**
- `type: ProblemType` - The problem type to fetch tags for

**Usage:**
```tsx
import { useTags } from '@/hooks';

function TagFilter({ problemType }: { problemType: ProblemType }) {
  const { data: tags, loading, error } = useTags(problemType);

  if (loading) return <div>Loading tags...</div>;
  if (error) return <div>Error: {error}</div>;

  return (
    <select>
      <option value="">All tags</option>
      {tags?.map(tag => (
        <option key={tag} value={tag}>
          {tag}
        </option>
      ))}
    </select>
  );
}
```

**Returns:**
- `data: string[] | null` - Array of tag strings or null while loading
- `loading: boolean` - True while fetching data
- `error: string | null` - Error message if request failed
- `refetch: () => void` - Function to manually trigger a re-fetch

---

## Features

All hooks include:

✅ **Automatic fetching** - Data fetched on mount and when dependencies change
✅ **Loading states** - Built-in loading boolean
✅ **Error handling** - Catches and exposes API errors
✅ **Cleanup** - Prevents state updates on unmounted components
✅ **Refetch support** - Manual re-fetch via `refetch()` function
✅ **Type safety** - Full TypeScript support with proper return types

## Implementation Details

### Dependency Tracking

Hooks automatically re-fetch when their parameters change:

- `useCategories()` - Fetches once on mount
- `useProblems(filters)` - Re-fetches when any filter changes
- `useTags(type)` - Re-fetches when type changes

### Cleanup

All hooks implement cleanup to prevent memory leaks:
```tsx
useEffect(() => {
  let isMounted = true;
  // ... fetch logic only updates state if isMounted
  return () => { isMounted = false; };
}, [dependencies]);
```

### Error Handling

Hooks catch three types of errors:
1. **ApiError** - Errors from the API client (HTTP errors)
2. **Error** - Network errors, parsing errors
3. **Unknown** - Any other error type

All are converted to user-friendly string messages.
