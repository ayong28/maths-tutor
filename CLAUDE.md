# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

**Full Documentation:**
- Architecture & Setup: `PROJECT-SETUP.md`
- Session History: `PROJECT-HISTORY.md`

## Quick Start

```bash
# Testing (CRITICAL: Run before modifying generate-worksheet-pdf.ts)
npm test                    # 32 tests for PDF generator, 53 tests for React hooks

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
- **Jest test suite**: 85 tests total (32 PDF generator + 53 React hooks)

**Problem Types:**
- `FRACTION_ADDITION` (328 problems, includes 118 mixed numbers)
- `FRACTION_SUBTRACTION` (606 problems, includes 196 mixed numbers)
- `FRACTION_REDUCTION` (180 problems)
- `ALGEBRA_COLLECTING_TERMS` (150 problems)
- `ALGEBRA_MULTIPLICATION` (120 problems)

## Testing

**IMPORTANT: Always run tests before modifying PDF generator code!**

```bash
npm test               # Run all tests
npm run test:watch     # Watch mode
npm run test:coverage  # Coverage report
```

**Test Coverage:**
- PDF Generator: 32 tests (markdown parsing, expression rendering, fractions)
- React Hooks: 53 tests (useCategories, useProblems, useTags)

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

## Current Status (Phase 8 Complete)

**✅ Implemented:**
- Web UI with React + Tailwind + Express API
- 1104 problems in PostgreSQL with Prisma ORM
- Difficulty filters (EASY/MEDIUM/HARD)
- Tag filters (dynamic based on problem type)
- **PDF Download** - @react-pdf/renderer generates 2-page worksheets
- HeroSection component for enhanced empty state
- Comprehensive test suite (85 tests)

**⏳ Next:**
- Phase 9: Polish & testing (mobile responsive, component tests, E2E tests)
- Phase 10: VCAA Problem Database Expansion (Level 7 topics)

## Dependencies

**Production:**
- `pdfkit` - PDF generation (CLI tools)
- `@react-pdf/renderer` - React-based PDF generation (Web UI)
- PostgreSQL 16 + Prisma 6.19

**Development:**
- `tsx` - TypeScript execution
- `jest` + `ts-jest` - Testing framework
- `@testing-library/react` - React testing utilities

## Architecture Quick Reference

**Monorepo Structure:**
```
apps/web/          # React frontend (Vite + TypeScript + Tailwind)
packages/api/      # Express API backend
src/               # CLI tools & PDF generator
prisma/            # Database schema
```

See `PROJECT-SETUP.md` for detailed architecture documentation.
