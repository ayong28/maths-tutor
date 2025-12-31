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

- **4828 problems** in PostgreSQL (25 types - all VCAA Level 7 topics)
- **Web UI**: React + Tailwind + Express API (localhost:5173 + localhost:3001)
- **Tests**: 153 tests (32 PDF + 74 Web + 47 E2E)

## Testing

```bash
# Web tests (apps/web/)
npm test                    # All web (74 tests)
npm run test:integration    # App integration (21)
npm run test:hooks          # React hooks (53)

# Root tests
npm test                    # PDF generator (32)
npm run test:e2e:chromium   # E2E (47 tests)
```

**Critical Patterns:** Multi-term algebra (2a+3b+4a) | Mixed numbers (1 5/6)

## Database

```bash
brew services start postgresql@16  # maths_tutor_dev on localhost:5432
npx prisma migrate dev              # Update schema
```

## Status

**Phase 10 Complete ✅** - All VCAA Level 7 topics (4828 problems across 25 types)

**Future Enhancements:**
- Try to remove CATEGORY_OVERRIDES (packages/api/src/services/problems.service.ts) by improving auto-derivation logic
- Add more advanced filtering options

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
