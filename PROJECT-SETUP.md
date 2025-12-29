# Project Setup & Architecture

This document contains detailed architecture, specifications, and setup information for the maths-tutor project.

## Table of Contents

- [Architecture Overview](#architecture-overview)
- [Markdown-to-PDF Generator](#markdown-to-pdf-worksheet-generator)
- [Test Suite Architecture](#test-suite-architecture)
- [React Frontend & API Backend](#react-frontend--api-backend)
- [Database Setup](#database-setup)
- [Tech Stack](#tech-stack)
- [Available Worksheets](#available-worksheets)
- [Future Worksheet Roadmap](#future-worksheet-roadmap)
- [Nice-to-Have Features](#nice-to-have-features-future-versions)

## Architecture Overview

**Monorepo Structure:**
```
maths-tutor/
├── apps/
│   └── web/                    # React frontend (Vite + TypeScript + Tailwind)
│       ├── src/
│       │   ├── components/     # Reusable React components
│       │   ├── hooks/          # Custom React hooks
│       │   ├── api/            # API client
│       │   ├── types/          # TypeScript type definitions
│       │   ├── utils/          # Utility functions
│       │   └── App.tsx         # Main application
│       ├── index.html
│       ├── vite.config.ts
│       └── tailwind.config.js
├── packages/
│   └── api/                    # Express API backend
│       ├── src/
│       │   ├── routes/         # API route handlers
│       │   ├── services/       # Database business logic
│       │   └── index.ts        # Express server
│       ├── package.json
│       └── tsconfig.json
├── src/                        # CLI tools & shared code
├── prisma/                     # Database schema (shared)
└── package.json                # Root workspace config
```

## Markdown-to-PDF Worksheet Generator

Location: `generate-worksheet-pdf.ts`

A reusable script that converts markdown worksheets into properly formatted PDFs with fraction notation and algebraic expressions.

### Configuration & Types

- `CONFIG` - PDF layout constants (margins, column positions, font sizes, spacing)
- `REGEX` - Pre-compiled regular expressions for efficient pattern matching
- `NonEmptyString` - Branded type ensuring non-empty strings
- `PositiveNumber` - Branded type ensuring positive numbers
- `Coordinate` - Branded type for coordinate values

### Key Functions

- `parseMarkdownWorksheet(filePath)` - Parses markdown file, returns WorksheetData with validation
- `createWorksheetPDF(worksheetData)` - Creates PDF document (pure, no I/O)
- `savePDFToFile(doc, outputPath)` - Saves PDF document to file (async Promise)
- `generateWorksheetPDF(worksheetData, outputPath)` - Async wrapper: creates and saves PDF
- `drawFraction()` - Renders fractions with proper mathematical notation
- `drawNumber()` - Handles whole numbers, simple fractions, mixed numbers, and algebraic expressions
- `drawExpression()` - Draws mathematical expressions (e.g., "1/8 + 3/8", "2a + 3a")
- `validateExpression()` - Validates expressions for malformations (empty, trailing operators, unmatched parens)
- `validateFraction()` - Checks for division by zero in fractions
- `validateProblemAnswerAlignment()` - Validates problem-answer alignment (threshold & warnings)

### Markdown Format Expected

```markdown
### Practice Sheet – [Title]

| #  | Fraction/Expression | Answer space | #  | Fraction/Expression | Answer space |
|----|--------------------|--------------|----|--------------------|--------------|
| 1  | 1/8 + 3/8          |              | 16 | ...                |              |
...

### Answer Key (for you/parent – do not show to child yet)

1. 1/2
2. 7/10
3. 2/3
...

**Tip for practice:**
- Tip 1
- Tip 2
```

**Note:** Column headers can be "Fraction" (for fraction worksheets) or "Expression" (for algebra worksheets).

### Important Notes

- Answer key MUST be one answer per line (not multiple per line)
- Parser uses `(.+)` regex to capture full answers including mixed numbers like "1 5/6"
- Left column problems (1-15) are collected first, then right column (16-30)
- This ensures PDF displays problems in correct sequential order

### Layout

- Two-column layout with 15 problems per column (30 total)
- Page 1: Problems with blank answer spaces
- Page 2: Complete answer key
- Page 3: Tips (optional)

## Test Suite Architecture

The project uses Jest with TypeScript for comprehensive test coverage:

### Test Files

**PDF Generator Tests (32 tests):**
- `__tests__/parseMarkdownWorksheet.test.ts` - 12 tests for markdown parsing
- `__tests__/drawExpression.test.ts` - 11 tests for expression rendering (includes critical multi-term regression test)
- `__tests__/drawNumber.test.ts` - 9 tests for number/fraction/algebra rendering

**React Hook Tests (53 tests):**
- `apps/web/src/hooks/__tests__/useCategories.test.ts` - 11 tests
- `apps/web/src/hooks/__tests__/useProblems.test.ts` - 24 tests
- `apps/web/src/hooks/__tests__/useTags.test.ts` - 18 tests

### Mock Infrastructure

- `__mocks__/pdfkit.ts` - Mock PDFKit implementation for unit testing
- `__tests__/fixtures/` - Sample markdown worksheets for consistent test data

### Configuration

- `jest.config.js` - Jest test runner configuration (root)
- `apps/web/jest.config.cjs` - Jest configuration for React tests
- `tsconfig.json` - TypeScript compiler configuration with esModuleInterop

### Test Coverage

**85 tests total** covering all critical functions with specific regression tests for:
- Multi-term expression bug (e.g., "2a + 3b + 4a" rendering all terms)
- Mixed number parsing (e.g., "1 5/6" captured completely)
- Column ordering (left 1-15, then right 16-30)
- React hook loading states, error handling, cleanup on unmount

## React Frontend & API Backend

### Running the Web App

**Start Development Servers:**
```bash
# Start React frontend (http://localhost:5173)
npm run dev

# Start API backend (http://localhost:3001)
npm run api:dev

# Or start both in separate terminals
```

**Build for Production:**
```bash
# Build React app
npm run build

# Build API
npm run api:build
npm run api:start
```

### API Endpoints

The Express API serves problems from the PostgreSQL database:

**GET /api/categories**
- Returns all problem types with counts and display names
- Example response:
```json
[
  {"type": "FRACTION_ADDITION", "count": 210, "displayName": "Fraction Addition"},
  {"type": "ALGEBRA_COLLECTING_TERMS", "count": 150, "displayName": "Collecting Like Terms"}
]
```

**GET /api/problems**
- Query problems with filters
- Query parameters:
  - `type`: ProblemType (e.g., `FRACTION_ADDITION`)
  - `difficulty`: Comma-separated Difficulty values (e.g., `EASY,MEDIUM`)
  - `tags`: Comma-separated tags (e.g., `unlike-denominators`)
  - `limit`: Number of problems (default: 30)
  - `seed`: String for reproducible shuffling
- Example:
```bash
curl "http://localhost:3001/api/problems?type=FRACTION_ADDITION&difficulty=EASY,MEDIUM&tags=unlike-denominators&limit=10"
```

**GET /api/tags/:type**
- Returns available tags for a problem type
- Example: `/api/tags/FRACTION_ADDITION` → `["unlike-denominators", "set-1", ...]`

**GET /health**
- Health check endpoint

### Frontend Components

**Core UI Components:**
- `Fraction` - Renders fractions with proper stacked notation (numerator/denominator)
- `MixedNumber` - Renders mixed numbers (whole number + fraction)
- `MainCategory` - Category button with expand/collapse
- `ErrorBoundary` - Graceful error handling with user-friendly UI

**Utility Functions:**
- `parseFraction(str)` - Parses "a/b" into numerator/denominator
- `parseMixedNumber(str)` - Parses "w a/b" into whole, numerator, denominator
- `renderMathExpression(expr)` - Tokenizes and renders math expressions with fractions
- `classNames(...)` - Utility for conditional CSS classes

**API Client (`apps/web/src/api/`):**
- `client.ts` - Main API client with fetch wrappers
  - `getCategories()` - Fetch problem types with counts
  - `getProblems(filters)` - Query problems with type/difficulty/tags/limit/seed filters
  - `getTags(type)` - Get available tags for a problem type
  - `healthCheck()` - API health check
- `types.ts` - TypeScript definitions matching backend
- `index.ts` - Central exports for clean imports
- `README.md` - Usage documentation and examples

**React Hooks (`apps/web/src/hooks/`):**
- `useCategories()` - Fetches problem categories with loading/error states
  - Returns: `{ data, loading, error, refetch }`
  - Auto-fetches on mount, cleanup with `isMounted` flag
- `useProblems(filters)` - Fetches problems with optional filters
  - Accepts: `{ type, difficulty, tags, limit, seed }`
  - Re-fetches when filter dependencies change
  - Returns same structure as useCategories
- `useTags(type)` - Fetches available tags for a problem type
  - Re-fetches when type parameter changes
- `index.ts` - Central exports for clean imports
- `README.md` - Usage examples and documentation

**Key Features:**
- PDF download with @react-pdf/renderer (2-page worksheets: problems + answer key)
- Gradient background (blue-600 to blue-400)
- Sidebar navigation (categories → subcategories → worksheets)
- Proper fraction alignment and rendering
- STIX Two Math font for mathematical notation
- Type-safe API client with error handling
- HeroSection component for enhanced empty state UX

### API Service Layer

**Location:** `packages/api/src/services/problems.service.ts`

**Functions:**
- `getCategories()` - Fetches problem type counts from database
- `getProblems(filters)` - Queries problems with optional filtering
- `getTagsForType(type)` - Returns unique tags for a problem type
- `seedShuffle(array, seed)` - Deterministic shuffling using Fisher-Yates

**Features:**
- Prisma ORM for type-safe database queries
- Seed-based reproducible problem selection
- Tag filtering with `hasSome` array operator
- Difficulty filtering with `in` operator

### Prisma Configuration Notes

**Custom Client Location:**
- Generator output: `../generated/prisma` (not default `node_modules/@prisma/client`)
- All imports must use: `import { ... } from '../../../../generated/prisma'`
- Prisma client singleton: `src/db/prisma.ts`

**Database Connection:**
- Currently Prisma 6.19.0 (requires `url` in schema.prisma)
- Future Prisma 7: URL moves to `prisma.config.ts` only
- Connection configured via `.env` file: `DATABASE_URL`

## Database Setup

**PostgreSQL 16 via Homebrew:**
```bash
brew services start postgresql@16
```

**Connection Details:**
- Database: `maths_tutor_dev`
- Host: localhost:5432
- Schema: Managed by Prisma (`npx prisma migrate dev`)

**Environment Variables:**
```bash
# API
DATABASE_URL=postgresql://user:password@localhost:5432/maths_tutor_dev
API_PORT=3001
FRONTEND_URL=http://localhost:5173
NODE_ENV=development

# Frontend
VITE_API_URL=http://localhost:3001
```

## Tech Stack

| Layer | Technology | Version |
|-------|------------|---------|
| Frontend | React | 18 |
| Build Tool | Vite | 5+ |
| Styling | Tailwind CSS | 3.4 |
| Icons | Lucide React | - |
| Backend | Express.js | 4.18 |
| Database | PostgreSQL | 16 |
| ORM | Prisma | 6.19 |
| Language | TypeScript | 5.3+ |
| Testing | Jest + ts-jest | 30.2.0 |
| React Testing | @testing-library/react | 16.3.1 |

### CORS Configuration

API configured for local development:
- Origin: `http://localhost:5173` (Vite dev server)
- Credentials: enabled
- Can be configured via `FRONTEND_URL` environment variable

### Deployment Considerations

**Production Setup:**
1. Build frontend: `npm run build` → `apps/web/dist/`
2. Build API: `npm run api:build` → `packages/api/dist/`
3. Serve static files from `apps/web/dist/`
4. Run API: `npm run api:start`

## Current Status (Phase 8 ✅ Complete)

**✅ Completed:**
- Phase 1: Project setup (Vite + React + TypeScript + Tailwind)
- Phase 2: Core UI components (Fraction, MixedNumber, MathExpression)
- Phase 3: Layout & navigation (Sidebar, Categories, Worksheets)
- Phase 4: API backend (Express + Prisma + 3 endpoints)
- Phase 5: Frontend-API integration
  - Task 1: API Client module (TypeScript client with type-safe fetch wrappers)
  - Task 2: Custom React hooks (useCategories, useProblems, useTags)
  - Task 3: Replace static WORKSHEETS data with API calls (App.tsx refactoring)
  - Task 4: Loading & error states with Lucide icons
- Phase 6: Print functionality (deprecated - replaced by Phase 8)
  - Task 1: Enhanced print CSS with A4 layout and page breaks
  - Task 2: Answer key implementation (2-page printing)
  - Task 3: Worksheet header with student metadata
  - Task 4: Optimized spacing and layout
- Phase 7: Advanced filters ✅
  - Task 1: ✅ Difficulty filters (EASY/MEDIUM/HARD checkboxes)
  - Task 2: ✅ Tag filters (dynamic checkboxes based on selected type)
  - Task 3: ✅ Apply Filters button (staged vs applied filter pattern for performance)
  - Task 4: ⏸️  Seed input (deferred to future version)
  - Task 5: ⏸️  Custom problem count slider (deferred to future version)
- Phase 8: PDF Generation with @react-pdf/renderer ✅
  - Task 1: ✅ Install @react-pdf/renderer library
  - Task 2: ✅ Create PrintableWorksheet component (2-page layout)
  - Task 3: ✅ Create usePDFGenerator hook with download functionality
  - Task 4: ✅ Replace browser print with PDF download button
  - Task 5: ✅ Update UI styling (blue gradient, HeroSection)

**📊 Current Capabilities:**
- ✅ Browse all 1104 problems from PostgreSQL database
- ✅ Dynamic category/subcategory navigation built from API data
- ✅ **Filter by difficulty** - Select EASY/MEDIUM/HARD combinations
- ✅ **Filter by tags** - Filter problems by specific tags (e.g., "unlike-denominators", "has-powers")
- ✅ **Staged filter pattern** - Experiment with filters before applying (prevents expensive re-renders)
- ✅ **Apply/Clear Filters buttons** - Explicit control over when API calls are made
- ✅ Type-safe data flow: PostgreSQL → Prisma → Express → React
- ✅ Loading states during API fetches
- ✅ Error handling with user-friendly messages
- ✅ Proper fraction rendering with math notation
- ✅ React hooks pattern with cleanup and refetch support
- ✅ **PDF Download** - @react-pdf/renderer generates professional 2-page PDFs
- ✅ **Page 1**: Problems with metadata header (name, date, problem count)
- ✅ **Page 2**: Complete answer key (question = answer format)
- ✅ Toggle answer display on screen (Show/Hide Answer Key button)
- ✅ Auto-generated filenames (e.g., `fractions-addition-worksheet.pdf`)
- ✅ Default 20 problems per worksheet
- ✅ **Comprehensive test suite** - 85 Jest tests (32 PDF + 53 hooks)

**⏳ Next:**
- Phase 9: Polish & testing (mobile responsive, keyboard navigation, component tests, E2E tests)
- Phase 10: VCAA Problem Database Expansion (generate missing Level 7 topics)

**🐛 Known Issues:**
- ~~**Problem rendering issue**~~: FIXED - Implemented staged vs applied filter pattern
  - **Problem**: Every difficulty/tag checkbox click triggered immediate API call → expensive re-renders
  - **Solution**: Separated "staged" filters (user selections) from "applied" filters (sent to API)
  - **Implementation**: Added "Apply Filters" button - API only called when user clicks Apply
  - **Benefits**: Faster UI, users can experiment with filter combinations before committing
  - **Status**: ✅ Resolved in Phase 7

## Nice-to-Have Features (Future Versions)

**Deferred from Phase 7:**

1. **Worksheet Seed Input** (Reproducible Generation)
   - **Purpose**: Enter a seed string (e.g., "class-2025-01") to generate identical worksheets across sessions
   - **Use case**: Recreate lost worksheets, share exact problem sets with colleagues, consistent makeup work
   - **Backend support**: Already implemented via `seedShuffle()` function
   - **CLI support**: Available via `npm run generate -- --seed "class-2025-01"`
   - **Status**: UI implementation deferred, feature fully functional via CLI
   - **Complexity**: Low (1-2 hours implementation)

2. **Custom Problem Count**
   - **Purpose**: Slider/input to adjust number of problems per worksheet (e.g., 10, 15, 20, 30)
   - **Current**: Fixed at 20 problems per worksheet
   - **Backend support**: Already implemented via `limit` parameter
   - **Status**: Deferred to future version
   - **Complexity**: Low (1-2 hours implementation)

3. **Accessibility Improvements**
   - Add ARIA labels and roles
   - Improve keyboard navigation
   - Add screen reader support
   - Label associations for all form inputs
   - Status: Tracked for Phase 8

4. **Enhanced Error Handling**
   - Seed-specific error messages
   - Filter validation feedback
   - Network error recovery
   - Status: Nice-to-have for Phase 8

5. **Performance Optimization - Caching & Data Fetching** (Hybrid Approach)
   - **Problem**: Currently fetches categories and problems from API on every page load
   - **Solution**: React Query + HTTP Cache-Control headers + Service Worker (optional)
   - **Implementation**:
     - **React Query** (@tanstack/react-query) for client-side cache management
       - Categories cached for 10 minutes (rarely change)
       - Problems cached by filter combination for 2 minutes
       - Tags cached for 10 minutes
       - Automatic background refetching to keep data fresh
       - Request deduplication across components
       - Built-in loading/error states
     - **HTTP Cache-Control headers** on API responses
       - `Cache-Control: public, max-age=300, stale-while-revalidate=600`
       - Browser-level caching layer
       - CDN-friendly for future deployment
     - **Service Worker** (optional) for offline support
       - Cache-first strategy for categories
       - Network-first with cache fallback for problems
   - **Benefits**:
     - 60-70% reduction in API calls for repeat visits
     - Instant renders from cache (sub-100ms)
     - Background updates keep data fresh
     - Works offline (with SW)
     - Better UX with optimistic updates
     - DevTools for cache debugging
   - **Effort**: ~2-3 hours for React Query + headers, +2 hours for Service Worker
   - **Status**: Deferred to future version
   - **Priority**: Medium (nice performance boost, but current performance acceptable)

**Priority Order for Future Implementation:**
1. ~~Fix problem rendering issue~~ ✅ COMPLETED (Phase 7)
2. ~~Add test coverage for tag filtering~~ ✅ COMPLETED (2025-12-22 - 53 Jest tests)
3. Custom problem count slider (quick win)
4. Worksheet seed input (quick win)
5. Performance optimization with React Query (medium - 2-3 hours)
6. Accessibility improvements (Phase 8+)
7. Component tests (Fraction, MixedNumber, ErrorBoundary) - Phase 8
8. Integration tests for App.tsx - Phase 8

**Testing Reminders for Phase 8:**
- ✅ Hook tests complete (useCategories, useProblems, useTags) - 53 tests passing
- Add component tests for UI components (Fraction, MixedNumber, ErrorBoundary)
- Add integration tests for App.tsx with real user interactions
- Add E2E tests with Playwright for critical user flows
- Test mobile responsive behavior
- Test keyboard navigation and accessibility
- **Question for review**: Decide whether to keep markdown worksheets in `worksheets/` folder or archive them (all 1104 problems now in PostgreSQL)

## Available Worksheets

**Complete worksheet listing:** See `ideas/worksheets.md` for all 29 worksheets (18 fraction + 11 algebra).

## Future Worksheet Roadmap

Based on VCAA curriculum analysis, here are the planned worksheets to complete the Level 7 and Level 8 algebra coverage:

### VCAA Level 7 - Remaining Topics

**Currently Completed:**
- ✅ Collecting like terms (5 sets)
- ✅ Multiplication of algebraic terms (4 sets)
- ✅ Fraction addition with like denominators (3 sets)
- ✅ Fraction addition with unlike denominators (4 sets, including Set 7)
- ✅ Fraction subtraction (7 sets)
- ✅ Fraction reduction (6 sets)

**VCAA Level 7 - Fraction Topics Not Yet Covered:**
- ❌ Multiplication of fractions
- ❌ Division of fractions
- ❌ Fraction ↔ decimal ↔ percentage conversion
- ❌ Negative fractions on number line
- ❌ Expressing one quantity as a fraction of another

**To Be Created (Algebra):**

1. **Substitution into Formulas and Expressions**
   - Substituting values into algebraic expressions (e.g., if x = 5, find 3x + 7)
   - Working with common formulas (e.g., P = 2l + 2w, A = πr²)
   - Evaluating expressions with multiple variables (e.g., 3x + 2y when x = 5, y = 7)

2. **Creating Algebraic Expressions from Word Problems**
   - Translating word descriptions to algebra (e.g., "Five more than three times a number" → 3n + 5)
   - Real-world scenarios (e.g., "Cost of x books at $12 each" → 12x)
   - Age problems and comparisons (e.g., "Sarah is 5 years older than twice Tom's age" → 2t + 5)

3. **Simple Linear Equations**
   - One-step equations (e.g., x + 7 = 12, 3x = 15)
   - Two-step equations (e.g., 2x + 5 = 13)
   - Equations with brackets (e.g., 4(x + 2) = 20)
   - Verifying solutions by substitution

4. **Applying Arithmetic Laws to Algebra**
   - Distributive law (e.g., 3(x + 4) = 3x + 12)
   - Commutative law (e.g., 2 × 5 × a = 10a)
   - Associative law demonstrations
   - Mental computation strategies using laws

5. **Coordinates and Cartesian Plane**
   - Plotting points on coordinate plane
   - Reading coordinates from graphs
   - Generating tables of values from patterns
   - Describing relationships between coordinates

### VCAA Level 8 - Advanced Topics

**Key Difference:** Level 8 introduces significantly more complex algebraic concepts, especially expansion and factorisation.

**Planned Worksheets:**

1. **Expanding Algebraic Expressions (Distributive Law)**
   - Simple expansion (e.g., 3(2x + 5) = 6x + 15)
   - Negative coefficients (e.g., -2(3a - 4) = -6a + 8)
   - Variable multiplication (e.g., x(x + 5) = x² + 5x)
   - **Binomial expansion** (e.g., (x + 3)(x + 2) = x² + 5x + 6) ← Major new concept

2. **Factorising Algebraic Expressions**
   - Finding common numerical factors (e.g., 6x + 9 = 3(2x + 3))
   - Factorising with variables (e.g., 4x² + 8x = 4x(x + 2))
   - Reverse of expansion (e.g., x² + 5x = x(x + 5))
   - Recognizing factorable expressions

3. **Simplifying Complex Algebraic Expressions**
   - All four operations combined (e.g., 3x + 2x - x + 5 - 2)
   - Expanding then simplifying (e.g., 4(2x + 3) - 2(x - 1))
   - Division of expressions (e.g., (6x + 9) ÷ 3)
   - Mixed operations (e.g., 2x × 3y + 4xy)

4. **Solving Complex Linear Equations**
   - Variables on both sides (e.g., 2x + 5 = 3x - 2)
   - Equations with brackets (e.g., 3(x + 2) = 15)
   - Fractional coefficients (e.g., x/3 + 5 = 11)
   - Multi-step equations (e.g., 2(x - 3) = 4(x + 1))

5. **Linear Graphs and Relationships**
   - Plotting linear equations (e.g., y = 2x + 3)
   - Finding gradients and intercepts
   - Writing equations from graphs
   - Interpreting real-world linear relationships
   - Tables of values to graphs

### Implementation Priority

**High Priority (Complete Level 7):**
1. Substitution into formulas
2. Simple linear equations
3. Word problems to algebra

**Medium Priority (Bridge to Level 8):**
1. Applying arithmetic laws
2. Coordinates and graphing basics

**Future (Level 8 Content):**
1. Expanding brackets
2. Factorising expressions
3. Complex equations
4. Linear graphing

### Curriculum References

- **VCAA Level 7 (Version 1.0)**: VCMNA251-257
- **VCAA Level 7 (Version 2.0)**: VC2M7A01-A06
- **VCAA Level 8 (Version 1.0)**: VCMNA279-285
- Full implementation of Version 2.0 required from 2025

**Sources:**
- [Level 7 - Victorian Curriculum](https://victoriancurriculum.vcaa.vic.edu.au/level7?layout=1&d=M)
- [Level 8 - Victorian Curriculum](https://victoriancurriculum.vcaa.vic.edu.au/level8?layout=1&d=M)
- [Mathematics Version 2.0](https://victoriancurriculum.vcaa.vic.edu.au/mathematics/mathematics-version-2-0/curriculum/f-10)
