# CLAUDE.md

Guidance for Claude Code when working with this repository.

**Full Docs:** `docs/README.md` | `docs/PROJECT-SETUP.md` | `docs/PROJECT-HISTORY.md` | `docs/E2E-TEST-PLAN.md`

**Testing Guides:** `docs/CLEANUP-UNUSED-CODE.md` | `docs/TESTING-IMPLEMENTATION-GUIDE.md` | `docs/REACT-ROUTER-TESTING-GUIDE.md`

**Deployment:** `docs/RAILWAY-DEPLOYMENT-GUIDE.md` (inc. [DB Migrations](docs/RAILWAY-DEPLOYMENT-GUIDE.md#25-database-schema-migrations-with-prisma)) | `docs/NETLIFY-DEPLOYMENT-GUIDE.md`

## Quick Start

```bash
# Testing (144 tests: 32 PDF + 74 Web + 38 E2E) ⚠️ 4 failing - see docs/CLEANUP-UNUSED-CODE.md
npm test                       # All: 32 PDF + 74 Web tests (~3s)
npm run test:integration       # App integration tests (21)
npm run test:hooks             # React hooks tests (53) ⚠️ 3 failing
npm run test:e2e:chromium      # Playwright E2E (38 tests, Chromium only)
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

- **4,628 problems** in PostgreSQL (29 types - all VCAA Level 7 topics)
- **Web UI**: React Router 7 + Tailwind + Express API (localhost:5173 + localhost:3001)
- **Routing**: URL-based (`/fractions/addition`), deep linking, browser nav, filters in URL
- **Tests**: 144 tests (32 PDF + 74 Web + 38 E2E)

## Testing

```bash
# Web tests (apps/web/)
npm test                    # All web (74 tests) ⚠️ 4 failing
npm run test:integration    # App integration (21) ⚠️ 1 failing
npm run test:hooks          # React hooks (53) ⚠️ 3 failing

# Root tests
npm test                    # PDF generator (32)
npm run test:e2e:chromium   # E2E (38 tests)
```

**⚠️ Action Required:** Fix or cleanup failing tests after React Router 7 migration.

**Recommended:** Delete unused hooks → See [`docs/CLEANUP-UNUSED-CODE.md`](docs/CLEANUP-UNUSED-CODE.md)

**Failing Tests (hooks no longer used):**
- `useCategories.test.ts` - Replaced by React Router loaders
- `useProblems.test.ts` - Replaced by React Router loaders
- `useTags.test.ts` - Replaced by React Router loaders
- `App.test.tsx` - Component replaced by route files

**Still Used:**
- ✅ `usePDFGenerator` - Active in worksheet route

**Testing Guides:**
- Quick fix: `docs/FIX-FAILING-TESTS.md` (if keeping hooks)
- Cleanup: `docs/CLEANUP-UNUSED-CODE.md` (recommended)
- New tests: `docs/TESTING-IMPLEMENTATION-GUIDE.md`
- Router tests: `docs/REACT-ROUTER-TESTING-GUIDE.md`

**Critical Patterns:** Multi-term algebra (2a+3b+4a) | Mixed numbers (1 5/6)

## Database

```bash
brew services start postgresql@16  # Start PostgreSQL

# From packages/api folder (recommended)
cd packages/api
npm run db:migrate                  # Create DB + run migrations

# Or from root
npx prisma migrate dev --schema=packages/api/prisma/schema.prisma
```

**Note:** Data (4,628 problems) is already in PostgreSQL. Import scripts exist locally in `packages/api/scripts/data/` but are not tracked in git.

**Full setup guide:** See `docs/PROJECT-SETUP.md` → Database Setup section

## Status

**Phase 10 Complete ✅** - All VCAA Level 7 topics (4,628 problems across 29 types)

**React Router 7 Migration Complete ✅** - URL-based routing with deep linking

**UI Redesign Complete ✅** - "Geometric Scholar" design with sidebar navigation

**Current Tasks:**
- 🔥 **HIGH PRIORITY:** Move PDF generation to backend API (reduce client bundle from 1.5MB to ~300KB)
  - Currently: pdfkit/fontkit/png-js loaded in browser (worksheet chunk = 1.5MB gzipped to 500KB)
  - Target: Create `POST /api/generate-pdf` endpoint in Express API
  - Benefits: ~1.2MB smaller client bundle, faster page loads, better mobile performance
  - Implementation: Move PDF logic from `apps/web/src/hooks/usePDFGenerator.ts` to `packages/api/src/routes/`
- ⚠️ Cleanup unused hooks (`useCategories`, `useProblems`, `useTags`) - See `docs/CLEANUP-UNUSED-CODE.md`
- ✅ E2E tests updated for new UI selectors (38 Chromium tests across 7 files)

**Future Enhancements:**
- Try to remove CATEGORY_OVERRIDES (packages/api/src/services/problems.service.ts) by improving auto-derivation logic
- Add more advanced filtering options

## Tech Stack

**Production:** pdfkit | @react-pdf/renderer | PostgreSQL 16 | Prisma 6.19 | Tailwind CSS 4.1
**Dev:** tsx | jest | @testing-library/react | @playwright/test | @axe-core/playwright
**Design:** Outfit font (headings) | Plus Jakarta Sans (body) | Lucide React icons

## Theme & Config

Theme defined in CSS using Tailwind v4 `@theme` directive (`apps/web/src/index.css`).

```
apps/web/src/config/
├── index.ts       # Barrel export
├── categories.tsx # Category icons & color themes (getCategoryIcon, getCategoryTheme)
└── constants.ts   # UI_CONFIG, DIFFICULTY_LEVELS
```

**Usage:**
- Tailwind classes: `bg-slate-900`, `text-teal-500`, `shadow-lg` (auto-generated from @theme)
- CSS variables: `var(--color-slate-900)`, `var(--font-heading)`
- Category themes: `getCategoryTheme(category)` returns Tailwind class strings

## Architecture

```
apps/web/          # React (Vite + TS + Tailwind)
  src/routes/      # React Router 7 routes (home, category, worksheet)
  src/config/      # Theme config (categories.tsx, constants.ts)
  src/hooks/       # Custom hooks (usePDFGenerator - others unused after migration)
  src/components/  # UI components
  src/__tests__/   # Integration tests
packages/api/      # Express API + Prisma
  prisma/          # DB schema + migrations
  math-data/       # Source JSON files (not tracked - data in PostgreSQL)
  src/db/          # Prisma client singleton (packages/api/src/db/prisma.ts)
  src/services/    # Database business logic
  scripts/data/    # One-time import scripts (not tracked - data in PostgreSQL)
src/               # CLI + PDF generator
e2e/               # Playwright tests (38 E2E tests, Chromium)
docs/              # Documentation (see docs/README.md for index)
generated/         # Prisma client output (not tracked - regenerated locally)
```

**Backend Development:**
- Start API: `cd packages/api && npm run dev` (runs from packages/api folder)
- Or from root: `npm run api:dev`
- Prisma commands: Run from packages/api folder or use `--schema` flag

**Prisma Imports:**
- API: `import { prisma } from '../db/prisma'` (packages/api/src/services/*)
- Client: `import { PrismaClient } from '../../../../generated/prisma'` (packages/api/src/db/prisma.ts)

**Not Tracked in Git:**
- `generated/` - Prisma client (regenerated via `npx prisma generate`)
- `packages/api/math-data/` - Source JSON files (data already in PostgreSQL)
- `packages/api/scripts/data/` - One-time data import scripts (data already in PostgreSQL)

See `docs/PROJECT-SETUP.md` for details.
