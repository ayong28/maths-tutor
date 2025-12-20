# Session History Archive

This file contains historical session changes from the Maths Tutor project. For recent changes, see CLAUDE.md.

---

## Session Changes (2025-12-16 - Continued)

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

## Session Changes (2025-12-06)

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

---

## Session Changes (2025-11-24) - Phase 1

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

---

## Session Changes (2025-11-24) - Phases 2 & 3

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

---

## Session Changes (2025-11-23)

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
- Added curriculum roadmap for future worksheets

---

## Session Changes (2024-11-21)

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
