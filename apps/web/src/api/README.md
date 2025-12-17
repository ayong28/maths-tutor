# API Client

TypeScript client for the Maths Tutor API backend.

## Setup

The API client is configured to connect to `http://localhost:3001` by default. You can override this with the `VITE_API_URL` environment variable.

**Development:**
- Vite proxy forwards `/api/*` requests to `http://localhost:3001`
- Start both servers: `npm run dev` (frontend) + `npm run api:dev` (backend)

## Usage

### Import

```typescript
import { getCategories, getProblems, getTags, ApiError } from '@/api';
import type { ProblemType, Difficulty } from '@/api';
```

### Examples

**Fetch all categories:**
```typescript
const categories = await getCategories();
// Returns: [{ type: 'FRACTION_ADDITION', count: 210, displayName: 'Fraction Addition' }, ...]
```

**Fetch problems with filters:**
```typescript
// All fraction addition problems (default limit: 30)
const problems = await getProblems({
  type: 'FRACTION_ADDITION'
});

// Filter by difficulty and tags
const problems = await getProblems({
  type: 'FRACTION_ADDITION',
  difficulty: ['EASY', 'MEDIUM'],
  tags: ['unlike-denominators'],
  limit: 15,
});

// Reproducible with seed
const problems = await getProblems({
  type: 'ALGEBRA_COLLECTING_TERMS',
  seed: 'class-2025-01',
  limit: 30,
});
```

**Fetch tags for a type:**
```typescript
const tags = await getTags('FRACTION_ADDITION');
// Returns: ['unlike-denominators', 'set-1', 'mixed-numbers-in-answer', ...]
```

**Error Handling:**
```typescript
import { getCategories, ApiError } from '@/api';

try {
  const categories = await getCategories();
  console.log(categories);
} catch (error) {
  if (error instanceof ApiError) {
    console.error('API Error:', error.message);
    console.error('Status:', error.status);
  } else {
    console.error('Unexpected error:', error);
  }
}
```

## API Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/categories` | List all problem types with counts |
| GET | `/api/problems` | Query problems with filters |
| GET | `/api/tags/:type` | Get available tags for a type |
| GET | `/health` | Health check |

## Types

All TypeScript types are exported from `@/api`:

- `CategoryInfo` - Category metadata
- `Problem` - Full problem object
- `ProblemFilters` - Filter options for querying problems
- `ProblemType` - Enum of problem types
- `Difficulty` - Enum of difficulty levels (EASY, MEDIUM, HARD)
