# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

**Full Documentation:**
- Architecture & Setup: `PROJECT-SETUP.md`
- Session History: `PROJECT-HISTORY.md`

## Quick Start

```bash
# Testing
npm test                    # Unit tests: 32 PDF generator + 53 React hooks
npm run test:e2e:chromium   # E2E tests: 3 homepage tests (Chromium only)
npm run test:e2e            # E2E tests: All browsers

# Web App
npm run dev                 # React frontend (localhost:5173)
npm run api:dev             # Express API backend (localhost:3001)

# Generate Worksheets from Database (Recommended)
npm run generate -- --type FRACTION_ADDITION --output worksheet.pdf
npm run generate -- --type FRACTION_ADDITION -d "easy:10,medium:15,hard:5"
npm run generate -- --type FRACTION_ADDITION --tags unlike-denominators
npm run generate:list       # List available problems
npm run generate:tags -- --type FRACTION_ADDITION

# Legacy: Generate from Markdown
npx tsx generate-worksheet-pdf.ts [worksheet.md] [output.pdf]
```

## Project Overview

Maths tutoring project for generating printable PDF worksheets with fraction and algebra problems.

**Key Features:**
- **1104 problems** in PostgreSQL database (5 types: fraction add/sub/reduce, algebra collecting/multiplication)
- **Web UI**: React + Tailwind frontend with Express API backend
- **CLI tools**: Command-line generation with custom difficulty mix and tag filtering
- **Test suite**: 85 unit tests (Jest) + 3 E2E tests (Playwright)

**Problem Types:**
- `FRACTION_ADDITION` (328 problems, includes 118 mixed numbers)
- `FRACTION_SUBTRACTION` (606 problems, includes 196 mixed numbers)
- `FRACTION_REDUCTION` (180 problems)
- `ALGEBRA_COLLECTING_TERMS` (150 problems)
- `ALGEBRA_MULTIPLICATION` (120 problems)

## Testing

**Unit Tests (Jest):**
```bash
npm test               # Run all unit tests (85 tests)
npm run test:watch     # Watch mode
npm run test:coverage  # Coverage report
```

**E2E Tests (Playwright):**
```bash
# Prerequisites: Start dev servers first
npm run dev            # Terminal 1: React frontend
npm run api:dev        # Terminal 2: Express API

# Run tests
npm run test:e2e:chromium   # Fast: Chromium only (recommended for development)
npm run test:e2e            # Full: All browsers (Chromium, Firefox, WebKit)
npm run test:e2e:ui         # Interactive UI mode
npm run test:e2e:headed     # Watch tests run in browser
npm run test:e2e:report     # View HTML report
```

**Test Coverage:**
- **Unit Tests (85 total):**
  - PDF Generator: 32 tests (markdown parsing, expression rendering, fractions)
  - React Hooks: 53 tests (useCategories, useProblems, useTags)
- **E2E Tests (3 total, Phase 9 in progress):**
  - Homepage: 3 tests (hero section, categories load, no console errors)
  - See `E2E-TEST-PLAN.md` for full test plan (20 scenarios)

**Critical Regression Tests:**
- Multi-term algebraic expressions (e.g., "2a + 3b + 4a")
- Mixed number parsing (e.g., "1 5/6")
- Column ordering (left 1-15, then right 16-30)

## Database Setup

```bash
brew services start postgresql@16
# Database: maths_tutor_dev on localhost:5432
# Schema: npx prisma migrate dev
```

## Current Status (Phase 9 In Progress)

**✅ Implemented:**
- Web UI with React + Tailwind + Express API
- 1104 problems in PostgreSQL with Prisma ORM
- Difficulty filters (EASY/MEDIUM/HARD)
- Tag filters (dynamic based on problem type)
- **PDF Download** - @react-pdf/renderer generates 2-page worksheets
- HeroSection component for enhanced empty state
- **Unit test suite**: 85 Jest tests (PDF generator + React hooks)
- **E2E testing**: Playwright setup with 3 homepage tests passing

**⏳ Phase 9 - In Progress:**
- ✅ E2E test plan created (`E2E-TEST-PLAN.md` - 20 test scenarios)
- ✅ Playwright installed and configured
- ✅ Page Object Model created (`e2e/fixtures/WorksheetPage.ts`)
- ✅ Homepage tests implemented (3/3 passing)
- 📋 Category selection tests (E2E-002, E2E-003)
- 📋 Filtering tests (E2E-004, E2E-005)
- 📋 PDF download test (E2E-007)
- 📋 Mobile responsive testing

**⏳ Next:**
- Phase 9: Complete remaining E2E tests (17 scenarios)
- Phase 10: VCAA Problem Database Expansion (Level 7 topics)

## Dependencies

**Production:**
- `pdfkit` - PDF generation (CLI tools)
- `@react-pdf/renderer` - React-based PDF generation (Web UI)
- PostgreSQL 16 + Prisma 6.19

**Development:**
- `tsx` - TypeScript execution
- `jest` + `ts-jest` - Unit testing framework
- `@testing-library/react` - React testing utilities
- `@playwright/test` - E2E testing framework

## Architecture Quick Reference

**Monorepo Structure:**
```
apps/web/          # React frontend (Vite + TypeScript + Tailwind)
packages/api/      # Express API backend
src/               # CLI tools & PDF generator
prisma/            # Database schema
e2e/               # E2E tests (Playwright)
  tests/           # Test specs
  fixtures/        # Page Object Models
```

See `PROJECT-SETUP.md` for detailed architecture documentation.
