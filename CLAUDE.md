# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

**Quick Start:**
- Run tests: `npm test` (32 tests, all passing)
- Web app: `npm run dev` (React frontend) + `npm run api:dev` (API backend)
- Generate from DB: `npm run generate -- --type FRACTION_ADDITION --output worksheet.pdf`
- Generate from markdown: `npx tsx generate-worksheet-pdf.ts <worksheet.md>`
- **CRITICAL**: Always run `npm test` before modifying `generate-worksheet-pdf.ts`

## Project Overview

This is a maths tutoring project for generating printable PDF worksheets with fraction and algebra problems and their solutions. The project provides both a **web-based interface** and **CLI tools** for creating worksheets.

**Key Features:**
- **Web UI (v2)**: React + Tailwind frontend with Express API backend for browsing and printing worksheets
- **870 problems** in PostgreSQL database (5 types: fraction add/sub/reduce, algebra collecting/multiplication)
- **On-demand generation** from database with custom difficulty mix and tag filtering
- 29 markdown worksheets as backup/archive
- Comprehensive Jest test suite with 32 tests covering all critical functions
- Support for fractions, mixed numbers, and algebraic expressions

**Interfaces:**
- **Web App**: Browser-based UI for browsing categories, viewing worksheets, and printing (`npm run dev`)
- **CLI**: Command-line tool for batch generation (`npm run generate`)
- **Legacy PDF**: Direct markdown-to-PDF conversion (`npx tsx generate-worksheet-pdf.ts`)

## Generating Worksheets from Database (Recommended)

The primary way to generate worksheets is from the PostgreSQL database:

```bash
# Generate a worksheet
npm run generate -- --type FRACTION_ADDITION --output my-worksheet.pdf

# With custom difficulty mix (must total to 30)
npm run generate -- --type FRACTION_ADDITION -d "easy:10,medium:15,hard:5"

# With tag filtering
npm run generate -- --type FRACTION_ADDITION --tags unlike-denominators

# Reproducible generation with seed
npm run generate -- --type FRACTION_ADDITION --seed "class-2025-01"

# Custom title
npm run generate -- --type ALGEBRA_COLLECTING_TERMS --title "Year 7 Algebra Quiz"

# List available problems
npm run generate:list

# List tags for a type
npm run generate:tags -- --type FRACTION_ADDITION
```

**Problem Types:**
- `FRACTION_ADDITION` (210 problems)
- `FRACTION_SUBTRACTION` (210 problems)
- `FRACTION_REDUCTION` (180 problems)
- `ALGEBRA_COLLECTING_TERMS` (150 problems)
- `ALGEBRA_MULTIPLICATION` (120 problems)

**Database Setup:**
- PostgreSQL 16 via Homebrew: `brew services start postgresql@16`
- Database: `maths_tutor_dev` on localhost:5432
- Schema managed by Prisma: `npx prisma migrate dev`

## Running the PDF Generator (Legacy - from Markdown)
```bash
npx tsx generate-worksheet-pdf.ts [worksheet-file] [output-pdf]
```

Worksheets are stored in the `worksheets/` folder. Examples:
```bash
# Use default (worksheets/fraction-addition-01.md → worksheets/fraction-addition-01.pdf)
npx tsx generate-worksheet-pdf.ts

# Generate specific worksheet
npx tsx generate-worksheet-pdf.ts worksheets/algebra-collecting-terms-01.md

# Specify custom output path
npx tsx generate-worksheet-pdf.ts worksheets/fraction-reduction-02.md custom-output.pdf
```

This generates a PDF with:
- Title page with all problems in two-column layout
- Answer key page with problems and solutions
- Optional tips page (if present in markdown)

## Testing

**IMPORTANT: Always run tests before making changes to the PDF generator!**

The project uses Jest for testing the PDF generation logic. Tests cover:
- Markdown parsing (fraction and algebra worksheets)
- Expression rendering (critical for detecting multi-term expression bugs)
- Number rendering (fractions, mixed numbers, algebraic expressions)

### Running Tests

```bash
# Run all tests
npm test

# Run tests in watch mode (auto-rerun on file changes)
npm run test:watch

# Run tests with coverage report
npm run test:coverage
```

### Test Files
- `__tests__/parseMarkdownWorksheet.test.ts` - Tests markdown parsing logic
- `__tests__/drawExpression.test.ts` - Tests expression rendering (includes regression test for multi-term bug)
- `__tests__/drawNumber.test.ts` - Tests number/fraction/algebra rendering
- `__tests__/fixtures/` - Sample markdown files for testing

### Important Test Cases

The test suite includes critical regression tests:
- **Multi-term algebraic expressions** (e.g., "2a + 3b + 4a") - ensures all terms are rendered
- **Mixed number parsing** (e.g., "1 5/6") - ensures answer key captures full values
- **Column ordering** - ensures problems are extracted left-to-right in correct order

**When modifying `generate-worksheet-pdf.ts`, always run `npm test` first to ensure no regressions!**

## Architecture

### Markdown-to-PDF Worksheet Generator (`generate-worksheet-pdf.ts`)

A reusable script that converts markdown worksheets into properly formatted PDFs with fraction notation and algebraic expressions.

**Configuration & Types:**
- `CONFIG` - PDF layout constants (margins, column positions, font sizes, spacing)
- `REGEX` - Pre-compiled regular expressions for efficient pattern matching
- `NonEmptyString` - Branded type ensuring non-empty strings
- `PositiveNumber` - Branded type ensuring positive numbers
- `Coordinate` - Branded type for coordinate values

**Key Functions:**
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

**Markdown Format Expected:**
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

**Important Notes:**
- Answer key MUST be one answer per line (not multiple per line)
- Parser uses `(.+)` regex to capture full answers including mixed numbers like "1 5/6"
- Left column problems (1-15) are collected first, then right column (16-30)
- This ensures PDF displays problems in correct sequential order

**Layout:**
- Two-column layout with 15 problems per column (30 total)
- Page 1: Problems with blank answer spaces
- Page 2: Complete answer key
- Page 3: Tips (optional)

### Test Suite Architecture

The project uses Jest with TypeScript for comprehensive test coverage:

**Test Files:**
- `__tests__/parseMarkdownWorksheet.test.ts` - 12 tests for markdown parsing
- `__tests__/drawExpression.test.ts` - 11 tests for expression rendering (includes critical multi-term regression test)
- `__tests__/drawNumber.test.ts` - 9 tests for number/fraction/algebra rendering

**Mock Infrastructure:**
- `__mocks__/pdfkit.ts` - Mock PDFKit implementation for unit testing
- `__tests__/fixtures/` - Sample markdown worksheets for consistent test data

**Configuration:**
- `jest.config.js` - Jest test runner configuration
- `tsconfig.json` - TypeScript compiler configuration with esModuleInterop

**Test Coverage:** 32 tests covering all critical functions with specific regression tests for:
- Multi-term expression bug (e.g., "2a + 3b + 4a" rendering all terms)
- Mixed number parsing (e.g., "1 5/6" captured completely)
- Column ordering (left 1-15, then right 16-30)

## React Frontend & API Backend (v2)

The project includes a web-based interface for browsing and printing worksheets directly from the browser.

### Architecture Overview

**Monorepo Structure:**
```
maths-tutor/
├── apps/
│   └── web/                    # React frontend (Vite + TypeScript + Tailwind)
│       ├── src/
│       │   ├── components/     # Reusable React components
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
- Browser-based printing with print-specific CSS
- Gradient background (teal-50 to blue-100)
- Sidebar navigation (categories → subcategories → worksheets)
- Proper fraction alignment and rendering
- STIX Two Math font for mathematical notation
- Type-safe API client with error handling

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

### Tech Stack

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

### CORS Configuration

API configured for local development:
- Origin: `http://localhost:5173` (Vite dev server)
- Credentials: enabled
- Can be configured via `FRONTEND_URL` environment variable

### Deployment Considerations

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

**Production Setup:**
1. Build frontend: `npm run build` → `apps/web/dist/`
2. Build API: `npm run api:build` → `packages/api/dist/`
3. Serve static files from `apps/web/dist/`
4. Run API: `npm run api:start`

### Current Status (Phase 7 ✅ Complete)

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
- Phase 6: Print functionality
  - Task 1: Enhanced print CSS with A4 layout and page breaks
  - Task 2: Answer key implementation (2-page printing)
  - Task 3: Worksheet header with student metadata
  - Task 4: Optimized spacing and layout
- Phase 7: Advanced filters ✅
  - Task 1: ✅ Difficulty filters (EASY/MEDIUM/HARD checkboxes)
  - Task 2: ✅ Tag filters (dynamic checkboxes based on selected type)
  - Task 3: ✅ Apply Filters button (staged vs applied filter pattern for performance)
  - Task 4: ⏸️  Seed input (deferred to future version - see Nice-to-Have Features below)
  - Task 5: ⏸️  Custom problem count slider (deferred to future version)

**📊 Current Capabilities:**
- ✅ Browse all 870 problems from PostgreSQL database
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
- ✅ Professional print output with 2-page layout (questions + answers)
- ✅ Toggle answer display on screen (Show/Hide Answer Key button)
- ✅ Optimized print CSS for A4 worksheets
- ✅ Default 20 problems per worksheet

**⏳ Next:**
- Phase 8: Polish & testing (mobile responsive, keyboard navigation, automated tests)
- Phase 9: VCAA Problem Database Expansion (generate missing Level 7 topics)

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

**Priority Order for Future Implementation:**
1. Fix problem rendering issue (Phase 8)
2. Add test coverage for tag filtering (Phase 8)
3. Custom problem count slider (quick win)
4. Worksheet seed input (quick win)
5. Accessibility improvements (Phase 8+)

**Testing Reminders for Phase 8:**
- Add Jest/Playwright tests to verify tag retrieval for all problem types
- Test that tags are correctly filtered and applied to problem queries
- Verify all problem types return expected tag arrays
- Test tag filter combinations with difficulty filters
- **Question for review**: Decide whether to keep markdown worksheets in `worksheets/` folder or archive them (all 870 problems now in PostgreSQL)

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

## Recent Session Changes (2025-12-21)

**Session Summary**: Code review and quality improvements - Fixed critical TypeScript issues, improved accessibility, and added error boundary protection. All components now follow React/TypeScript best practices with enterprise-level standards.

### Code Quality Improvements ✅

**Critical Fixes:**
1. **Type Safety** - Added explicit return types to all functions (App.tsx, hooks, utilities)
2. **Performance** - Fixed unstable dependency array in `useProblems` hook using `useMemo` with JSON serialization

**Important Fixes:**
1. **Component Types** - Extracted prop types for Fraction, MixedNumber, MainCategory; added FC annotations
2. **Constants** - Created `/config/constants.ts` for UI_CONFIG and DIFFICULTY_LEVELS
3. **Cleanup** - Removed obsolete Worksheet type from Phase 5 refactoring

**Minor Fixes:**
1. **Keys** - Consistent, descriptive key patterns (`mixed-${idx}`, `fraction-${idx}`, `token-${idx}`)
2. **Accessibility** - Added `id`, `htmlFor`, and `aria-label` to all checkboxes (WCAG compliant)
3. **Error Handling** - Created ErrorBoundary component with graceful error UI, wrapped App in main.tsx

**Files Modified:**
- `apps/web/src/App.tsx` - Return types, constants import, accessibility labels
- `apps/web/src/hooks/useProblems.ts` - Stable filter key with useMemo
- `apps/web/src/hooks/useTags.ts` - Return type, type guard
- `apps/web/src/components/Fraction.tsx` - FC type, prop types
- `apps/web/src/components/MixedNumber.tsx` - FC type, prop types
- `apps/web/src/components/MainCategory.tsx` - FC type, prop types, removed obsolete props
- `apps/web/src/components/ErrorBoundary.tsx` - New component
- `apps/web/src/utils/utils.ts` - Return types, FractionParts, MixedNumberParts types
- `apps/web/src/config/constants.ts` - New config file
- `apps/web/src/main.tsx` - ErrorBoundary wrapper
- Deleted: `apps/web/src/types/index.ts` (obsolete)

**Verification:**
- ✅ TypeScript compilation: No errors
- ✅ Production build: Success (997ms)
- ✅ Dev servers: Running correctly (frontend localhost:5174, API localhost:3001)
- ✅ All API endpoints tested and working

---

## Recent Session Changes (2025-12-19)

**Session Summary**: Completed Phase 6 - Print Functionality with comprehensive print CSS and answer key implementation. Added 2-page printing (questions on page 1, answers on page 2) with optimized spacing and layout for professional worksheet output.

### Phase 6: Print Functionality ✅

**Goals**: Enable browser printing with proper formatting and answer key support

**Implementation:**

1. **Enhanced Print CSS** (`apps/web/src/App.tsx` - style block)
   - A4 page setup with 1cm margins
   - 2-column grid layout for problems (11pt font)
   - Compact spacing: 1em gap between problems
   - Custom problem numbering with CSS counters
   - Page break prevention for problems (`page-break-inside: avoid`)
   - Hidden UI elements (header, sidebar, buttons)

2. **Answer Key Implementation**
   - Toggle button: "Show Answer Key" / "Hide Answer Key"
   - **On-screen behavior**: Shows answers inline after "=" when toggled
   - **Print behavior**: Answers hidden inline, separate answer key on page 2
   - Answer key styling: 2-column grid, 9pt font, compact spacing
   - Automatic page break before answer key (`page-break-before: always`)

3. **Worksheet Header (Print Only)**
   - Category and subcategory title (18pt, centered)
   - Student metadata: Name field, Date field, Problem count
   - Border separator line below metadata

4. **Print Layout Optimizations**
   - Removed inline answer blanks (dashed lines)
   - Title font: 18pt for worksheet header
   - Problem font: 11pt for questions
   - Answer key font: 9pt for compact fit
   - Top padding: 0.5cm on page 2 for answer key
   - Vertical spacing: 0.3em row gap, 0.2em item margin

**CSS Features:**
```css
@media print {
  @page { size: A4; margin: 1cm; }

  /* Questions page */
  ol { grid-template-columns: repeat(2, 1fr); gap: 1em; font-size: 11pt; }
  ol li { margin-bottom: 1em; }
  ol li::before { content: counter(problem-counter) ". "; }

  /* Answer key page */
  .print-answer-key {
    page-break-before: always;
    padding-top: 0.5cm;
  }
  .print-answer-key ol {
    grid-template-columns: repeat(2, 1fr);
    gap: 0.3em 2em;
    font-size: 9pt;
  }

  /* Hide on-screen elements */
  header, aside, button, .inline-answer { display: none !important; }
}
```

**Screen vs Print Behavior:**

| Feature | Screen | Print |
|---------|--------|-------|
| Header & Sidebar | Visible | Hidden |
| Worksheet Title | Hidden on desktop | Visible (18pt, centered) |
| Student Metadata | Hidden | Visible (Name, Date, Count) |
| Inline Answers | Toggle on/off | Always hidden |
| Answer Key Section | Hidden | Visible on page 2 |
| Answer Blanks | Dashed lines | Removed |
| Problem Numbering | CSS counters | CSS counters |

**Files Modified:**
- `apps/web/src/App.tsx` - Added answer key state, print CSS, answer key section

**User Adjustments:**
- Title font: Changed to 18pt for prominence
- Problem gap: Set to 1em for comfortable spacing
- Page margins: 1cm all around for maximum space
- Answer key padding: 0.5cm top to fit all answers
- Answer font: 9pt for compact answer key

### Phase 6 Status: ✅ COMPLETE

**Completed Tasks:**
- ✅ Enhanced print-specific CSS with page breaks
- ✅ Added worksheet header with student metadata
- ✅ Implemented answer key with 2-page printing
- ✅ Optimized spacing to prevent answer cutoff
- ✅ Tested fraction and algebra problem printing

**Output Quality:**
- Professional worksheet appearance
- All 30 problems fit on page 1
- All 30 answers fit on page 2
- Proper fraction rendering in both questions and answers
- Clean, readable layout suitable for students

**Next Phase:**
- Phase 7: Advanced features (difficulty filters, tag filters, seed input, answer key improvements)
- Phase 8: Polish & testing (mobile responsive, keyboard navigation, automated tests)

---

## Recent Session Changes (2025-12-18)

**Session Summary**: Completed Phase 5 frontend-API integration - created custom React hooks (useCategories, useProblems, useTags) and refactored App.tsx to replace static data with live database integration. All 870 problems from PostgreSQL now accessible through the web UI.

### React Hooks Implementation (Phase 5 - Task 2)

**Files Created:**

1. **`apps/web/src/hooks/useCategories.ts`** - Hook to fetch problem categories
   - Returns: `{ data: CategoryInfo[] | null, loading: boolean, error: string | null, refetch: () => void }`
   - Auto-fetches on mount
   - Cleanup with `isMounted` flag to prevent memory leaks
   - Refetch support via trigger state

2. **`apps/web/src/hooks/useProblems.ts`** - Hook to fetch problems with filters
   - Accepts: `ProblemFilters` (type, difficulty, tags, limit, seed)
   - Re-fetches automatically when filter dependencies change
   - Same return structure as useCategories
   - Dependency array: `[filters.type, filters.difficulty, filters.tags, filters.limit, filters.seed, refetchTrigger]`

3. **`apps/web/src/hooks/useTags.ts`** - Hook to fetch tags for a problem type
   - Accepts: `ProblemType` parameter
   - Re-fetches when type changes
   - Returns array of tag strings

4. **`apps/web/src/hooks/index.ts`** - Central exports
   - Exports all three hooks for clean imports: `import { useCategories, useProblems } from '@/hooks'`

5. **`apps/web/src/hooks/README.md`** - Documentation
   - Usage examples for all hooks
   - Feature list (automatic fetching, loading states, error handling, cleanup, refetch support)
   - Implementation details (dependency tracking, cleanup pattern, error handling)

**Hook Features:**
- ✅ Automatic fetching on mount and dependency changes
- ✅ Loading states (boolean flag while fetching)
- ✅ Error handling (catches ApiError and generic Error)
- ✅ Cleanup to prevent state updates on unmounted components
- ✅ Manual refetch support via `refetch()` function
- ✅ Type safety with full TypeScript support

### App.tsx Refactoring (Phase 5 - Task 3)

**Major Changes:**

1. **Removed Static Data** (90 lines deleted)
   - Removed entire `WORKSHEETS` object with hardcoded problems
   - Replaced with dynamic API integration

2. **Added Hook Integration**
   ```typescript
   const { data: apiCategories, loading: categoriesLoading, error: categoriesError } = useCategories();
   const { data: problems, loading: problemsLoading, error: problemsError } = useProblems(
     selectedProblemType ? { type: selectedProblemType, limit: 30 } : {}
   );
   ```

3. **Created Problem Type Mapping**
   ```typescript
   const PROBLEM_TYPE_MAP: Record<ProblemType, { mainCategory: string; subCategory: string }> = {
     FRACTION_ADDITION: { mainCategory: "Fractions", subCategory: "Addition" },
     FRACTION_SUBTRACTION: { mainCategory: "Fractions", subCategory: "Subtraction" },
     FRACTION_REDUCTION: { mainCategory: "Fractions", subCategory: "Reduction" },
     FRACTION_MULTIPLICATION: { mainCategory: "Fractions", subCategory: "Multiplication" },
     FRACTION_DIVISION: { mainCategory: "Fractions", subCategory: "Division" },
     ALGEBRA_COLLECTING_TERMS: { mainCategory: "Algebra", subCategory: "Collecting Terms" },
     ALGEBRA_MULTIPLICATION: { mainCategory: "Algebra", subCategory: "Multiplication" },
   };
   ```

4. **Dynamic Category Structure Building**
   - Replaced `Object.keys(WORKSHEETS)` with building from API data
   - Maps API problem types to user-friendly category/subcategory names
   - Uses Set for subcategory deduplication
   - Tracks problem type mapping for subcategory selection

5. **Added Loading States**
   - Categories loading: Loader2 spinning icon with "Loading categories..." message
   - Problems loading: Loader2 spinning icon with "Loading problems..." message
   - Loading states use Lucide React icons

6. **Added Error States**
   - Categories error: AlertCircle icon with error message in red background
   - Problems error: AlertCircle icon with error message in red background
   - Graceful error display without breaking UI

7. **Updated Problem Rendering**
   - Changed from `selectedWorksheets.problems.map()` to `problems.map()`
   - Now renders all problems from database instead of 10-15 static examples
   - Maintains existing fraction rendering logic (`renderMathExpression()`)

**Navigation Flow:**
1. User clicks main category (e.g., "Fractions") → `onSelectCategory()`
2. Subcategories appear (e.g., "Addition", "Subtraction", "Reduction")
3. User clicks subcategory → `onSelectSubCategory()`
4. Hook looks up `ProblemType` from mapping → Sets `selectedProblemType`
5. `useProblems` hook triggers with new type → Fetches 30 problems from API
6. Problems render in two-column layout with proper fraction notation

### Integration Verification (Phase 5 - Task 4)

**Verified Working:**
- ✅ API server running on http://localhost:3001
- ✅ Frontend server running on http://localhost:5173
- ✅ `/api/categories` endpoint returning 5 problem types with counts
- ✅ `/api/problems?type=X&limit=N` endpoint returning filtered problems
- ✅ `/api/tags/:type` endpoint returning tag arrays
- ✅ Vite proxy forwarding `/api/*` requests correctly
- ✅ React app loading and serving HTML
- ✅ No TypeScript compilation errors
- ✅ No runtime errors in API logs

**Test Results:**
```bash
# Categories API
curl http://localhost:3001/api/categories
# Returns: [{"type":"ALGEBRA_MULTIPLICATION","count":120,...}, ...]

# Problems API with filters
curl "http://localhost:3001/api/problems?type=FRACTION_ADDITION&limit=3"
# Returns: [{"id":"...","question":"1/8 + 3/8","answer":"1/2",...}, ...]

# Tags API
curl http://localhost:3001/api/tags/ALGEBRA_COLLECTING_TERMS
# Returns: ["has-powers","multiple-variables","product-terms","set-1",...]
```

### Phase 5 Status: ✅ COMPLETE

**Completed Tasks:**
- ✅ Task 1: API Client setup (TypeScript types, fetch wrappers, error handling)
- ✅ Task 2: Custom React hooks (useCategories, useProblems, useTags)
- ✅ Task 3: Replace static data with API integration
- ✅ Task 4: Verify end-to-end integration

**What Changed:**
- Frontend now displays all 870 problems from PostgreSQL database
- Categories dynamically built from API data (no hardcoded lists)
- Loading states during API fetches
- Error handling for API failures
- Type-safe data flow from database → API → React
- Clean hooks pattern with proper cleanup and refetch support

**Next Phase:**
- Phase 6: Print functionality with CSS `@media print`
- Phase 7: Advanced features (difficulty filters, tag filters, seed input, answer key toggle)
- Phase 8: Polish & testing (mobile responsive, keyboard navigation, automated tests)

---

**Older session history**: See `docs/SESSION_HISTORY.md` for archived sessions.

## Dependencies

**Production:**
- `pdfkit` - PDF generation with drawing primitives
- `@types/pdfkit` - TypeScript type definitions for PDFKit

**Development:**
- `tsx` - TypeScript execution without compilation step
- `typescript` - TypeScript compiler
- `jest` - Testing framework
- `ts-jest` - TypeScript preprocessor for Jest
- `@types/jest` - TypeScript type definitions for Jest
- `ts-node` - TypeScript execution engine for Node.js
- `@types/node` - TypeScript type definitions for Node.js
