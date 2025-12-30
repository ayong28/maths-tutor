# CLAUDE.md

Guidance for Claude Code when working with this repository.

**Full Docs:** `PROJECT-SETUP.md` | `PROJECT-HISTORY.md` | `E2E-TEST-PLAN.md`

## Quick Start

```bash
# Testing (153 tests total: 32 PDF + 74 Web + 47 E2E)
npm test                       # All: 32 PDF + 74 Web tests (~3s)
npm run test:integration       # App integration tests (21)
npm run test:hooks             # React hooks tests (53)
npm run test:e2e:chromium      # Playwright E2E (47 tests, Chromium only)
npm run test:e2e               # Playwright E2E (all browsers)

# Web App (run both for E2E tests)
npm run dev                    # React (localhost:5173)
npm run api:dev                # Express API (localhost:3001)

# Generate Worksheets
npm run generate -- --type FRACTION_ADDITION --output worksheet.pdf
npm run generate -- --type FRACTION_ADDITION -d "easy:10,medium:15,hard:5"
npm run generate:list          # List problems
npm run generate:tags -- --type FRACTION_ADDITION
```

## Project Overview

Generate printable PDF worksheets for maths problems (VCAA Level 7).

- **3078 problems** in PostgreSQL (18 types: fractions, algebra, integers, decimals, index notation)
- **Web UI**: React + Tailwind + Express API
- **CLI tools**: Custom difficulty mix & tag filtering
- **Tests**: 153 tests (32 PDF + 74 Web + 47 E2E)

**Top Types:** FRACTION_SUBTRACTION (606) | FRACTION_ADDITION (328) | INTEGERS (250) | DECIMALS (250) | INDEX (250) | FRACTION_REDUCTION (180) | ALGEBRA (270)

## Testing

**From `apps/web/`:**
```bash
npm test                    # All web tests (74 tests, ~3s)
npm run test:integration    # App integration (21 tests)
npm run test:hooks          # React hooks (53 tests)
npm run test:watch          # Watch mode
npm run test:coverage       # Coverage report
```

**From root:**
```bash
npm test                    # PDF generator (32 tests)
npm run test:all            # All unit+web (106 tests)
npm run test:e2e:chromium   # E2E Chromium (47 tests, ~30s)
npm run test:e2e            # E2E all browsers (141 tests)
npx playwright test [file]  # Run single E2E test file
```

**Test Breakdown:**
- PDF Generator: 32 unit tests (markdown, fractions, expressions)
- React Hooks: 53 tests (useCategories, useProblems, useTags)
- App Integration: 21 tests (10 E2E scenarios converted to Jest)
- E2E: 47 Playwright tests (PDF, mobile, race conditions, keyboard, a11y, cross-browser)

**Critical Patterns:** Multi-term algebra (2a+3b+4a) | Mixed numbers (1 5/6) | Column order (1-15 left, 16-30 right)

## Database

```bash
brew services start postgresql@16  # maths_tutor_dev on localhost:5432
npx prisma migrate dev              # Update schema
```

## Status (Phase 10 - VCAA Database Expansion)

**✅ Completed:**
- Web UI: React + Tailwind + Express API + 153 tests
- **Database**: 3078 problems (18 types, VCAA Level 7 aligned)
  - Fractions: 1104 problems (5 types)
  - Algebra: 270 problems (2 types)
  - Integers: 250 problems (4 operations)
  - Decimals: 250 problems (4 operations)
  - Index Notation: 250 problems (powers, square roots, laws)
- Filters: Difficulty (EASY/MEDIUM/HARD) + Tags
- PDF Download (@react-pdf/renderer)

**⏳ Next VCAA Level 7 Topics:**
- Coordinates & Cartesian plane | Ratio & rates | Area | Angles | Probability | Data analysis

## Tech Stack

**Production:** pdfkit | @react-pdf/renderer | PostgreSQL 16 | Prisma 6.19
**Dev:** tsx | jest | @testing-library/react | @playwright/test | @axe-core/playwright

## Architecture

```
apps/web/          # React (Vite + TS + Tailwind)
packages/api/      # Express API
src/               # CLI + PDF generator
prisma/            # DB schema
e2e/               # Playwright tests
```

See `PROJECT-SETUP.md` for details.
