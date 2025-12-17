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

### Current Status (Phase 5 In Progress)

**✅ Completed:**
- Phase 1: Project setup (Vite + React + TypeScript + Tailwind)
- Phase 2: Core UI components (Fraction, MixedNumber, MathExpression)
- Phase 3: Layout & navigation (Sidebar, Categories, Worksheets)
- Phase 4: API backend (Express + Prisma + 3 endpoints)
- Phase 5 Task 1: API Client module (TypeScript client with type-safe fetch wrappers)

**⏳ In Progress:**
- Phase 5 Task 2: Create custom React hooks (useCategories, useProblems, useTags)
- Phase 5 Task 3: Replace static WORKSHEETS data with API calls
- Phase 5 Task 4: Add loading and error states

**⏳ Upcoming:**
- Phase 6: Print functionality (browser printing with CSS)
- Phase 7: Advanced features (filtering, seed support, answer toggle)
- Phase 8: Polish & testing

## Available Worksheets

All worksheets are stored in the `worksheets/` folder.

### Fraction Worksheets

The project includes 15 fraction worksheets (6 sets of 3 types) with 30 problems each:

**Set 1 (Like Denominators):**
- `worksheets/fraction-addition-01.md` / `.pdf` - Addition of fractions (simple and mixed numbers)
- `worksheets/fraction-subtraction-01.md` / `.pdf` - Subtraction of fractions (with borrowing)
- `worksheets/fraction-reduction-01.md` / `.pdf` - Reducing fractions to lowest terms

**Set 2 (Like Denominators):**
- `worksheets/fraction-addition-02.md` / `.pdf` - Additional addition problems
- `worksheets/fraction-subtraction-02.md` / `.pdf` - Additional subtraction problems
- `worksheets/fraction-reduction-02.md` / `.pdf` - Additional reduction problems

**Set 3 (Like Denominators):**
- `worksheets/fraction-addition-03.md` / `.pdf` - Third set of addition problems
- `worksheets/fraction-subtraction-03.md` / `.pdf` - Third set of subtraction problems
- `worksheets/fraction-reduction-03.md` / `.pdf` - Third set of reduction problems

**Set 4 (Unlike Denominators - with tips):**
- `worksheets/fraction-addition-04.md` / `.pdf` - Addition with unlike denominators (requires finding LCD)
- `worksheets/fraction-subtraction-04.md` / `.pdf` - Subtraction problems with same denominators
- `worksheets/fraction-reduction-04.md` / `.pdf` - Reduction problems (additional practice)

**Set 5 (Unlike Denominators - with tips):**
- `worksheets/fraction-addition-05.md` / `.pdf` - Addition with unlike denominators Set 2
- `worksheets/fraction-subtraction-05.md` / `.pdf` - Subtraction with same denominators Set 5
- `worksheets/fraction-reduction-05.md` / `.pdf` - Reduction problems Set 5

**Set 6 (Unlike Denominators - no tips):**
- `worksheets/fraction-addition-06.md` / `.pdf` - Addition with unlike denominators Set 3
- `worksheets/fraction-subtraction-06.md` / `.pdf` - Subtraction with same denominators Set 6
- `worksheets/fraction-reduction-06.md` / `.pdf` - Reduction problems Set 6

Each fraction worksheet follows the same format:
- 30 problems in two-column layout
- Complete answer key (one answer per line)
- Practice tips (Sets 1-5) or no tips (Set 6)
- Professional PDF output with proper fraction notation

### Algebra Worksheets

**VCAA Level 7 Aligned:**
- `worksheets/algebra-collecting-terms-01.md` / `.pdf` - Collecting like terms Set 1
  - Problems 1-10: Simple single-variable addition/subtraction (e.g., 2a + 3a)
  - Problems 11-20: Multiple variables (e.g., 2a + 3b + 4a)
  - Problems 21-24: Products (e.g., 3ab + 5ab)
  - Problems 25-30: Mixed terms with powers (e.g., 3x² + 2x + 4x²)

- `worksheets/algebra-collecting-terms-02.md` / `.pdf` - Collecting like terms Set 2
  - Similar structure to Set 1 with new problems
  - Progressive difficulty from simple to complex terms

- `worksheets/algebra-collecting-terms-03.md` / `.pdf` - Collecting like terms Set 3
  - Similar structure to Sets 1 and 2 with new problems
  - Progressive difficulty and reinforcement of concepts
  - Multi-term expressions with various variable combinations

- `worksheets/algebra-collecting-terms-04.md` / `.pdf` - Collecting like terms Set 4
  - Similar structure to Sets 1-3 with new problems
  - Advanced practice with mixed terms and powers
  - Comprehensive review of all collecting terms concepts

- `worksheets/algebra-collecting-terms-05.md` / `.pdf` - Collecting like terms Set 5
  - Similar structure to Sets 1-4 with new problems
  - Extended practice with varied expressions
  - Continued mastery of combining like terms

- `worksheets/algebra-multiplication-01.md` / `.pdf` - Multiplication of algebraic terms Set 1
  - Problems 1-10: Multiplying different variables (e.g., 3a × 4b = 12ab)
  - Problems 11-15: Multiplying terms with powers (e.g., 3x × 2x² = 6x³)
  - Problems 16-20: Same variable multiplication creating powers (e.g., 5x × x = 5x²)
  - Problems 21-25: Same variable with coefficients (e.g., 2x × 3x = 6x²)
  - Problems 26-30: Expanding powers of expressions (e.g., (2a)² = 4a², (3t)³ = 27t³)

- `worksheets/algebra-multiplication-02.md` / `.pdf` - Multiplication of algebraic terms Set 2
  - Similar structure to Set 1 with new problems
  - Progressive difficulty from simple to complex terms
  - Reinforces understanding of multiplication rules for algebraic expressions

- `worksheets/algebra-multiplication-03.md` / `.pdf` - Multiplication of algebraic terms Set 3
  - Similar structure to Sets 1 and 2 with new problems
  - Practice with all multiplication scenarios
  - Comprehensive review of power rules and algebraic multiplication

- `worksheets/algebra-multiplication-04.md` / `.pdf` - Multiplication of algebraic terms Set 4
  - Similar structure to Sets 1-3 with new problems
  - Extended practice with varied multiplication scenarios
  - Final reinforcement of power rules and algebraic multiplication

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

## Code Review Findings & Technical Debt

**Review Date**: 2025-11-23
**Reviewer**: Senior Frontend Code Mentor Agent
**Overall Assessment**: Production-functional but not production-ready

### Summary

The codebase has excellent test coverage (32 passing tests) and good separation of concerns in drawing functions. However, it lacks error handling, has security vulnerabilities, and contains several code quality issues that should be addressed before production use.

### Critical Issues (Must Fix Before Production)

#### 1. Missing Error Handling (Severity: Critical)
**Location**: All file I/O operations, parsing functions, PDF generation
**Impact**: Application crashes ungracefully on any error

**Current State**:
- No try-catch blocks in `parseMarkdownWorksheet()`
- No validation of file existence before reading
- No handling of malformed markdown
- PDF write errors not caught

**Required Fix**:
```typescript
// Example fix for parseMarkdownWorksheet()
export function parseMarkdownWorksheet(filePath: string): WorksheetData {
  if (!filePath) {
    throw new Error('File path is required');
  }

  if (!fs.existsSync(filePath)) {
    throw new Error(`Markdown file not found: ${filePath}`);
  }

  try {
    const content = fs.readFileSync(filePath, 'utf-8');

    if (!content.trim()) {
      throw new Error('Markdown file is empty');
    }

    // ... parsing logic

    // Validate results
    if (!title) {
      throw new Error('No title found in markdown');
    }

    if (problems.length === 0) {
      throw new Error('No problems found in markdown table');
    }

    return { title, problems, tips };
  } catch (error) {
    throw new Error(`Failed to parse markdown: ${error instanceof Error ? error.message : 'Unknown error'}`);
  }
}
```

**Effort Estimate**: 2 hours

---

#### 2. Path Traversal Vulnerability (Severity: Critical - Security)
**Location**: Lines 307-310 (main execution block)
**Impact**: Users can read arbitrary files on the system

**Current State**:
```typescript
// UNSAFE - user can supply: ../../../etc/passwd
const markdownFile = args[0] || 'fraction-addition-01.md';
const worksheetData = parseMarkdownWorksheet(markdownFile);
```

**Required Fix**:
```typescript
import path from 'path';

function validateFilePath(filePath: string, expectedExtension: string): string {
  const resolved = path.resolve(filePath);
  const cwd = process.cwd();

  // Prevent path traversal outside working directory
  if (!resolved.startsWith(cwd)) {
    throw new Error('Access denied: File must be within project directory');
  }

  // Validate extension
  if (!resolved.endsWith(expectedExtension)) {
    throw new Error(`Invalid file: Expected ${expectedExtension} file`);
  }

  return resolved;
}

// Usage
const markdownFile = validateFilePath(args[0] || 'fraction-addition-01.md', '.md');
const outputFile = validateFilePath(args[1] || markdownFile.replace('.md', '.pdf'), '.pdf');
```

**Effort Estimate**: 1 hour

---

### Important Issues (Should Fix Soon)

#### 3. Inefficient Double-Pass Parsing (Severity: Important - Performance)
**Location**: Lines 29-104 (`parseMarkdownWorksheet()`)
**Impact**: O(2n) complexity when O(n) is achievable

**Current State**: File is read twice - once for problems, once for answers

**Recommended Fix**: Implement single-pass state machine parser

**Effort Estimate**: 2 hours

---

#### 4. Weak Type Safety (Severity: Important)
**Location**: All drawing functions (`drawFraction`, `drawNumber`, `drawExpression`)
**Impact**: Runtime errors from invalid inputs not caught at compile time

**Issues**:
- No validation of numeric inputs (can be negative, zero, NaN)
- No validation that denominators aren't zero
- No validation that coordinates are valid
- Overly permissive string types

**Recommended Fix**: Use TypeScript branded types and validation functions

**Example**:
```typescript
type PositiveNumber = number & { readonly __brand: 'PositiveNumber' };
type Coordinate = number & { readonly __brand: 'Coordinate' };
type NumericString = string & { readonly __brand: 'NumericString' };

function asPositiveNumber(n: number): PositiveNumber {
  if (n <= 0 || !Number.isFinite(n)) {
    throw new Error(`Expected positive number, got ${n}`);
  }
  return n as PositiveNumber;
}
```

**Effort Estimate**: 3 hours

---

#### 5. Magic Numbers Without Documentation (Severity: Important)
**Location**: Throughout drawing functions
**Impact**: Code difficult to maintain and modify

**Examples**:
- `maxWidth + 4` (Line 124) - Why 4?
- `y - fontSize * 0.8` (Line 128) - Why 0.8?
- `y + 2` (Line 131) - Why 2?
- `x + wholeWidth + 3` (Line 168) - Why 3?

**Recommended Fix**: Extract to named constants
```typescript
const FRACTION_CONFIG = {
  LINE_PADDING: 4,
  NUMERATOR_VERTICAL_OFFSET: 0.8,
  LINE_VERTICAL_OFFSET: 2,
  DENOMINATOR_VERTICAL_OFFSET: 4,
  MIXED_NUMBER_SPACING: 3,
  OPERATOR_SPACING: 5,
} as const;
```

**Effort Estimate**: 1 hour

---

#### 6. Fragile String Parsing (Severity: Important)
**Location**: `drawNumber()` line 145
**Impact**: Fails on double spaces, tabs, or other whitespace variations

**Current Code**:
```typescript
const parts = trimmed.split(' '); // Fails on "1  1/2" (double space)
```

**Recommended Fix**:
```typescript
const parts = trimmed.split(/\s+/).filter(Boolean);
```

**Effort Estimate**: 30 minutes

---

#### 7. Missing Validation: Problem-Answer Alignment (Severity: Important)
**Location**: Answer key parsing (lines 88-96)
**Impact**: Silent failures when answer count doesn't match problem count

**Recommended Fix**: Add validation after parsing
```typescript
const missingAnswers = problems
  .map((p, idx) => ({ problem: p, index: idx }))
  .filter(({ problem }) => !problem.answer.trim());

if (missingAnswers.length > 0) {
  const indices = missingAnswers.map(({ index }) => index + 1).join(', ');
  console.warn(`Warning: ${missingAnswers.length} problems missing answers: #${indices}`);
}
```

**Effort Estimate**: 30 minutes

---

### Optimizations (Nice to Have)

#### 8. Unnecessary Regex Compilation
**Location**: Multiple locations (lines 55, 60, 89, 148, 181)
**Impact**: Minor performance hit from compiling same regex repeatedly

**Fix**: Compile regexes once at module level
```typescript
const NUMERIC_ONLY_REGEX = /^\d+$/;
const ANSWER_LINE_REGEX = /^(\d+)\.\s*(.+)$/;
const ALGEBRAIC_REGEX = /[a-zA-Z]/;
```

**Effort Estimate**: 15 minutes

---

#### 9. Side-Effecting PDF Generation
**Location**: `generateWorksheetPDF()` function
**Impact**: Difficult to unit test without file I/O

**Current State**: Function creates file as side effect

**Recommended Fix**: Separate PDF creation from file writing
```typescript
export function createWorksheetPDF(worksheetData: WorksheetData): PDFKit.PDFDocument {
  const doc = new PDFDocument({ margin: 50 });
  // ... add content
  return doc;
}

export function savePDF(doc: PDFKit.PDFDocument, outputPath: string): Promise<void> {
  return new Promise((resolve, reject) => {
    const stream = fs.createWriteStream(outputPath);
    stream.on('finish', resolve);
    stream.on('error', reject);
    doc.pipe(stream);
    doc.end();
  });
}
```

**Effort Estimate**: 1 hour

---

### Edge Cases Not Handled

1. **Division by Zero**: No check for denominator === "0" in fractions
2. **Malformed Expressions**: No validation for trailing/leading operators (e.g., "1/2 + ")
3. **Resource Cleanup**: PDF streams not properly closed on errors
4. **Whitespace Variations**: Parser assumes single spaces in markdown tables

---

### TypeScript Configuration Issues

**Missing**: Strict mode in `tsconfig.json`

**Recommended Configuration**:
```json
{
  "compilerOptions": {
    "strict": true,
    "noUncheckedIndexedAccess": true,
    "noImplicitReturns": true,
    "noFallthroughCasesInSwitch": true,
    "forceConsistentCasingInFileNames": true,
    "esModuleInterop": true
  }
}
```

**Impact**: Enabling strict mode would catch:
- `problems[problemNum]` could be undefined
- `parts[1]` could be undefined
- Missing return statements in some code paths

---

### Prioritized Action Plan

**Phase 1: Critical Security & Stability (3-4 hours)** ✅ COMPLETE
1. ✅ Add error handling to all file operations (COMPLETED 2025-11-24)
2. ✅ Implement path traversal protection (COMPLETED 2025-11-24)
3. ✅ Add input validation with meaningful error messages (COMPLETED 2025-11-24)
4. ✅ Enable TypeScript strict mode (COMPLETED 2025-11-24)

**Phase 2: Code Quality & Maintainability (3-4 hours)** ✅ COMPLETE
5. ✅ Refactor to single-pass parsing (COMPLETED 2025-11-24)
6. ✅ Extract magic numbers to constants (COMPLETED 2025-11-24)
7. ✅ Add branded types for type safety (COMPLETED 2025-11-24)
8. ✅ Fix fragile string parsing (COMPLETED 2025-11-24)

**Phase 3: Polish & Optimization (2-3 hours)** ✅ COMPLETE
9. ✅ Add problem-answer alignment validation (COMPLETED 2025-11-24)
10. ✅ Compile regexes once (COMPLETED 2025-11-24)
11. ✅ Separate PDF creation from I/O (COMPLETED 2025-11-24)
12. ✅ Handle additional edge cases (COMPLETED 2025-11-24)

**Total Estimated Effort**: 8-11 hours **✅ ALL COMPLETED 2025-11-24 (8+ hours)**

---

### Learning Resources

**Error Handling**:
- [Node.js Error Handling Best Practices](https://nodejs.org/en/learn/asynchronous-work/error-handling-in-nodejs)
- [TypeScript Error Handling Guide](https://www.totaltypescript.com/tutorials/error-handling-in-typescript)

**Type Safety**:
- [TypeScript Narrowing](https://www.typescriptlang.org/docs/handbook/2/narrowing.html)
- [Branded Types in TypeScript](https://egghead.io/blog/using-branded-types-in-typescript)

**Security**:
- [OWASP Path Traversal](https://owasp.org/www-community/attacks/Path_Traversal)
- [Node.js Security Best Practices](https://nodejs.org/en/learn/getting-started/security-best-practices)

**Curriculum & Educational References**:
- [Victorian Curriculum and Assessment Authority (F-10)](https://f10.vcaa.vic.edu.au/) - Official VCAA F-10 curriculum resources and standards
- [Matrix Education - Year 7 Tutoring Melbourne](https://www.matrix.edu.au/vic/year-7-tutoring-melbourne/) - Year 7 tutoring resources aligned with Victorian curriculum
- [Wolfram MathWorld](https://mathworld.wolfram.com/) - Comprehensive mathematics encyclopedia and reference for concepts, formulas, and mathematical definitions

---

### Next Steps

When implementing fixes:
1. **Always run tests first**: `npm test` before making changes
2. **One issue at a time**: Don't bundle unrelated fixes
3. **Update tests**: Add tests for error cases and edge cases
4. **Document changes**: Update this section as issues are resolved

**Status**: ✅ **ALL PHASES COMPLETE (2025-11-24)** - All 12 code review items resolved:
- Phase 1: Error handling, path traversal protection, TypeScript strict mode
- Phase 2: Single-pass parsing, magic number constants, branded types, robust string parsing
- Phase 3: Problem-answer validation, regex optimization, PDF I/O separation, edge case handling
- **Codebase Status**: Production-ready. Secure, type-safe, robust error handling, testable architecture.

## Recent Session Changes (2025-11-23)

**Session Summary**: This session added algebra worksheet support, fixed a critical multi-term expression rendering bug, created 6 new worksheets (Set 3 fractions + 3 algebra worksheets: 2 collecting terms sets and 1 multiplication), implemented a comprehensive Jest test suite with 32 passing tests, conducted senior code review documenting technical debt, and established VCAA Level 7-8 curriculum roadmap.

### Algebra Support Added
1. **Enhanced PDF Generator**: Modified `drawNumber()` function to detect and handle algebraic expressions (expressions containing letters)
2. **Parser Update**: Updated table parser to recognize "Expression" column headers in addition to "Fraction" headers
3. **VCAA Alignment**: Created algebra worksheet aligned with Victorian Curriculum Level 7 standards for collecting like terms

### Expression Rendering Bug Fix
**Issue**: The `drawExpression()` function was designed for binary operations (e.g., "1/8 + 3/8"). When rendering algebraic expressions with multiple operators (e.g., "2a + 3b + 4a"), it would split on the operator and only render the first two parts, leaving out the third term.

**Solution**:
1. Modified `drawExpression()` to detect algebraic expressions (containing letters) and render them as plain text
2. Added check for multiple operators - if more than 2 parts, render as plain text
3. Preserved fraction rendering logic for simple binary fraction operations
4. Location: `generate-worksheet-pdf.ts:183`

**Impact**: All algebraic expressions now render correctly with all terms visible. Fraction worksheets continue to work with proper fraction notation.

### New Worksheets Created
1. **Fraction Set 3**: Created third set of 3 fraction worksheets (addition, subtraction, reduction) with 30 new problems each
2. **Algebra - Collecting Like Terms Set 1**: First algebra worksheet with progressive difficulty:
   - Simple single-variable terms
   - Multiple variables
   - Product terms (ab, xy, etc.)
   - Mixed terms with powers (x² and x)
3. **Algebra - Collecting Like Terms Set 2**: Second collecting terms worksheet with similar structure and new problems
4. **Algebra - Multiplication**: Algebraic multiplication worksheet covering:
   - Multiplying different variables (e.g., 7a × 9b = 63ab)
   - Multiplying same variables creating powers (e.g., 8u × u = 8u²)
   - Multiplying terms with existing powers (e.g., 3x × 2x² = 6x³)
   - Expanding powers of expressions (e.g., (5t)³ = 125t³)

### Jest Testing Implementation
Implemented comprehensive test suite to prevent regressions and catch bugs early:

1. **Test Framework Setup**:
   - Installed Jest with TypeScript support (ts-jest)
   - Created `tsconfig.json` with proper configuration
   - Added `jest.config.js` for test environment setup
   - Added test scripts to `package.json` (test, test:watch, test:coverage)

2. **PDFKit Mock**: Created `__mocks__/pdfkit.ts` to mock PDF generation for unit testing

3. **Test Coverage**:
   - `parseMarkdownWorksheet()` - Tests markdown parsing for both fraction and algebra worksheets
   - `drawExpression()` - **Critical regression tests for multi-term expression bug**
   - `drawNumber()` - Tests rendering of numbers, fractions, mixed numbers, and algebraic text
   - Test fixtures in `__tests__/fixtures/` for consistent test data

4. **Code Changes for Testability**:
   - Exported all functions and interfaces from `generate-worksheet-pdf.ts`
   - Wrapped main execution in `require.main === module` check to prevent execution during test imports

5. **Bug Fixes During Testing**:
   - Fixed `drawNumber()` to properly trim whitespace for algebraic expressions
   - All 32 tests passing with 100% coverage of critical functions

**Result**: Tests now catch the multi-term expression bug and other rendering issues. Always run `npm test` before modifying PDF generator code!

### Code Review & Technical Debt Documentation
Conducted comprehensive senior-level code review of `generate-worksheet-pdf.ts`:

**Findings:**
- 2 Critical issues (error handling, path traversal security)
- 5 Important issues (parsing efficiency, type safety, magic numbers)
- 2 Optimizations (regex compilation, side effects)
- Full documentation in "Code Review Findings & Technical Debt" section
- Prioritized action plan with effort estimates (8-11 hours total)

**Status**: All issues documented, no fixes implemented yet

### Curriculum Roadmap Planning
Researched and documented VCAA Level 7-8 curriculum requirements:

**Level 7 Remaining Topics:**
- Substitution into formulas
- Word problems to algebra
- Simple linear equations
- Arithmetic laws
- Cartesian coordinates

**Level 8 Topics:**
- Expanding brackets (including binomials)
- Factorising expressions
- Complex linear equations
- Linear graphing

**Documentation**: Complete roadmap in "Future Worksheet Roadmap" section

### Documentation
- Updated CLAUDE.md to reflect algebra worksheet support
- Documented VCAA Level 7 curriculum alignment
- Updated architecture notes to show generator handles both fractions and algebra
- Added comprehensive testing section with instructions
- Added code review findings with actionable fixes
- Added curriculum roadmap for future worksheets

## Recent Session Changes (2025-11-24)

**Session Summary**: Implemented comprehensive error handling and path traversal protection for the PDF generator, addressing the two critical security issues from the code review.

### Error Handling Implementation

**Completed**: Priority items #1 and #3 from code review action plan

**Changes Made**:

1. **parseMarkdownWorksheet() Error Handling** (`generate-worksheet-pdf.ts:49-180`)
   - Input validation: Checks file path is provided and is a string
   - File existence check: Uses `fs.existsSync()` before attempting to read
   - Try-catch around `fs.readFileSync()` with descriptive error messages
   - Empty file validation: Throws error if file is empty after trimming
   - Result validation: Ensures title and problems were found during parsing
   - Missing answer warnings: Logs warning with problem numbers when answers are missing

2. **generateWorksheetPDF() Error Handling** (`generate-worksheet-pdf.ts:294-404`)
   - Input validation: Validates worksheetData object and all required properties
   - Output path validation: Checks path is string and ends with .pdf extension
   - Try-catch wrapper around entire PDF generation process
   - Stream error handling: Added error listener on write stream
   - Descriptive error messages: All errors include context about what failed

**Testing**: All 32 Jest tests pass - no regressions

**Impact**:
- Application no longer crashes ungracefully on file errors
- Users get clear, actionable error messages
- Invalid inputs rejected before processing
- Malformed markdown files report specific parsing failures

### Path Traversal Protection

**Completed**: Priority item #2 from code review action plan (Critical Security Issue)

**Changes Made**:

1. **validateFilePath() Function** (`generate-worksheet-pdf.ts:16-44`)
   - Validates input is a string
   - Resolves to absolute path using `path.resolve()`
   - Checks resolved path starts with current working directory
   - Validates file extension matches expected (.md or .pdf)
   - Returns validated absolute path
   - Throws descriptive errors for security violations

2. **Main Execution Block** (`generate-worksheet-pdf.ts:407-425`)
   - Validates markdown input path before processing
   - Validates PDF output path before writing
   - Wraps entire execution in try-catch
   - Exits with error code 1 on failure
   - Logs clear error messages

**Security Testing**:
- ✅ Blocks `../../../etc/passwd` with "Access denied: File must be within project directory"
- ✅ Blocks `package.json` as input with "Invalid file: Expected .md file"
- ✅ Allows valid paths like `fraction-reduction-01.md`
- ✅ All 32 tests pass - no regressions

**Impact**:
- **CRITICAL**: Users cannot access files outside project directory
- Path traversal attacks (e.g., `../../../etc/passwd`) are blocked
- Only .md files accepted as input, only .pdf files as output
- All file paths resolved to absolute paths for consistency
- Application is now secure against basic path traversal attacks

### TypeScript Strict Mode

**Completed**: Priority item #4 from code review action plan - Phase 1 now complete!

**Changes Made**:

1. **tsconfig.json Enhanced** (`tsconfig.json:1-20`)
   - Already had `"strict": true` enabled
   - Added `"noUncheckedIndexedAccess": true` - makes array/object access return `T | undefined`
   - Added `"noImplicitReturns": true` - ensures all code paths return a value
   - Added `"noFallthroughCasesInSwitch": true` - prevents accidental fallthrough in switches
   - Added `"forceConsistentCasingInFileNames": true` - catches case sensitivity issues

2. **Main Code Fixes** (`generate-worksheet-pdf.ts`)
   - Fixed array access in loops: `lines[i]!.trim()` (2 instances)
   - Fixed checked array access: `cells[1]!` and `cells[3]!` with proper guards
   - Fixed regex match groups: Added checks for `match[1]` and `match[2]` existence
   - Fixed problems array access: Added `if (!problem) continue` guards
   - Fixed split results: `parts[0]`, `parts[1]`, fraction parts - all properly checked
   - Fixed drawExpression: Added `parts[0] && parts[1]` check for binary operations

3. **Test File Fixes**
   - `__tests__/drawExpression.test.ts`: Added `!` to `textCalls[0]!.text`
   - `__tests__/parseMarkdownWorksheet.test.ts`: Added `!` to all array accesses (20 instances)
   - All test assertions now use non-null assertions for array access

**TypeScript Compilation**: Clean - no errors with full strict mode
**Testing**: All 32 tests pass - no regressions

**Impact**:
- **Type Safety**: Array access now properly typed as potentially undefined
- **Runtime Safety**: Added explicit checks for undefined array elements
- **Developer Experience**: TypeScript catches more bugs at compile time
- **Code Quality**: Forces proper null/undefined handling throughout codebase

**Phase 1 Complete**: All critical security and stability issues resolved (3.5 hours total)

## Recent Session Changes (2025-11-24)

**Session Summary**: Completed Phases 2 and 3 of the code review action plan. Implemented single-pass parsing, extracted magic numbers to constants, added branded types for type safety, fixed fragile string parsing, separated PDF creation from I/O operations, added comprehensive edge case handling, and optimized regex compilation. All 32 tests passing with zero regressions. Codebase is now production-ready.

### Phase 2: Code Quality & Maintainability ✅

#### Single-Pass Parsing Refactor
- **Removed**: Double-pass file iteration (was O(2n), now O(n))
- **Added**: State machine approach with temporary Map for answers
- **Benefits**: Better performance, cleaner code logic
- **Location**: `parseMarkdownWorksheet()` lines 83-210

#### Magic Numbers → Constants
- **Created**: `CONFIG` object with organized layout constants
  - Fraction drawing: `LINE_PADDING`, `NUMERATOR_VERTICAL_OFFSET`, `LINE_Y_OFFSET`, `DENOMINATOR_Y_OFFSET`
  - Spacing: `MIXED_NUMBER_SPACING`, `OPERATOR_SPACING`, `LABEL_SPACING`
  - PDF layout: Column positions, font sizes, margins, vertical spacing
- **Benefits**: Self-documenting code, easy to adjust layout, maintainable
- **Location**: `generate-worksheet-pdf.ts:19-77`

#### Branded Types for Type Safety
- **New Types**: `NonEmptyString`, `PositiveNumber`, `Coordinate`
- **Validation Functions**: `asNonEmptyString()`, `asPositiveNumber()`
- **Updated Interfaces**: `Problem` and `WorksheetData` now use branded types
- **Benefits**: TypeScript catches invalid values at compile time, runtime validation
- **Location**: `generate-worksheet-pdf.ts:5-28`

#### Fragile String Parsing Fix
- **Changed**: `split(' ')` → `split(/\s+/).filter(Boolean)`
- **Handles**: Multiple spaces, tabs, mixed whitespace in mixed numbers
- **Location**: `drawNumber()` line 277
- **Result**: Robust parsing of "1  5/6" (double space), "1\t5/6" (tabs), etc.

#### Regex Optimization
- **Created**: `REGEX` object with pre-compiled patterns
- **Patterns**: `NUMERIC_ONLY`, `ANSWER_LINE`, `ALGEBRAIC`, `WHITESPACE_SPLIT`
- **Benefits**: Eliminates repeated regex compilation, minor performance improvement
- **Location**: `generate-worksheet-pdf.ts:41-49`

### Phase 3: Polish & Optimization ✅

#### Problem-Answer Alignment Validation
- **New Function**: `validateProblemAnswerAlignment(problems)`
- **Critical Threshold**: Throws error if <50% of problems have answers
- **Warnings**: Logs individual missing answer numbers with problem count
- **Location**: `generate-worksheet-pdf.ts:281-305`
- **Benefit**: Prevents silent failures, catches incomplete answer keys

#### Edge Case Handling
- **New Function**: `validateFraction(numerator, denominator, problemNum)`
  - Checks for division by zero in fractions
  - Throws error with problem number for debugging

- **New Function**: `validateExpression(expression, problemNum)`
  - Empty expression validation
  - Leading/trailing operator detection (e.g., "+ 5/3")
  - Consecutive operator detection (e.g., "5 * + 3")
  - Unmatched parentheses validation
  - Detailed error messages with problem numbers

- **Integrated Into**: Markdown parsing for both problems and answers
- **Location**: `generate-worksheet-pdf.ts:232-275`

#### PDF I/O Separation (Refactored from 1 to 3 Functions)
- **New Function**: `createWorksheetPDF(worksheetData): PDFDocument`
  - Pure PDF creation, no I/O side effects
  - Returns PDFKit document object
  - Testable without file operations
  - Location: `generate-worksheet-pdf.ts:388-489`

- **New Function**: `savePDFToFile(doc, path): Promise<void>`
  - Async Promise-based file writing
  - Proper error handling on both doc and stream
  - Resource cleanup via Promise callbacks
  - Location: `generate-worksheet-pdf.ts:494-530`

- **Updated Function**: `generateWorksheetPDF(worksheetData, path): Promise<void>`
  - Now async wrapper around creation + save
  - High-level API for users
  - Location: `generate-worksheet-pdf.ts:535-538`

- **Updated**: Main execution block now uses async/await
- **Benefits**: Better separation of concerns, easier testing, proper async handling

### Testing & Verification
- ✅ All 32 Jest tests passing
- ✅ No regressions from Phase 2 & 3 changes
- ✅ Verified with real worksheets: `fraction-addition-01.md`, `algebra-collecting-terms-01.md`
- ✅ PDF generation working correctly with new async architecture

### Key Metrics
- **Code Quality**: 12/12 code review issues now addressed
- **Type Safety**: Enhanced with branded types + strict TypeScript mode
- **Performance**: Single-pass parsing (O(n) instead of O(2n))
- **Maintainability**: Magic numbers in constants, clear validation functions
- **Testability**: PDF creation separated from I/O, easier unit testing
- **Security**: Path traversal protection + comprehensive input validation
- **Robustness**: Edge case handling for division by zero, malformed expressions

## Recent Session Changes (2025-12-06)

**Session Summary**: Created 6 new fraction worksheets expanding the collection to 6 sets of 3 types each (18 total fraction worksheets).

### New Worksheets Created

**Set 5 (With Tips):**
- `worksheets/fraction-reduction-05.md` / `.pdf` - 30 fraction reduction problems
- `worksheets/fraction-subtraction-05.md` / `.pdf` - 30 subtraction problems (like denominators, with borrowing)

**Set 6 (Without Tips):**
- `worksheets/fraction-addition-06.md` / `.pdf` - 30 addition problems with unlike denominators (Set 3)
  - Answer corrections made: Fixed 7 calculation errors (Q9, Q12, Q14, Q20, Q26, Q29, Q30)
- `worksheets/fraction-reduction-06.md` / `.pdf` - 30 new reduction problems
- `worksheets/fraction-subtraction-06.md` / `.pdf` - 30 new subtraction problems

### Worksheet Statistics
- Total worksheets: 18 (15 fraction + 3 algebra)
- Fraction worksheets: 15 (6 sets × 3 types)
  - Sets 1-5: Include practice tips
  - Set 6: No tips section (streamlined format)
- All PDFs generated successfully, no regressions in tests
- Answer keys: Complete and verified (one answer per line)

### Design Notes
- Set 6 worksheets use a cleaner format without tips section
- Useful for students who don't need guidance
- Maintains consistent 30-problem layout across all sets
- Progressive difficulty within each worksheet type

### Worksheet Creation Rules

**Fraction Addition Worksheets:**
- ✅ **ONLY use single-digit denominators** (1, 2, 3, 4, 5, 6, 7, 8, 9)
- Reason: Large LCD calculations with double-digit denominators become tedious for students
- Examples of acceptable: 1/3 + 1/4, 2/5 + 1/6, 3/8 + 5/7
- Examples to avoid: 1/12 + 1/15, 3/20 + 7/24

**Fraction Subtraction & Reduction Worksheets:**
- Can use any appropriate denominator
- Follow similar difficulty progression as addition worksheets

## PostgreSQL Database Migration (In Progress)

**Status**: ✅ Phase 2 complete (2025-12-10) - 870 problems migrated

**Objective**: Transform the markdown-based worksheet system into a PostgreSQL database-driven platform with on-demand worksheet generation.

### Plan Overview

**Current State**: 29 markdown worksheets → 870 problems in PostgreSQL
**Target State**: On-demand worksheet generation from problem bank

### Key Features

1. **Problem Bank**: All 870 problems stored in PostgreSQL with rich metadata
   - Type (fraction-addition, fraction-subtraction, etc.)
   - Difficulty (easy 1-10, medium 11-20, hard 21-30)
   - Tags (like-denominators, single-digit-denominators, mixed-numbers, etc.)
   - Source tracking (preserves original worksheet + position)

2. **On-Demand Generation**: Select 30 problems from pool based on criteria
   - Template-based: Use predefined templates for standard worksheets
   - Custom: Specify type, difficulty mix, required tags
   - Reproducible: Optional seed for identical worksheets

3. **Dual-Source Strategy**
   - PostgreSQL: Primary source, live problem bank
   - Markdown files: Read-only archive for version control & backup

### Technology Stack

- **ORM**: Prisma v6.19.0 with TypeScript
- **Database**: PostgreSQL 16 (local via Homebrew)
- **CLI**: Commander.js for user interaction
- **Code Reuse**: All existing PDF rendering functions

### Phase 1 Setup Details (Completed 2025-12-09)

**Installed packages:**
- `prisma` (dev) - CLI and migration tools
- `@prisma/client` - Type-safe database client
- `@prisma/adapter-pg`, `pg` - PostgreSQL driver
- `dotenv` - Environment variable loading
- `commander` - CLI framework

**Database:**
- PostgreSQL 16 installed via `brew install postgresql@16`
- Database: `maths_tutor_dev` on localhost:5432
- Connection: `.env` file (gitignored)

**Tables created:**
- `Problem` - Individual problems with metadata (type, difficulty, tags, denominators)
- `WorksheetTemplate` - Predefined worksheet configurations
- `GeneratedWorksheet` - Tracks generated worksheets with seed
- `WorksheetProblem` - Links problems to worksheets with position

**Problem types (enum):**
- `FRACTION_ADDITION`, `FRACTION_SUBTRACTION`, `FRACTION_REDUCTION`
- `FRACTION_MULTIPLICATION`, `FRACTION_DIVISION` (future)
- `ALGEBRA_COLLECTING_TERMS`, `ALGEBRA_MULTIPLICATION`

### Architecture

**New File Structure**:
```
src/
├── db/prisma.ts              # Prisma client singleton
├── generators/
│   ├── problem-selector.ts   # Selection algorithm
│   ├── worksheet-generator.ts # Main orchestration
│   └── template-manager.ts   # Template CRUD
├── pdf/
│   ├── pdf-renderer.ts       # Reuses existing functions
│   └── layout-config.ts      # CONFIG constants
├── cli/
│   └── generate-worksheet.ts # CLI entry point
└── types/
    └── worksheet.types.ts    # Shared types

scripts/
├── migrate-markdown-to-db.ts # One-time migration
└── export-db-to-markdown.ts  # Backup export

prisma/
├── schema.prisma
└── migrations/
```

### CLI Usage Examples (After Implementation)

```bash
# Template-based generation
npx tsx src/cli/generate-worksheet.ts --template fraction-addition-standard

# Custom worksheet
npx tsx src/cli/generate-worksheet.ts \
  --type FRACTION_ADDITION \
  --count 30 \
  --difficulty easy:10,medium:15,hard:5 \
  --tags like-denominators

# Reproducible with seed
npx tsx src/cli/generate-worksheet.ts \
  --template algebra-collecting-terms \
  --seed "class-2025-01-15"
```

### Implementation Plan

**8 Phases over 30-40 hours**:

1. ✅ **Database Setup** (2-3h) - Install Prisma, create schema, run migrations - DONE 2025-12-09
2. ✅ **Migration Script** (4-6h) - Migrate 870 problems from markdown to DB - DONE 2025-12-10
3. ⏳ **Core Generators** (6-8h) - ProblemSelector and WorksheetGenerator
4. ⏳ **PDF Integration** (3-4h) - Extract & reuse existing PDF code
5. ⏳ **CLI Development** (4-5h) - Command-line interface with all options
6. ⏳ **Testing & QA** (6-8h) - Unit/integration tests, verify quality matches
7. ⏳ **Documentation** (3-4h) - Export tool, README, workflow docs
8. ⏳ **Deployment** (2-3h) - Fresh environment test, production setup

### Phase 2 Details (Completed 2025-12-10)

**Files created:**
- `src/db/prisma.ts` - Prisma client singleton
- `scripts/migrate-markdown-to-db.ts` - Migration script with metadata extraction

**Migration results:**
- 29 worksheets processed
- 870 problems inserted (0 errors)
- Problems by type: FRACTION_ADDITION (210), FRACTION_SUBTRACTION (210), FRACTION_REDUCTION (180), ALGEBRA_COLLECTING_TERMS (150), ALGEBRA_MULTIPLICATION (120)
- Problems by difficulty: EASY (290), MEDIUM (290), HARD (290)

**Tags auto-generated:**
- `like-denominators`, `unlike-denominators`, `single-digit-denominators`
- `mixed-numbers-in-question`, `mixed-numbers-in-answer`, `results-in-mixed-number`
- `has-powers`, `multiple-variables`, `product-terms`
- `set-1` through `set-7` (source tracking)

### ⚠️ PRIORITY: Critical Issues to Fix (Next Session)

Staff engineer review identified 4 critical issues in migration script:

| # | Issue | File | Fix |
|---|-------|------|-----|
| 1 | **Singleton bypassed** | `migrate-markdown-to-db.ts:14` | Use `import { prisma } from '../src/db/prisma'` |
| 2 | **No transaction safety** | Lines 207-251 | Wrap all inserts in `prisma.$transaction()` |
| 3 | **No idempotency** | Line 239 | Add `--fresh` CLI flag to clear before insert |
| 4 | **Flawed variable detection** | Lines 166-172 | Simplify to `new Set(variables)` |

**Additional improvements needed:**
- Move regexes to module level (performance)
- Add input validation for worksheets directory
- Add unique constraint: `@@unique([sourceWorksheet, sourceProblemNumber])`
- Improve error handling with fail-fast on parse errors

**Estimated fix time:** ~3.5 hours

### Dependencies

**Installed:**
```bash
npm install prisma @types/pg --save-dev
npm install @prisma/client @prisma/adapter-pg pg dotenv commander
```

### Database Setup

**Current: Local PostgreSQL (installed 2025-12-09)**
```bash
# Start PostgreSQL service
brew services start postgresql@16

# Connect to database
/opt/homebrew/opt/postgresql@16/bin/psql -d maths_tutor_dev

# View tables
\dt
```

**Alternative: Neon (Cloud PostgreSQL - free tier)**
- Sign up: https://neon.tech
- Create database
- Update `.env` with connection string

### Success Criteria

- [x] 870 problems migrated to database
- [x] All metadata correct (type, difficulty, tags)
- [x] All 32 existing tests pass
- [ ] Generated PDFs match markdown quality
- [ ] CLI accepts all parameters
- [ ] Seeded generation is reproducible
- [ ] Worksheet generation <1s, PDF rendering <2s

### Detailed Plan

Full implementation plan saved at: `/Users/adrian/.claude/plans/dazzling-stirring-tiger.md`

Contains:
- Complete Prisma schema with all models
- Migration script architecture
- Core component specifications (ProblemSelector, WorksheetGenerator)
- CLI interface design
- Testing strategy
- Integration approach for existing PDF code
- Markdown file maintenance strategy

### Next Steps

1. ⏳ **Awaiting approval** to begin Phase 1 (Database Setup)
2. Once approved, start in next session with:
   - Prisma installation
   - Database configuration
   - Schema creation
   - Initial migration

---

## Recent Session Changes (2025-12-16)

**Session Summary**: Implemented React Frontend v2 (Phases 1-4) - Created web-based UI for browsing worksheets and Express API backend to serve problems from PostgreSQL database.

### Phase 1-3: React Frontend Setup (Completed 2025-12-15)

**Monorepo Structure Created:**
- Initialized `apps/web/` with Vite + React + TypeScript + Tailwind CSS
- Configured npm workspaces in root `package.json`
- Added Lucide React for icons
- Implemented gradient background and responsive layout

**Core Components Built:**
- `Fraction.tsx` - Renders fractions with stacked numerator/denominator
- `MixedNumber.tsx` - Renders mixed numbers (whole + fraction)
- `MainCategory.tsx` - Expandable category navigation button
- Math rendering utilities: `parseFraction()`, `parseMixedNumber()`, `renderMathExpression()`

**Layout & Navigation:**
- Full sidebar navigation with category expansion
- Worksheet list view
- Worksheet detail view with print button
- Print-specific CSS for clean browser printing
- STIX Two Math font integration

### Phase 4: API Backend Setup (Completed 2025-12-16)

**Express API Created:**
- Structure: `packages/api/src/` with routes, services, index
- TypeScript configuration with strict mode
- Hot reload with `tsx watch`

**Endpoints Implemented:**
1. `GET /api/categories` - Returns problem types with counts and display names
2. `GET /api/problems` - Query with filters (type, difficulty, tags, limit, seed)
3. `GET /api/tags/:type` - Returns available tags for problem type
4. `GET /health` - Health check endpoint

**Service Layer:**
- `problems.service.ts` - Database logic with Prisma
- Seed-based deterministic shuffling (Fisher-Yates algorithm)
- Tag filtering with array operators
- Difficulty filtering support

**Configuration & Middleware:**
- CORS enabled for `http://localhost:5173`
- Error handling middleware
- Request logging
- Environment variable support (API_PORT, FRONTEND_URL)

**Prisma Integration:**
- Fixed imports to use custom client location (`generated/prisma`)
- Singleton pattern via `src/db/prisma.ts`
- All endpoints tested and working with 870 problems from database

**Scripts Added:**
- `npm run api:dev` - Start API with hot reload
- `npm run api:build` - Build for production
- `npm run api:start` - Run production build

**Testing:**
- All 3 endpoints verified working
- Complex queries tested (difficulty + tag filtering)
- Seed-based shuffling validated
- PostgreSQL connection confirmed

### Tech Stack

| Component | Technology | Version |
|-----------|------------|---------|
| Frontend | React + Vite + TypeScript | 18 / 5+ / 5.3 |
| Styling | Tailwind CSS | 3.4 |
| Backend | Express.js + TypeScript | 4.18 / 5.3 |
| Database | PostgreSQL + Prisma | 16 / 6.19 |
| Icons | Lucide React | Latest |

### Files Created

**Frontend (`apps/web/src/`):**
- `App.tsx` - Main application with routing logic
- `components/Fraction.tsx` - Fraction rendering component
- `components/MixedNumber.tsx` - Mixed number rendering component
- `components/MainCategory.tsx` - Category navigation component
- `types/index.ts` - TypeScript type definitions
- `utils/utils.ts` - Utility functions

**Backend (`packages/api/src/`):**
- `index.ts` - Express server entry point
- `routes/problems.routes.ts` - API route handlers
- `services/problems.service.ts` - Database business logic

**Configuration:**
- `packages/api/package.json` - API dependencies
- `packages/api/tsconfig.json` - TypeScript config for API

### Documentation
- Added comprehensive "React Frontend & API Backend (v2)" section to CLAUDE.md
- Documented all API endpoints with examples
- Documented frontend components and utilities
- Included deployment considerations and environment variables

### Current Status
- ✅ Phase 1-4 Complete: React UI + API Backend operational
- ⏳ Next Phase 5: Frontend-API Integration (replace static data with API calls)
- Remaining: Phases 6-8 (Print functionality, advanced features, polish)

---

## Recent Session Changes (2025-12-16 - Continued)

**Session Summary**: Created TypeScript API client for React frontend to communicate with Express backend (Phase 5 - Task 1).

### API Client Implementation

**Files Created:**

1. **`apps/web/src/api/types.ts`** - TypeScript type definitions
   - `ProblemType` - Enum of all problem types (7 types)
   - `Difficulty` - EASY, MEDIUM, HARD enums
   - `CategoryInfo` - Category metadata with counts
   - `Problem` - Complete problem object matching database schema
   - `ProblemFilters` - Query filter options for API calls

2. **`apps/web/src/api/client.ts`** - Main API client (133 lines)
   - Base URL configuration: Uses `VITE_API_URL` env var, defaults to `http://localhost:3001`
   - `ApiError` class: Custom error handling with status codes and response data
   - `apiFetch<T>()`: Generic fetch wrapper with JSON parsing and error handling
   - `buildQueryString()`: Converts filter objects to URL query parameters (arrays → comma-separated)
   - **API Methods:**
     - `getCategories()` - Fetch all problem types with counts
     - `getProblems(filters)` - Query problems with optional type/difficulty/tags/limit/seed filters
     - `getTags(type)` - Get available tags for a problem type
     - `healthCheck()` - API health check endpoint

3. **`apps/web/src/api/index.ts`** - Central exports module
   - Re-exports all client functions and types
   - Clean import syntax: `import { getCategories } from '@/api'`

4. **`apps/web/src/api/README.md`** - API client documentation
   - Usage examples for all methods
   - Error handling patterns
   - Endpoint reference table
   - Setup instructions

**Configuration Updates:**

5. **`apps/web/vite.config.ts`** - Added development proxy
   - Proxies `/api/*` requests to `http://localhost:3001`
   - Enables CORS-free development
   - `changeOrigin: true` for proper forwarding

**TypeScript Compatibility Fixes:**

- **Issue 1**: `verbatimModuleSyntax: true` requires inline type imports
  - Fixed: Changed `import type { X }` → `import { type X }`

- **Issue 2**: `erasableSyntaxOnly: true` disallows parameter properties
  - Fixed: Changed constructor parameter properties to explicit class property declarations
  - Updated `ApiError` instantiation to assign properties after construction

**API Client Features:**

✅ **Type-safe**: Full TypeScript support matching backend types
✅ **Error handling**: Custom `ApiError` class with HTTP status codes
✅ **Flexible filtering**: Supports all query parameters (type, difficulty, tags, limit, seed)
✅ **Environment-aware**: Configurable via `VITE_API_URL` environment variable
✅ **Development proxy**: Vite forwards API requests to backend automatically
✅ **Query builder**: Automatic conversion of filter objects to URL params
✅ **Well-documented**: Complete README with usage examples

**Usage Example:**
```typescript
import { getCategories, getProblems, ApiError } from '@/api';

// Fetch all categories
const categories = await getCategories();

// Fetch filtered problems
const problems = await getProblems({
  type: 'FRACTION_ADDITION',
  difficulty: ['EASY', 'MEDIUM'],
  tags: ['unlike-denominators'],
  limit: 15,
  seed: 'reproducible-seed'
});

// Error handling
try {
  const data = await getCategories();
} catch (error) {
  if (error instanceof ApiError) {
    console.error('API Error:', error.message, error.status);
  }
}
```

**Phase 5 Progress:**
- ✅ Task 1: API Client module complete
- ⏳ Task 2: Create custom React hooks (useCategories, useProblems, useTags)
- ⏳ Task 3: Replace static WORKSHEETS data with API calls
- ⏳ Task 4: Add loading and error states
- ⏳ Task 5: Test end-to-end data flow

---

## Previous Session Changes (2024-11-21)

### Parser Bug Fixes
1. **Column Order Fix**: Parser was reading problems left-to-right (1, 16, 2, 17...). Fixed to collect left column (1-15) first, then right column (16-30).
2. **Mixed Number Parsing**: Changed regex from `([^\s]+)` to `(.+)` to properly capture mixed numbers like "1 5/6" in answer key.
3. **Answer Format**: Standardized all worksheets to use one-answer-per-line format for consistency.

### Code Improvements
- Created `parseMarkdownWorksheet()` function to extract problems, answers, and tips from markdown
- Added `drawExpression()` function to handle mathematical expressions (addition, subtraction)
- Refactored `generateWorksheetPDF()` to be fully reusable with any markdown input
- Command-line arguments support: `npx tsx generate-worksheet-pdf.ts <input.md> [output.pdf]`

### Worksheet Updates
- Removed "(No Hints!)" from all worksheet titles for cleaner presentation
- Created 6 total worksheets (2 sets × 3 types)
- All answers verified and formatted correctly
- PDFs regenerated with proper fraction notation

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
