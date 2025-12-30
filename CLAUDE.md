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

- **4828 problems** in PostgreSQL (25 types: fractions, algebra, integers, decimals, index notation, coordinates, linear graphs, ratio & rates, area, angles, probability, data analysis)
- **Web UI**: React + Tailwind + Express API
- **CLI tools**: Custom difficulty mix & tag filtering
- **Tests**: 153 tests (32 PDF + 74 Web + 47 E2E)

**Top Types:** FRACTION_SUBTRACTION (606) | FRACTION_ADDITION (328) | ALGEBRA (270) | DATA_ANALYSIS (250) | PROBABILITY (250) | ANGLES (250) | AREA (250) | RATIO_RATES (250) | LINEAR_GRAPHING (250) | COORDINATES (250) | INTEGERS (250) | DECIMALS (250)

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
- **Database**: 4828 problems (25 types, VCAA Level 7 aligned)
  - Fractions: 1104 problems (5 types)
  - Algebra: 270 problems (2 types)
  - Integers: 250 problems (4 operations)
  - Decimals: 250 problems (4 operations)
  - Index Notation: 250 problems (powers, square roots, laws)
  - Coordinates: 250 problems (plotting, quadrants, distance, midpoint)
  - Linear Graphing: 250 problems (gradients, intercepts, equations, real-world)
  - Ratio & Rates: 250 problems (simplifying, dividing quantities, unit rates, best buys)
  - Area: 250 problems (rectangles, squares, triangles, circles, composite shapes, word problems)
  - Angles: 250 problems (complementary, supplementary, triangles, parallel lines, quadrilaterals)
  - Probability: 250 problems (coins, dice, balls, spinners, compound events, with/without replacement)
  - Data Analysis: 250 problems (mean, median, mode, range, comparing statistics, missing values, real-world context)
- Filters: Difficulty (EASY/MEDIUM/HARD) + Tags
- PDF Download (@react-pdf/renderer)

**Phase 10 Complete:** All VCAA Level 7 topics covered

## Tech Stack

**Production:** pdfkit | @react-pdf/renderer | PostgreSQL 16 | Prisma 6.19
**Dev:** tsx | jest | @testing-library/react | @playwright/test | @axe-core/playwright

## Architecture

```
apps/web/          # React (Vite + TS + Tailwind)
packages/api/      # Express API + Prisma client (packages/api/src/db/prisma.ts)
src/               # CLI + PDF generator
prisma/            # DB schema
e2e/               # Playwright tests
generated/         # Prisma client output (root level)
```

**Prisma Imports:**
- API: `import { prisma } from '../db/prisma'` (packages/api/src/services/*)
- Client: `import { PrismaClient } from '../../../../generated/prisma'` (packages/api/src/db/prisma.ts)

See `PROJECT-SETUP.md` for details.
