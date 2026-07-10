# Documentation Index

**Central hub for all maths-tutor project documentation.**

---

## 🚀 Getting Started

**New to the project?** Start here:

1. 📖 Read [`../CLAUDE.md`](../CLAUDE.md) - Project overview & quick start
2. ⚙️ Follow [`PROJECT-SETUP.md`](./PROJECT-SETUP.md) - Full environment setup
3. 🧪 Run tests: `npm test` (see [Testing](#testing) below)

---

## 📚 Core Documentation

### Essential Reading

| Document | Purpose | When to Read |
|----------|---------|--------------|
| [`../CLAUDE.md`](../CLAUDE.md) | Project overview, quick start commands | **Start here** - read first |
| [`PROJECT-SETUP.md`](./PROJECT-SETUP.md) | Complete environment setup, database config (macOS) | Setting up dev environment |
| [`WINDOWS-SETUP.md`](./WINDOWS-SETUP.md) | Full Windows 11 setup guide (PostgreSQL, data import, servers) | Setting up on Windows 11 |
| [`PROJECT-HISTORY.md`](./PROJECT-HISTORY.md) | Implementation timeline, migration history | Understanding project evolution |
| [`E2E-TEST-PLAN.md`](./E2E-TEST-PLAN.md) | End-to-end test coverage (38 Chromium tests) | Writing/updating E2E tests |

---

## 🧪 Testing Documentation

### Test Guides (New!)

| Document | Purpose | Audience |
|----------|---------|----------|
| 🔧 [`FIX-FAILING-TESTS.md`](./FIX-FAILING-TESTS.md) | **Quick fix for 4 failing tests** after React Router 7 migration | Fixing broken tests |
| 🧹 [`CLEANUP-UNUSED-CODE.md`](./CLEANUP-UNUSED-CODE.md) | **Recommended cleanup** - Remove unused hooks after migration | Code maintenance |
| 🧪 [`TESTING-IMPLEMENTATION-GUIDE.md`](./TESTING-IMPLEMENTATION-GUIDE.md) | **Step-by-step guide** to test existing components | Writing new tests |
| 🔀 [`REACT-ROUTER-TESTING-GUIDE.md`](./REACT-ROUTER-TESTING-GUIDE.md) | **React Router 7 testing patterns** for routes & navigation | Testing router features |

### Current Test Status

**Total: 144 tests** (32 PDF + 74 Web + 38 E2E)

⚠️ **Action Required:** 4 tests failing due to unused hooks after React Router 7 migration.

**Recommended approach:**
1. 👉 Read [`CLEANUP-UNUSED-CODE.md`](./CLEANUP-UNUSED-CODE.md)
2. Delete unused hooks (`useCategories`, `useProblems`, `useTags`)
3. Remove their failing tests
4. Result: Clean codebase with passing tests ✅

**Alternative:** Fix tests to keep hooks for future use (see [`FIX-FAILING-TESTS.md`](./FIX-FAILING-TESTS.md))

---

## 🏗️ Architecture & Implementation

### React Router 7 Migration & Deployment

| Document | Purpose |
|----------|---------|
| [`REACT-ROUTER-7-TUTORIAL.md`](./REACT-ROUTER-7-TUTORIAL.md) | Complete migration guide (before/after examples) |
| [`RAILWAY-DEPLOYMENT-GUIDE.md`](./RAILWAY-DEPLOYMENT-GUIDE.md) | Deploy full stack to Railway (frontend/backend/DB + [database migrations](./RAILWAY-DEPLOYMENT-GUIDE.md#25-database-schema-migrations-with-prisma)) |
| [`NETLIFY-DEPLOYMENT-GUIDE.md`](./NETLIFY-DEPLOYMENT-GUIDE.md) | Deploy React Router 7 app to Netlify |

**Key Changes:**
- ✅ URL-based routing (`/fractions/addition`)
- ✅ Deep linking support
- ✅ Browser back/forward navigation
- ✅ Filter state in URL query params
- ✅ Dynamic TYPE_MAP generation
- ✅ **NEW:** "Geometric Scholar" UI redesign with sidebar navigation
- ⚠️ Old hooks (`useCategories`, `useProblems`, `useTags`) now unused

---

## 📖 Quick Reference

### Common Commands

```bash
# Development
npm run dev                    # Start React app (localhost:5173)
npm run api:dev                # Start Express API (localhost:3001)

# Testing
npm test                       # All tests (144 total)
npm run test:integration       # Integration tests (21)
npm run test:hooks             # Hook tests (53) ⚠️ 3 failing
npm run test:e2e:chromium      # E2E tests (38)

# Database
brew services start postgresql@16
npx prisma migrate dev

# PDF Generation (CLI)
npm run generate -- --type FRACTION_ADDITION
```

### Project Stats

- **4,628 problems** across 29 types (VCAA Level 7)
- **144 tests** (32 PDF + 74 Web + 38 E2E)
- **React Router 7** for URL-based navigation
- **PostgreSQL 16** database
- **Playwright** for E2E testing
- **"Geometric Scholar" UI** - Modern design with sidebar navigation

---

## 🗂️ Documentation Organization

```
maths-tutor/
├── CLAUDE.md                              # 📌 START HERE - Project overview
├── docs/
│   ├── README.md                          # 📚 This file - Documentation index
│   │
│   ├── Core Documentation/
│   │   ├── PROJECT-SETUP.md               # Setup instructions
│   │   ├── PROJECT-HISTORY.md             # Timeline & migrations
│   │   └── E2E-TEST-PLAN.md               # E2E test coverage
│   │
│   ├── Testing Guides/
│   │   ├── FIX-FAILING-TESTS.md           # 🔧 Quick fix for broken tests
│   │   ├── CLEANUP-UNUSED-CODE.md         # 🧹 Recommended cleanup
│   │   ├── TESTING-IMPLEMENTATION-GUIDE.md # 🧪 Write new component tests
│   │   └── REACT-ROUTER-TESTING-GUIDE.md  # 🔀 Test router features
│   │
│   ├── Implementation Guides/
│   │   ├── REACT-ROUTER-7-TUTORIAL.md     # React Router migration
│   │   ├── RAILWAY-DEPLOYMENT-GUIDE.md    # Railway deployment (SPA mode)
│   │   ├── NETLIFY-DEPLOYMENT-GUIDE.md    # Netlify deployment
│   │   ├── SESSION_HISTORY.md             # Session notes
│   │   └── session-activity-journal.md    # Activity log
│   │
│   └── Archives/
│       └── (moved session history files)
```

---

## 🔍 Finding What You Need

### I want to...

| Goal | Read This |
|------|-----------|
| **Start developing** | [`../CLAUDE.md`](../CLAUDE.md) → [`PROJECT-SETUP.md`](./PROJECT-SETUP.md) |
| **Fix failing tests** | [`FIX-FAILING-TESTS.md`](./FIX-FAILING-TESTS.md) OR [`CLEANUP-UNUSED-CODE.md`](./CLEANUP-UNUSED-CODE.md) |
| **Write new tests** | [`TESTING-IMPLEMENTATION-GUIDE.md`](./TESTING-IMPLEMENTATION-GUIDE.md) |
| **Test React Router** | [`REACT-ROUTER-TESTING-GUIDE.md`](./REACT-ROUTER-TESTING-GUIDE.md) |
| **Understand routing** | [`REACT-ROUTER-7-TUTORIAL.md`](./REACT-ROUTER-7-TUTORIAL.md) |
| **Deploy to Railway** | [`RAILWAY-DEPLOYMENT-GUIDE.md`](./RAILWAY-DEPLOYMENT-GUIDE.md) |
| **Update database schema** | [`RAILWAY-DEPLOYMENT-GUIDE.md#25`](./RAILWAY-DEPLOYMENT-GUIDE.md#25-database-schema-migrations-with-prisma) (Database migrations) |
| **Deploy to Netlify** | [`NETLIFY-DEPLOYMENT-GUIDE.md`](./NETLIFY-DEPLOYMENT-GUIDE.md) |
| **See project history** | [`PROJECT-HISTORY.md`](./PROJECT-HISTORY.md) |
| **Run E2E tests** | [`E2E-TEST-PLAN.md`](./E2E-TEST-PLAN.md) |

---

## ⚠️ Known Issues

### Failing Tests (Action Required)

**Issue:** 4 test files failing after React Router 7 migration
- `useCategories.test.ts` - Hook no longer used
- `useProblems.test.ts` - Hook no longer used
- `useTags.test.ts` - Hook no longer used
- `App.test.tsx` - Component replaced by routes

**Root Cause:** These hooks were replaced by React Router `clientLoader` functions

**Solutions:**
1. **Recommended:** Delete unused hooks and tests (see [`CLEANUP-UNUSED-CODE.md`](./CLEANUP-UNUSED-CODE.md))
2. **Alternative:** Fix tests to keep hooks (see [`FIX-FAILING-TESTS.md`](./FIX-FAILING-TESTS.md))

---

## 🆘 Need Help?

1. **Check existing docs** - Use the table above to find relevant guides
2. **Search this README** - Find what you need quickly
3. **Read CLAUDE.md** - Quick reference for common tasks
4. **Check PROJECT-HISTORY.md** - See how similar issues were solved

---

## 📝 Maintaining Documentation

**When you make changes:**
1. Update [`../CLAUDE.md`](../CLAUDE.md) if it affects quick start or overview
2. Log detailed changes in [`PROJECT-HISTORY.md`](./PROJECT-HISTORY.md)
3. Update this README if new docs are added
4. Keep docs concise - move detailed content to supporting files

**Documentation principles:**
- CLAUDE.md = concise entry point (~300 lines)
- Supporting files = detailed depth
- Always cross-reference between docs
- Use clear, scannable formatting

---

Last updated: 2026-02-05
