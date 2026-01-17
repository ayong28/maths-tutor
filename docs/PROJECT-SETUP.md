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
│       ├── prisma/             # Database schema & migrations
│       │   ├── migrations/     # Migration files
│       │   └── schema.prisma   # Prisma schema
│       ├── math-data/          # Source JSON files (NOT in git)
│       ├── scripts/            # Backend scripts
│       │   └── data/           # Data import scripts
│       ├── src/
│       │   ├── db/             # Prisma client singleton
│       │   ├── routes/         # API route handlers
│       │   ├── services/       # Database business logic
│       │   └── index.ts        # Express server
│       ├── package.json
│       └── tsconfig.json
├── src/                        # CLI tools & shared code
├── generated/                  # Prisma client output (NOT in git)
└── package.json                # Root workspace config
```

**Files Not Tracked in Git:**
- `generated/` - Prisma client files (regenerated locally via `npx prisma generate`)
- `packages/api/generated/` - Alternative Prisma output location (not used)
- `packages/api/math-data/` - Source JSON data files (data already imported to PostgreSQL)

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

**Location:** All Prisma files are in `packages/api/`:
- Schema: `packages/api/prisma/schema.prisma`
- Migrations: `packages/api/prisma/migrations/`
- Client singleton: `packages/api/src/db/prisma.ts`
- Data scripts: `packages/api/scripts/data/` (local only, not tracked in git)

**Custom Client Location:**
- Generator output: `../../../../generated/prisma` (relative to packages/api/src/db/prisma.ts)
- Client generated to root `generated/` folder for easy access from both CLI and API
- All imports: `import { PrismaClient } from '../../../../generated/prisma'`

**Database Connection:**
- Prisma 6.19.0 (requires `url` in schema.prisma)
- Connection configured via root `.env` file: `DATABASE_URL`
- API loads .env from root via dotenv path resolution

**Running Prisma Commands:**
```bash
# From packages/api (recommended)
cd packages/api
npm run db:migrate          # Run migrations
npm run db:generate         # Generate client
npm run db:studio           # Open Prisma Studio

# From root (requires --schema flag)
npx prisma migrate dev --schema=packages/api/prisma/schema.prisma
npx prisma generate --schema=packages/api/prisma/schema.prisma
```

## Database Setup

### Complete Setup Guide

This guide covers setting up PostgreSQL, creating the database, running migrations, and populating with all 4,628 problems.

#### 1. Start PostgreSQL Server

**Via Homebrew (macOS):**
```bash
brew services start postgresql@16
```

**Verify it's running:**
```bash
brew services list | grep postgresql
# Should show: postgresql@16 started
```

**Connection Details:**
- Database: `maths_tutor_dev`
- Host: `localhost:5432`
- User: Your system username (default)
- Schema: Managed by Prisma

#### 2. Create Database & Run Migrations

```bash
# From packages/api folder (recommended)
cd packages/api
npm run db:migrate

# Or from root
npx prisma migrate dev --schema=packages/api/prisma/schema.prisma
```

**What this does:**
- Creates `maths_tutor_dev` database if it doesn't exist
- Applies all migrations from `packages/api/prisma/migrations/`
- Generates Prisma Client to `generated/prisma/` (root level)

**Expected output:**
```
PostgreSQL database maths_tutor_dev created at localhost:5432

Applying migration `20251209103210_init`
Applying migration `20251210031940_schema_improvements`
...

Your database is now in sync with your schema.
✔ Generated Prisma Client (v6.19.0)
```

#### 3. Populate Database with Problems

The project has **two data sources**:

1. **JSON files** (17 files in `packages/api/math-data/`) - 3,758 problems
2. **Markdown files** (29 files in `worksheets/`) - 870 problems

**Total: 4,628 problems across 29 problem types**

**Note:** Data is already in PostgreSQL. The following are not tracked in git:
- `packages/api/math-data/` - Source JSON files
- `packages/api/scripts/data/` - One-time import scripts

##### Import JSON Problems (local scripts only)

```bash
# From packages/api folder (recommended)
cd packages/api
npm run data:import-json

# Or from root
npx tsx packages/api/scripts/data/import-json-to-db.ts
```

**What it imports (from `packages/api/math-data/`):**
- `angles-problems.json` - 250 problems (ANGLES)
- `area-problems.json` - 250 problems (AREA)
- `coordinates-problems.json` - 250 problems (COORDINATES_PLOTTING)
- `data-analysis-problems.json` - 250 problems (DATA_ANALYSIS)
- `decimals-problems.json` - 250 problems (DECIMALS_*)
- `fraction-division-problems.json` - 150 problems (FRACTION_DIVISION)
- `fraction-multiplication-problems.json` - 150 problems (FRACTION_MULTIPLICATION)
- `index-problems.json` - 250 problems (INDEX_*)
- `integers-problems.json` - 250 problems (INTEGERS_*)
- `linear-equations-problems.json` - 224 problems (ALGEBRA_LINEAR_EQUATIONS_SIMPLE)
- `linear-graphing-problems.json` - 250 problems (LINEAR_GRAPHING)
- `mixed-number-addition-problems.json` - 118 problems (FRACTION_ADDITION)
- `mixed-number-subtraction-problems.json` - 196 problems (FRACTION_SUBTRACTION)
- `percentage-problems.json` - 250 problems (PERCENTAGE_*)
- `probability-problems.json` - 250 problems (PROBABILITY)
- `ratio-rates-problems.json` - 250 problems (RATIO_RATES)
- `substitution-problems.json` - 170 problems (ALGEBRA_SUBSTITUTION)

**Expected output:**
```
Starting import of JSON problems to database...

Found 17 JSON files

Processing: angles-problems.json
  ✓ Inserted 250 problems
...

==================================================
Import Summary:
==================================================
Total files: 17
Total problems inserted: 3758
Successful: 3758
Errors: 0
```

##### Import Markdown Worksheets (local scripts only)

```bash
# From packages/api folder (recommended)
cd packages/api
npm run data:import-markdown

# Or from root (requires local scripts)
npx tsx packages/api/scripts/data/migrate-markdown-to-db.ts
```

**What it imports:**
- `algebra-collecting-terms-*.md` - 150 problems (5 files × 30 problems)
- `algebra-multiplication-*.md` - 120 problems (4 files × 30 problems)
- `fraction-addition-*.md` - 210 problems (7 files × 30 problems)
- `fraction-reduction-*.md` - 180 problems (6 files × 30 problems)
- `fraction-subtraction-*.md` - 210 problems (7 files × 30 problems)

**Expected output:**
```
Starting migration of markdown worksheets to database...

Found 29 worksheet files

Processing: algebra-collecting-terms-01.md
  ✓ Inserted 30 problems (ALGEBRA_COLLECTING_TERMS)
...

==================================================
Migration Summary:
==================================================
Total worksheets: 29
Total problems inserted: 870
Successful: 870
Errors: 0
```

#### 4. Verify Database Population

**Check total count:**
```bash
psql -d maths_tutor_dev -c "SELECT COUNT(*) as total_problems FROM \"Problem\";"
```

**Expected output:**
```
 total_problems
----------------
           4628
(1 row)
```

**Check problems by type:**
```bash
psql -d maths_tutor_dev -c "SELECT type, COUNT(*) as count FROM \"Problem\" GROUP BY type ORDER BY type;"
```

**Expected output:**
```
              type               | count
---------------------------------+-------
 ALGEBRA_COLLECTING_TERMS        |   150
 ALGEBRA_MULTIPLICATION          |   120
 ALGEBRA_SUBSTITUTION            |   170
 ALGEBRA_LINEAR_EQUATIONS_SIMPLE |   224
 ANGLES                          |   250
 AREA                            |   250
 COORDINATES_PLOTTING            |   250
 DATA_ANALYSIS                   |   250
 DECIMALS_ADDITION               |   100
 DECIMALS_SUBTRACTION            |    50
 DECIMALS_MULTIPLICATION         |    50
 DECIMALS_DIVISION               |    50
 FRACTION_ADDITION               |   328
 FRACTION_SUBTRACTION            |   406
 FRACTION_REDUCTION              |   180
 FRACTION_MULTIPLICATION         |   150
 FRACTION_DIVISION               |   150
 INDEX_POWERS                    |    75
 INDEX_SQUARE_ROOTS              |    97
 INDEX_LAWS                      |    78
 INTEGERS_ADDITION               |   100
 INTEGERS_SUBTRACTION            |    50
 INTEGERS_MULTIPLICATION         |    50
 INTEGERS_DIVISION               |    50
 LINEAR_GRAPHING                 |   250
 PERCENTAGE_CONVERSION           |   160
 PERCENTAGE_OF_QUANTITY          |    90
 PROBABILITY                     |   250
 RATIO_RATES                     |   250
(29 rows)
```

**Check problems by difficulty:**
```bash
psql -d maths_tutor_dev -c "SELECT difficulty, COUNT(*) as count FROM \"Problem\" GROUP BY difficulty ORDER BY difficulty;"
```

**Expected output:**
```
 difficulty | count
------------+-------
 EASY       |  1748
 MEDIUM     |  1810
 HARD       |  1070
(3 rows)
```

### Troubleshooting

#### Problem: Database already exists but is empty

**Solution: Clear and re-import** (requires local scripts in `packages/api/scripts/data/`)
```bash
# Clear all problems
psql -d maths_tutor_dev -c "TRUNCATE TABLE \"Problem\" CASCADE;"

# Re-import (scripts not tracked in git - must exist locally)
cd packages/api
npm run data:import-json
npm run data:import-markdown
```

#### Problem: "Database maths_tutor_dev does not exist"

**Solution: Run migrations**
```bash
cd packages/api
npm run db:migrate

# Or from root
npx prisma migrate dev --schema=packages/api/prisma/schema.prisma
```

This creates the database automatically.

### Creating Database Migrations

When you need to change the database schema (add columns, tables, indexes, etc.):

**1. Edit Schema:**
```bash
# Edit the Prisma schema file
code packages/api/prisma/schema.prisma
```

**2. Create Migration:**
```bash
cd packages/api
npm run db:migrate  # Creates and applies migration locally
```

Prisma will prompt for a migration name. Use `snake_case` (e.g., `add_user_preferences`, not `addUserPreferences`).

**3. Test Locally:**
```bash
# Verify schema changes
psql -d maths_tutor_dev -c "\d+ Problem"

# Test API
npm run api:dev
curl http://localhost:3001/health

# Verify data integrity
psql -d maths_tutor_dev -c "SELECT COUNT(*) FROM \"Problem\";"
# Expected: 4628 problems
```

**4. Deploy to Railway:**

See [`RAILWAY-DEPLOYMENT-GUIDE.md`](./RAILWAY-DEPLOYMENT-GUIDE.md) Section 2.5 for the complete deployment workflow, safety checklist, troubleshooting, and emergency procedures.

**Quick Commands:**

| Task | Command |
|------|---------|
| Create migration | `npm run db:migrate` |
| Reset database | `npm run db:reset` |
| Generate Prisma Client | `npm run db:generate` |
| Open Prisma Studio | `npm run db:studio` |
| Check migration status | `npx prisma migrate status` |

**Important Notes:**
- **Always test migrations locally** before deploying to Railway
- Railway automatically applies migrations on deployment (via start command)
- Migration files **must be committed to git** - Railway needs them
- Backup Railway database before major schema changes: `railway run pg_dump $DATABASE_URL > backup.sql`

**Example Migration Workflow:**
```bash
# 1. Edit schema
vim packages/api/prisma/schema.prisma

# 2. Create migration
cd packages/api
npm run db:migrate

# 3. Test locally
npm run api:dev
psql -d maths_tutor_dev -c "SELECT COUNT(*) FROM \"Problem\";"

# 4. Commit to git
git add packages/api/prisma/
git commit -m "Add user preferences table"

# 5. Push to deploy
git push origin main
# Railway automatically applies migration
```

#### Problem: Mixed-number files missing 'type' field

This was fixed with `packages/api/scripts/fix-mixed-number-types.ts`:

```bash
npx tsx packages/api/scripts/fix-mixed-number-types.ts
```

This adds the missing `type` field to:
- `packages/api/math-data/mixed-number-addition-problems.json` → `FRACTION_ADDITION`
- `packages/api/math-data/mixed-number-subtraction-problems.json` → `FRACTION_SUBTRACTION`

**Note:** This script has already been run. The JSON files in `math-data/` are now correct.

### Environment Variables

Create a `.env` file in the project root:

```bash
# API
DATABASE_URL=postgresql://localhost:5432/maths_tutor_dev
API_PORT=3001
FRONTEND_URL=http://localhost:5173
NODE_ENV=development

# Frontend
VITE_API_URL=http://localhost:3001
```

**Note:** Default PostgreSQL connection uses your system username with no password.

### Data Sources Overview

**packages/api/math-data/ folder (JSON files - NOT in git):**
- Generated problems covering 17 problem types
- Pre-processed with tags, difficulty, and metadata
- Includes newer topics: angles, area, coordinates, data analysis, probability, ratio/rates
- **Not tracked in git** - data already imported to PostgreSQL

**worksheets/ folder (Markdown files):**
- Original hand-crafted worksheets (29 files)
- Covers foundational topics: fractions and basic algebra
- Each file has 30 problems with answer key

**Why both?**
- Markdown worksheets are the original source (hand-crafted, high quality)
- JSON files expanded coverage to all VCAA Level 7 topics
- Both are now in the database for querying via API
- JSON source files not needed in git once imported

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
