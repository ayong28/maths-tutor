# Deploy Maths Tutor to Railway - Complete Guide

## Overview

Deploy the full stack application to Railway with separate services.

**Stack:**
- **Frontend**: React 19 + Vite (SPA mode) → Railway static hosting
- **Backend**: Express API + Prisma → Railway web service
- **Database**: PostgreSQL → Railway database service

**Architecture:**
- 3 Railway services: Frontend (web), Backend (API), Database (Postgres)
- Frontend outputs to `dist/` (SPA mode, not SSR)
- Backend runs from `packages/api/` (monorepo structure)
- Frontend calls backend via `VITE_API_URL` environment variable

## Quick Reference

**Backend Start Command:**
```bash
npx prisma migrate deploy && npm run start
```

**Backend Environment Variables:**
```
DATABASE_URL=[from Postgres service]
PORT=3001
NODE_ENV=production
FRONTEND_URL=https://your-frontend.up.railway.app  # Required for CORS
```

**Frontend API Client (`apps/web/src/api/client.ts`):**
```typescript
const API_BASE = import.meta.env.VITE_API_URL
  ? `${import.meta.env.VITE_API_URL}/api`
  : '/api';
```

**Frontend Environment Variables:**
```
NODE_ENV=production
VITE_API_URL=https://your-backend.up.railway.app  # No /api suffix - client adds it
```

---

## 1. Database Setup

### Create PostgreSQL Service

1. In Railway Dashboard: **New** → **Database** → **PostgreSQL**
2. Railway automatically creates the database with connection variables
3. Note the service name (e.g., "Postgres")

### Import Data to Railway Database

**Note:** Deploy the backend service first (Step 2) - migrations will create the schema automatically.

```bash
# Link to Railway project
railway link
# Select: Project → Environment → Postgres service

# Get database connection string
railway variables
# Copy the DATABASE_URL value

# Import data using pg_restore (after backend is deployed)
railway run pg_restore --no-owner --no-acl -d $DATABASE_URL database_data.dump
```

**Verify data:**
```bash
railway run psql $DATABASE_URL -c 'SELECT COUNT(*) FROM "Problem";'
# Expected: 4628 problems
```

**Important:** If you get "relation does not exist" errors, ensure the backend service has deployed successfully first. The backend's start command runs migrations that create the database tables.

---

## 2. Backend Deployment (Express API)

### Create Backend Service

1. **New Service** → **GitHub Repo**
2. Connect to your repository

### Configure Backend Service

**Settings → Source:**
- **Root Directory**: `/packages/api`

**Settings → Deploy:**
- **Custom Build Command**: `npm install && npm run build`
- **Custom Start Command**: `npx prisma migrate deploy && npm run start`

**Settings → Environment Variables:**
```
DATABASE_URL=[from Railway Postgres service - use 'railway variables' to get value]
PORT=3001
NODE_ENV=production
FRONTEND_URL=https://your-frontend.up.railway.app
```

**Why include migrations in Start Command:**
- Ensures database schema is up-to-date before app starts
- Automatically runs migrations on every deployment
- Avoids manual migration steps
- Works with Railway's internal DATABASE_URL automatically

**How to get environment variable values:**

1. **DATABASE_URL:**
```bash
# In terminal, link Railway CLI to Postgres service
railway link
# Select: Project → production → Postgres

# Get the DATABASE_URL
railway variables | grep DATABASE_URL
# Copy the full connection string
```

2. **FRONTEND_URL:**
   - Go to Railway Dashboard → Frontend service → Settings → Networking
   - Copy the generated domain (e.g., `https://frontend-production-0cb6.up.railway.app`)
   - Add to backend environment variables as `FRONTEND_URL`
   - **Purpose:** Required for CORS - allows backend to accept requests from frontend domain

### Deploy Backend

1. Save settings
2. Railway auto-deploys on push to main branch
3. Check deployment logs:
   - Look for migration success: `Prisma Migrate applied...`
   - Verify API starts: `Server listening on port 3001`
4. Database schema is now ready for data import

---

## 2.5 Database Schema Migrations with Prisma

### Overview

Railway automatically runs Prisma migrations on every deployment via the start command:

```bash
npx prisma migrate deploy && npm run start
```

This ensures your Railway database schema stays in sync with your application code. Migrations are applied before the API server starts, preventing schema mismatches.

**How it works:**
- You create migrations locally and test them
- Commit migration files to git
- Push to GitHub triggers Railway deployment
- Railway runs `npx prisma migrate deploy` automatically
- All pending migrations apply to Railway database
- API server starts with updated schema

---

### Standard Migration Workflow

#### Step 1: Create Migration Locally

When you need to change the database schema:

```bash
# Navigate to API folder
cd packages/api

# Edit schema with your changes
# Edit: prisma/schema.prisma

# Create migration with descriptive name
npm run db:migrate
# Or: npx prisma migrate dev --name add_user_preferences

# Prisma prompts:
# - Name for migration (use snake_case: add_user_table, not addUserTable)
# - Apply migration to local database? → Yes
```

**What happens:**
- Creates migration file in `packages/api/prisma/migrations/[timestamp]_[name]/migration.sql`
- Applies migration to your local `maths_tutor_dev` database
- Regenerates Prisma Client in `generated/prisma/`
- Updates `_prisma_migrations` tracking table

**Example Migration Structure:**
```
packages/api/prisma/migrations/
└── 20260113120000_add_user_preferences/
    └── migration.sql
```

#### Step 2: Test Migration Locally

**Critical:** Always verify migrations work locally before deploying to Railway.

**Test Checklist:**

```bash
# ✅ 1. Verify schema changes applied
psql -d maths_tutor_dev -c "\d+ Problem"
# Check that columns/tables exist as expected

# ✅ 2. Test data integrity
psql -d maths_tutor_dev -c "SELECT COUNT(*) FROM \"Problem\";"
# Expected: 4628 problems (or your current count)

# ✅ 3. Test API with new schema
npm run api:dev
# Visit http://localhost:3001/health
# Test http://localhost:3001/api/categories

# ✅ 4. Test existing data queries
psql -d maths_tutor_dev -c "SELECT type, COUNT(*) FROM \"Problem\" GROUP BY type LIMIT 5;"
# Ensure existing queries still work

# ✅ 5. Test full reset (optional but recommended)
npx prisma migrate reset
npm run db:migrate
npm run data:import-json
npm run data:import-markdown
# Verify full database rebuild works
```

**Common Test Scenarios:**

| Change Type | Test Required |
|-------------|---------------|
| Add column | Verify default values, check existing rows populated correctly |
| Remove column | Ensure no API code references removed column (use grep) |
| Rename column | Update all API code, search codebase for old column name |
| Add table | Test relationships, foreign keys work, API can query |
| Add index | Verify query performance improves (use EXPLAIN ANALYZE) |
| Change enum | Ensure existing data uses valid enum values |
| Add constraint | Verify existing data doesn't violate constraint |

#### Step 3: Commit Migration Files

**Important:** Migration files MUST be committed to git - Railway needs them to deploy.

```bash
# Check git status
git status

# You should see:
# Modified:   packages/api/prisma/schema.prisma
# New files:  packages/api/prisma/migrations/[timestamp]_[name]/migration.sql
# DO NOT commit: generated/prisma/ (already in .gitignore)

# Stage migration files
git add packages/api/prisma/

# Commit with descriptive message
git commit -m "Add user preferences table

- Added UserPreferences model with theme, notifications
- Added userId foreign key reference
- Migration: 20260113120000_add_user_preferences

Tested locally:
- Schema changes verified
- Existing 4628 problems intact
- API endpoints functional
- Full reset cycle successful"

# DO NOT push yet - verify commit first
```

**Commit Message Best Practices:**
- **First line:** Brief summary (50 chars max, imperative mood)
- **Blank line**
- **Body:** Detailed bullet points of changes
- **Migration name:** For easy reference in logs
- **Test summary:** Confirms local testing completed

**Example Bad Commit:**
```
updated database
```

**Example Good Commit:**
```
Add user preferences table for theme/notification settings

- Added UserPreferences model with theme, notifications, language
- Added userId foreign key with cascade delete
- Added unique constraint on userId
- Migration: 20260113120000_add_user_preferences

Tested locally:
- Schema applied successfully
- Data integrity verified (4628 problems)
- API /user/preferences endpoints working
- Full database reset cycle successful
```

#### Step 4: Push to GitHub (Triggers Railway Deployment)

```bash
# Final check before pushing
git log -1 --stat
# Review your commit includes migration files

# Verify migration files are included
git show --name-only
# Should show: packages/api/prisma/migrations/...

# Push to trigger Railway deployment
git push origin main
```

**What happens automatically:**
1. **GitHub** receives push on main branch
2. **Railway** detects commit, starts deployment:
   - Pulls latest code from GitHub
   - Runs build command: `npm install && npm run build`
   - Runs start command: `npx prisma migrate deploy && npm run start`
3. **Prisma** checks migration history, applies new migrations:
   - Reads `packages/api/prisma/migrations/` folder
   - Compares with `_prisma_migrations` table in Railway database
   - Applies pending migrations in chronological order
4. **API server** starts with updated schema

**Typical deployment time:** 2-3 minutes (build + migrations + startup)

#### Step 5: Verify Migration on Railway

**Critical:** Always verify migrations succeeded on Railway.

**Verification Steps:**

**1. Check Deployment Logs**

Go to: Railway Dashboard → Backend Service → Deployments → Latest

Look for these success indicators:

```
[build] ✓ Generated Prisma Client (v6.19.0)
[build] ✓ Built in 1.5s

[start] Applying migration `20260113120000_add_user_preferences`
[start] The following migration(s) have been applied:
[start]
[start] migrations/
[start]   └─ 20260113120000_add_user_preferences/
[start]      └─ migration.sql
[start]
[start] Prisma Migrate applied 1 migration(s) in 234ms
[start]
[start] API server running on http://localhost:3001
[start] Environment: production
[start] Server listening on port 3001
```

**2. Test API Endpoints**

```bash
# Test health endpoint
curl https://your-backend.up.railway.app/health
# Expected: {"status":"ok","timestamp":"2026-01-13T12:00:00.000Z"}

# Test categories endpoint
curl https://your-backend.up.railway.app/api/categories
# Expected: JSON array of categories

# Test specific endpoints using new schema
curl https://your-backend.up.railway.app/api/user/preferences
# Should work with new table
```

**3. Connect to Railway Database (Optional)**

```bash
# Link to Railway project
railway link
# Select: Project → production → Postgres

# Check data count
railway run psql $DATABASE_URL -c "SELECT COUNT(*) FROM \"Problem\";"
# Expected: 4628

# Verify new schema
railway run psql $DATABASE_URL -c "\d+ UserPreferences"
# Should show new table structure

# Check migration history
railway run npx prisma migrate status
# Should show all migrations applied
```

**Expected Output:**
```
Environment variables loaded from Railway
Prisma schema loaded from prisma/schema.prisma

Status
1 migration found in prisma/migrations

Following migration(s) have been applied:

migrations/
  └─ 20260113120000_add_user_preferences/ ✓

No pending migrations to apply.
```

---

### Safety Checklist Before Deploying Migrations

Use this checklist EVERY time before pushing schema changes:

#### Pre-Deployment Checklist

- [ ] Edited `packages/api/prisma/schema.prisma` with desired changes
- [ ] Created migration with descriptive name: `npm run db:migrate`
- [ ] Migration applied successfully to local database (no errors)
- [ ] Prisma Client regenerated without errors
- [ ] Local API server starts without errors: `npm run api:dev`
- [ ] Tested API endpoints with new schema (all working)
- [ ] Verified data integrity locally (counts match, no corruption)
- [ ] Searched codebase for references to removed/renamed columns: `grep -r "oldColumnName" packages/api/src/`
- [ ] Tested full database reset cycle (optional): `npx prisma migrate reset`
- [ ] Migration files committed to git: `git status` shows migrations staged
- [ ] Reviewed commit: `git show` includes all migration files
- [ ] Commit message describes changes and includes test summary

#### Post-Deployment Checklist

- [ ] Railway deployment succeeded (green checkmark in dashboard)
- [ ] Railway logs show "Prisma Migrate applied X migration(s)"
- [ ] Railway logs show "Server listening on port 3001"
- [ ] Tested `/health` endpoint: returns 200 status
- [ ] Tested API endpoints with new schema (all working in production)
- [ ] Verified data count unchanged: 4628 problems (if not adding/removing data)
- [ ] Frontend still works with new backend schema
- [ ] No error alerts from monitoring/logging (if configured)

---

### Common Migration Scenarios

#### Scenario 1: Adding a New Column

**Example:** Add `createdBy` field to Problem table

**Schema Change:**
```prisma
// packages/api/prisma/schema.prisma
model Problem {
  id          String   @id @default(cuid())
  createdAt   DateTime @default(now())
  question    String
  answer      String
  // ... existing fields ...
  createdBy   String?  @default("system") // ✅ Add default for existing rows
}
```

**Safety Considerations:**
- Use nullable (`?`) OR provide `@default()` for existing rows
- Without nullable/default, migration fails if rows exist
- Test with existing 4628 problems locally

**Local Test:**
```bash
npm run db:migrate

# Verify default value applied to existing rows
psql -d maths_tutor_dev -c "SELECT id, createdBy FROM \"Problem\" LIMIT 5;"
# Expected: All rows have createdBy = 'system'

# Test API
curl http://localhost:3001/api/problems?type=FRACTION_ADDITION | jq '.[0].createdBy'
# Expected: "system"
```

**Generated Migration (example):**
```sql
-- AlterTable
ALTER TABLE "Problem" ADD COLUMN "createdBy" TEXT DEFAULT 'system';
```

#### Scenario 2: Removing a Column

**Example:** Remove deprecated `category` field

**Before Migration - Critical Step:**
```bash
# ⚠️ Search for references in codebase FIRST
cd /Users/adrian/workspace/2026-projects/maths-tutor-2
grep -r "category" packages/api/src/

# Update or remove any code using 'category' field
# Check: API routes, services, types, tests
```

**Schema Change:**
```prisma
model Problem {
  id        String   @id @default(cuid())
  // category String // ❌ Remove this line
  type      String   // ✅ Use this instead
  // ... other fields ...
}
```

**Safety Steps:**
1. **First deployment:** Mark column as deprecated in code, don't remove from schema
2. **Wait period:** Monitor for any remaining usage
3. **Second deployment:** Remove from schema

**Alternative (safer for production):**
```prisma
model Problem {
  category String? // Make nullable first
  // Later: remove entirely
}
```

**Local Test:**
```bash
# After removing column
npm run db:migrate

# Verify API doesn't break
npm run api:dev
curl http://localhost:3001/api/categories
# Should work without 'category' field
```

#### Scenario 3: Renaming a Column

**⚠️ High Risk:** Requires careful multi-step coordination.

**Recommended Approach (Multi-Step, Zero Downtime):**

**Step 1: Add new column (no downtime)**
```prisma
model Problem {
  oldName String? // Keep temporarily
  newName String? @default("")
}
```

Deploy, verify working.

**Step 2: Migrate data**
```sql
-- Run via migration or Railway console
UPDATE "Problem" SET "newName" = "oldName" WHERE "newName" IS NULL;
```

**Step 3: Update all code to use new column**
```typescript
// Update all API code
const problem = await prisma.problem.findMany({
  select: {
    newName: true, // Instead of oldName
  }
});
```

Deploy, verify working.

**Step 4: Remove old column (after verification)**
```prisma
model Problem {
  newName String // oldName removed
}
```

**Alternative (Simpler but risky):** Use Prisma's `@map()`
```prisma
model Problem {
  newName String @map("old_name") // Database column stays "old_name"
}
```

**Pros:** Code uses `newName`, database keeps old column
**Cons:** Code/database mismatch can be confusing

#### Scenario 4: Adding a New Problem Type (Common)

**Example:** Add `ALGEBRA_QUADRATICS` type

**Schema Change:**
```prisma
enum ProblemType {
  // ... existing 29 types ...
  FRACTION_ADDITION
  FRACTION_SUBTRACTION
  // ... more ...
  ALGEBRA_QUADRATICS // ✅ Add new enum value
}
```

**Local Test:**
```bash
npm run db:migrate

# Test adding problem with new type
psql -d maths_tutor_dev << EOF
INSERT INTO "Problem" (id, question, answer, type, difficulty, tags, "sourceWorksheet", "sourceProblemNumber", "hasVariables", "createdAt", "updatedAt")
VALUES (
  gen_random_uuid()::text,
  'Solve: x^2 + 5x + 6 = 0',
  'x = -2 or x = -3',
  'ALGEBRA_QUADRATICS',
  'medium',
  ARRAY['factoring', 'quadratic-formula'],
  'test_worksheet',
  1,
  true,
  NOW(),
  NOW()
);
EOF

# Verify API returns new type
curl http://localhost:3001/api/problems?type=ALGEBRA_QUADRATICS
```

**Important:** Update frontend TypeScript types too:
```typescript
// apps/web/src/api/types.ts
export type ProblemType =
  | 'FRACTION_ADDITION'
  | 'FRACTION_SUBTRACTION'
  // ... existing types
  | 'ALGEBRA_QUADRATICS'; // ✅ Add here too
```

**Deployment Notes:**
- Frontend and backend can deploy separately
- Old frontend works with new backend (ignores new type)
- Update frontend after backend is stable

#### Scenario 5: Adding an Index (Performance)

**Example:** Add composite index for tag-based queries

**Schema Change:**
```prisma
model Problem {
  // ... fields ...
  type String
  tags String[]

  @@index([tags], type: Gin) // ✅ Already exists for array
  @@index([type, tags])      // Add composite index for combined queries
}
```

**Performance Testing:**
```bash
npm run db:migrate

# Test query performance BEFORE migration
psql -d maths_tutor_dev -c "
EXPLAIN ANALYZE
SELECT * FROM \"Problem\"
WHERE type = 'FRACTION_ADDITION'
  AND 'unlike-denominators' = ANY(tags);
"
# Note execution time (e.g., 45ms)

# Apply migration with index

# Test query performance AFTER migration
psql -d maths_tutor_dev -c "
EXPLAIN ANALYZE
SELECT * FROM \"Problem\"
WHERE type = 'FRACTION_ADDITION'
  AND 'unlike-denominators' = ANY(tags);
"
# Should be faster (e.g., 8ms)
```

**Generated Migration:**
```sql
-- CreateIndex
CREATE INDEX "Problem_type_tags_idx" ON "Problem"("type", "tags");
```

**Production Considerations:**
- Index creation can take time on large tables (Railway has 4628 rows - should be fast)
- PostgreSQL creates indexes without blocking reads
- Monitor Railway deployment logs for index creation time

---

### Troubleshooting Migration Issues

#### Issue 1: Migration Fails on Railway

**Symptoms:**
- Railway deployment shows "Migration failed"
- Error: `Unique constraint violation`
- Error: `Column "columnName" does not exist`
- Deployment status: Failed (red X)

**Common Causes:**
- Added unique constraint but existing data has duplicates
- Removed column but Railway database schema ahead/behind local
- Migration already partially applied

**Solution:**

```bash
# 1. Check exact error in Railway logs
# Railway Dashboard → Backend Service → Deployments → View Logs
# Look for Prisma error message

# 2. Connect to Railway database to check state
railway link
railway run psql $DATABASE_URL

# Check current schema
\d+ Problem

# Check migration history
railway run npx prisma migrate status

# 3. Fix locally based on error
cd packages/api

# Rollback if needed
npx prisma migrate reset

# Fix schema.prisma
# Create new migration
npm run db:migrate

# Test thoroughly
psql -d maths_tutor_dev -c "SELECT COUNT(*) FROM \"Problem\";"

# 4. Commit fix and re-push
git add packages/api/prisma/
git commit -m "Fix migration: resolve constraint violation"
git push origin main
```

#### Issue 2: Migration Applied but API Crashes

**Symptoms:**
- Prisma migration succeeds in logs
- API server crashes on startup
- Error: `Invalid Prisma schema`
- Error: `Cannot find module '@prisma/client'`

**Causes:**
- Prisma Client not regenerated during build
- Type mismatches between schema and API code
- Build script missing `db:generate`

**Solution:**

```bash
# Verify package.json build script
cat packages/api/package.json | grep "build"
# Should be: "build": "npm run db:generate && tsc"

# If missing, add db:generate
# Edit packages/api/package.json:
"build": "npm run db:generate && tsc"

# Commit and push
git add packages/api/package.json
git commit -m "Fix build: add Prisma client generation"
git push origin main

# Or force redeploy without changes
git commit --allow-empty -m "Trigger Railway rebuild with Prisma client"
git push origin main
```

**Check Railway build logs for:**
```
[build] > api@1.0.0 build
[build] > npm run db:generate && tsc
[build]
[build] > api@1.0.0 db:generate
[build] > prisma generate
[build]
[build] ✔ Generated Prisma Client (v6.19.0)
```

#### Issue 3: Railway Database Out of Sync

**Symptoms:**
- Error: `Migration "20260113120000_name" already applied`
- Error: `Migration history mismatch`
- Local works but Railway fails

**Causes:**
- Manually ran migrations in Railway console
- Migration was applied but not recorded in `_prisma_migrations`
- Git history issues (rebased, force pushed)

**Solution:**

```bash
# 1. Check migration status on Railway
railway run npx prisma migrate status

# Output shows:
# Following migration(s) have NOT been applied:
# 20260113120000_add_user_preferences

# But schema changes ARE present (manually applied)

# 2. Mark migration as applied without running it
railway run npx prisma migrate resolve --applied 20260113120000_add_user_preferences

# 3. Verify status
railway run npx prisma migrate status
# Should show: No pending migrations
```

**Nuclear option (⚠️ destructive - data loss):**
```bash
# Only if you can re-import all data
railway run npx prisma migrate reset --force

# Then re-import data
cd packages/api
npm run data:import-json
npm run data:import-markdown
```

#### Issue 4: Cannot Roll Back Migration

**Symptoms:**
- Need to undo recent migration
- Migration already applied to Railway
- Data may be affected

**Solution Option 1: Create Revert Migration (Recommended)**

```bash
# Edit schema.prisma to reverse changes
# Remove added columns, restore removed columns, etc.

# Create new "revert" migration
npm run db:migrate -- --name revert_user_preferences

# Test locally
psql -d maths_tutor_dev -c "\d+ Problem"

# Commit and push
git add packages/api/prisma/
git commit -m "Revert user preferences migration

Reverted changes from 20260113120000_add_user_preferences
- Removed UserPreferences table
- Removed userId foreign key from Problem"

git push origin main
```

**Solution Option 2: Manual Rollback (Last Resort)**

```bash
# Connect to Railway database
railway run psql $DATABASE_URL

# Manually reverse SQL commands
# If migration added column:
ALTER TABLE "Problem" DROP COLUMN "createdBy";

# If migration added table:
DROP TABLE "UserPreferences";

# Update migration history
railway run npx prisma migrate resolve --rolled-back 20260113120000_add_user_preferences

# ⚠️ Warning: This creates schema/migration mismatch
# You MUST also revert the code and schema.prisma locally
```

#### Issue 5: Data Loss After Migration

**Symptoms:**
- Data missing after migration deployed
- Row counts don't match
- Relations broken

**Prevention (Always do this before major migrations):**

```bash
# Backup Railway database BEFORE pushing migration
railway link
railway run pg_dump $DATABASE_URL > backup_$(date +%Y%m%d_%H%M%S).sql

# Example: backup_20260113_120530.sql

# Store backup securely
mkdir -p ~/backups/maths-tutor
mv backup_*.sql ~/backups/maths-tutor/
```

**Recovery:**

```bash
# 1. Get backup file
ls ~/backups/maths-tutor/

# 2. Restore to Railway database
railway run pg_restore --clean --no-owner --no-acl -d $DATABASE_URL backup_20260113_120530.sql

# 3. Verify data restored
railway run psql $DATABASE_URL -c "SELECT COUNT(*) FROM \"Problem\";"
# Expected: 4628

# 4. Restart Railway backend service
# Railway Dashboard → Backend Service → Settings → Restart
```

---

### Emergency Procedures

#### Emergency: Migration Broke Production

**Immediate Actions (5 minutes):**

1. **Roll back Railway to previous deployment**
   - Railway Dashboard → Backend Service → Deployments
   - Find last successful deployment (before migration)
   - Click three dots (⋮) → "Redeploy"
   - Confirm - uses old code without broken migration
   - Verify site works: test API endpoints

2. **Notify team** (if applicable)
   - Post in team chat: "Rolled back backend to previous deployment"
   - Explain issue briefly
   - Set status: investigating

**Fix Locally (30 minutes):**

```bash
# Option A: Revert the commit
git log -5 --oneline
git revert <commit-hash-of-broken-migration>
git push origin main

# Option B: Fix the migration
cd packages/api
# Edit schema.prisma to fix issue
npm run db:migrate -- --name fix_broken_migration
# Test thoroughly
npm run db:reset
npm run db:migrate
npm run data:import-json
npm test
```

**Redeploy Fix:**

```bash
# Commit fix
git add packages/api/prisma/
git commit -m "Fix broken migration: [describe fix]

Root cause: [explain what went wrong]
Fix: [explain solution]
Tested: [summarize local testing]"

git push origin main

# Monitor Railway deployment closely
# Railway Dashboard → Backend Service → Deployments → Latest
# Watch logs for:
# - Migration success
# - Server startup
# - No errors
```

**Verify Fix:**

```bash
# Test all endpoints
curl https://your-backend.up.railway.app/health
curl https://your-backend.up.railway.app/api/categories
curl https://your-backend.up.railway.app/api/problems?type=FRACTION_ADDITION

# Verify data integrity
railway run psql $DATABASE_URL -c "SELECT COUNT(*) FROM \"Problem\";"
# Expected: 4628
```

#### Emergency: Database Corrupted

**Symptoms:**
- Data missing or incorrect
- Foreign key violations
- Constraints broken
- Data types wrong

**Immediate Actions:**

1. **Stop Railway backend service**
   - Railway Dashboard → Backend Service → Settings
   - Click "Pause" or scale to 0 replicas
   - Prevents further writes to corrupt database

2. **Assess damage**
```bash
railway run psql $DATABASE_URL << EOF
-- Check row counts
SELECT 'Problem' AS table_name, COUNT(*) FROM "Problem"
UNION ALL
SELECT 'WorksheetTemplate', COUNT(*) FROM "WorksheetTemplate";

-- Check for orphaned relations
SELECT p.id FROM "Problem" p
LEFT JOIN "WorksheetProblem" wp ON p.id = wp."problemId"
WHERE wp.id IS NULL;
EOF
```

3. **Restore from backup**
```bash
# Get most recent backup
ls -lt ~/backups/maths-tutor/ | head -3

# Test restore locally first (if time permits)
createdb maths_tutor_restore_test
pg_restore -d maths_tutor_restore_test backup_20260113_120530.sql
psql -d maths_tutor_restore_test -c "SELECT COUNT(*) FROM \"Problem\";"

# If local restore looks good, restore to Railway
railway run pg_restore --clean --no-owner --no-acl -d $DATABASE_URL backup_20260113_120530.sql

# Verify
railway run psql $DATABASE_URL -c "SELECT COUNT(*) FROM \"Problem\";"
# Expected: 4628
```

4. **Restart Railway backend**
   - Railway Dashboard → Backend Service → Settings
   - Click "Resume" or scale back up
   - Monitor logs for clean startup

---

### Migration Best Practices

#### Development Workflow Checklist

- ✅ **Always test locally first** - Never push untested migrations
- ✅ **Create descriptive migration names** - Use snake_case: `add_user_table`, not `migration1`
- ✅ **Commit migrations immediately** - Don't let uncommitted migrations linger
- ✅ **Never edit migration files manually** - Create new migrations instead
- ✅ **Use nullable fields or defaults** - When adding columns to populated tables
- ✅ **Test API endpoints after changes** - Verify app works with new schema
- ✅ **Verify data integrity** - Check row counts, run test queries
- ✅ **Search before removing columns** - Use `grep -r "columnName"` to find all references

#### Deployment Workflow Checklist

- ✅ **Review migration in commit** - Check `git show` before pushing
- ✅ **Push during low-traffic periods** - Minimize user impact
- ✅ **Monitor Railway deployment logs** - Watch for migration success
- ✅ **Test production immediately** - Don't wait to verify deployment
- ✅ **Keep backups** - Run `pg_dump` before major schema changes
- ✅ **Have rollback plan ready** - Know how to revert if needed
- ✅ **Document breaking changes** - Note in commit message and team chat

#### Team Coordination Checklist

- ✅ **Communicate schema changes** - Notify team before pushing
- ✅ **Update frontend types** - Sync TypeScript types when adding enums
- ✅ **Document breaking changes** - Note incompatibilities in commit
- ✅ **Consider backward compatibility** - Allow gradual rollout when possible
- ✅ **Coordinate deploy timing** - Avoid conflicting deployments
- ✅ **Review each other's migrations** - Peer review before merge

---

### Reference

**Quick Command Reference:**

| Task | Command | Location |
|------|---------|----------|
| Create migration | `npm run db:migrate` | `packages/api/` |
| Apply migrations (prod-like) | `npm run db:migrate:deploy` | `packages/api/` |
| Check migration status | `npx prisma migrate status` | `packages/api/` |
| Reset database | `npm run db:reset` | `packages/api/` |
| Generate Prisma Client | `npm run db:generate` | `packages/api/` |
| Open Prisma Studio | `npm run db:studio` | `packages/api/` |
| Check Railway migrations | `railway run npx prisma migrate status` | Any |
| Backup Railway DB | `railway run pg_dump $DATABASE_URL > backup.sql` | Any |
| Restore Railway DB | `railway run pg_restore -d $DATABASE_URL backup.sql` | Any |
| Connect to Railway DB | `railway run psql $DATABASE_URL` | Any |

**Related Documentation:**
- **Prisma Migrate:** https://www.prisma.io/docs/concepts/components/prisma-migrate
- **Railway PostgreSQL:** https://docs.railway.app/databases/postgresql
- **Local Setup:** [`PROJECT-SETUP.md`](./PROJECT-SETUP.md) → Database Setup
- **Railway Deployment:** This guide, Section 2 (Backend Deployment)
- **Prisma Schema:** https://www.prisma.io/docs/concepts/components/prisma-schema

**Last Updated:** 2026-01-13

---

## 3. Frontend Deployment (React SPA)

### Configure API Client for Production

The frontend needs to call the backend API. Update the API client to use environment variables:

**File: `apps/web/src/api/client.ts`**
```typescript
const API_BASE = import.meta.env.VITE_API_URL
  ? `${import.meta.env.VITE_API_URL}/api`
  : '/api';
```

This allows the frontend to:
- Use `/api` in development (Vite proxy forwards to localhost:3001)
- Use backend Railway URL in production (via VITE_API_URL environment variable)

### Create Frontend Service

1. **New Service** → **GitHub Repo**
2. Connect to your repository

### Configure Frontend Service

**Settings → Source:**
- **Root Directory**: `/` (monorepo root - or `/apps/web` if preferred)

**Settings → Deploy:**
- **Build Command**: `npm run build` (auto-detected from package.json)
- **Custom Start Command**: `npx serve dist -s -p $PORT`

**Settings → Environment Variables:**
```
NODE_ENV=production
VITE_API_URL=https://your-backend-service.up.railway.app
```

**How to get backend URL:**
1. Go to Railway Dashboard → Backend service → Settings → Networking
2. Copy the generated domain (e.g., `https://maths-tutor-api-production.up.railway.app`)
3. Add to frontend environment variables as `VITE_API_URL` (without `/api` suffix)

**Important:**
- Do NOT include `/api` in VITE_API_URL - the client code adds it automatically
- Do NOT manually set `PORT` - Railway provides it automatically

### Common Issue: `/app/build/client` not found

**Error:**
```
copy /app/build/client
ERROR: failed to build: "/app/build/client": not found
```

**Root Cause:**
- Railway auto-detects React Router 7 and expects **SSR mode** output (`build/client`)
- This app uses **SPA mode** with Vite which outputs to `dist/`

**Solution:**
- Use Custom Start Command: `npx serve dist -s -p $PORT` (see above)

### Generate Public Domain

1. Settings → **Networking** → **Generate Domain**
2. When prompted for port: **Use 8080**
3. Railway generates a public URL (e.g., `your-app.up.railway.app`)

**Port Explanation:**
- Railway asks which internal port to expose publicly
- Port 8080 is standard for web services
- Your app runs on `$PORT` (set by Railway), traffic routes to 8080

---

## 4. Deployment Checklist

### Database
- [ ] Create PostgreSQL service
- [ ] Note DATABASE_URL from service

### Backend
- [ ] Create backend service from GitHub
- [ ] Set Root Directory: `/packages/api`
- [ ] Set Build Command: `npm install && npm run build`
- [ ] Set Start Command: `npx prisma migrate deploy && npm run start`
- [ ] Add environment variables:
  - [ ] `DATABASE_URL` (from Postgres service)
  - [ ] `PORT=3001`
  - [ ] `NODE_ENV=production`
  - [ ] `FRONTEND_URL` (from frontend service domain - needed for CORS)
- [ ] Deploy and verify logs show:
  - [ ] `Prisma Migrate applied...` (migrations ran)
  - [ ] `Server listening on port 3001` (API started)
- [ ] Generate domain if needed

### Database Import (after backend deployed)
- [ ] Link Railway CLI to Postgres service
- [ ] Import data: `railway run pg_restore --no-owner --no-acl -d $DATABASE_URL database_data.dump`
- [ ] Verify data count: 4628 problems

### Frontend
- [ ] Update `apps/web/src/api/client.ts` to use VITE_API_URL
- [ ] Create frontend service from GitHub
- [ ] Set Custom Start Command: `npx serve dist -s -p $PORT`
- [ ] Get backend URL from backend service (Settings → Networking)
- [ ] Add environment variables:
  - [ ] `NODE_ENV=production`
  - [ ] `VITE_API_URL=https://your-backend.up.railway.app` (no `/api` suffix)
- [ ] Generate domain with port 8080
- [ ] Deploy and verify build succeeds
- [ ] Test generated domain URL - should load app without JSON errors

---

## 5. Troubleshooting

### Frontend Issues

**Error: "Unexpected token '<', "<!doctype "... is not valid JSON":**
- **Most common cause:** Frontend trying to fetch API but getting HTML instead
- Check `VITE_API_URL` environment variable is set correctly
- Verify `VITE_API_URL` points to backend Railway URL (without `/api` suffix)
- Ensure backend service is deployed and running
- Check `apps/web/src/api/client.ts` uses `import.meta.env.VITE_API_URL`
- Test backend URL directly: `https://your-backend.up.railway.app/api/categories`

**Build fails with `/app/build/client` not found:**
- Verify build outputs to `dist/` not `build/client`
- Check Custom Start Command uses `dist/`: `npx serve dist -s -p $PORT`

**Domain not accessible:**
- Verify port is set to 8080 in Networking settings
- Check Railway deployment logs for errors
- Ensure build succeeded (check build logs)

**Environment variables not working:**
- Railway auto-provides `$PORT` - don't manually set it for frontend
- Check variable names match exactly (case-sensitive)
- Vite environment variables must start with `VITE_` prefix
- Rebuild required after adding/changing environment variables

### Backend Issues

**Error: Cannot find module '/app/index.js':**
- Verify Root Directory is set to `/packages/api`
- Check Build Command includes: `npm install && npm run build`
- Ensure Start Command is: `npm run start` (not `npm start`)
- Verify `dist/index.js` exists after build

**CORS errors (blocked by CORS policy):**
- **Most common cause:** Backend not configured to allow frontend origin
- Add `FRONTEND_URL` environment variable to backend service
- Set to frontend Railway domain: `https://frontend-production-0cb6.up.railway.app`
- Backend CORS is configured in `packages/api/src/index.ts`:
  ```typescript
  app.use(cors({
    origin: process.env.FRONTEND_URL || 'http://localhost:5173',
    credentials: true,
  }));
  ```
- Redeploy backend after adding environment variable
- Check browser console for specific CORS error message
- Typical error: "Access to fetch at '...' from origin '...' has been blocked by CORS policy"

**Database connection fails:**
- Verify DATABASE_URL is copied correctly from Railway Postgres service
- Use `railway variables` command to get exact value
- Ensure DATABASE_URL includes all connection parameters
- Check Postgres service is running

**Build fails with Prisma errors:**
- Ensure Build Command includes Prisma generate: `npm install && npm run build`
- Check `package.json` has `db:generate` in build script
- Verify Prisma schema exists at `prisma/schema.prisma`

**Migration fails on startup:**
- Check Start Command: `npx prisma migrate deploy && npm run start`
- Verify DATABASE_URL environment variable is set correctly
- Check deployment logs for Prisma migration errors
- Ensure DATABASE_URL points to Railway Postgres (not `postgres.railway.internal` from local .env)

**API not responding:**
- Check deployment logs for startup errors
- Verify migrations completed before server started (check logs)
- Ensure PORT environment variable is set (3001)
- Ensure Express server is listening (check logs for "Server listening")
- Test internal Railway URL before generating public domain

### Database Issues

**Data import fails with "relation does not exist":**
- **Most common cause:** Backend service hasn't deployed yet
- Ensure backend service deployed successfully first (migrations create tables)
- Check backend deployment logs for `Prisma Migrate applied...`
- Tables are created automatically by backend's start command, not manually

**Data import fails (other reasons):**
- Ensure Railway CLI is linked to correct project and Postgres service
- Verify dump file exists and is not corrupted
- Use `--no-owner --no-acl` flags with pg_restore
- Check Railway Postgres service is running

**Data count incorrect after import:**
- Run verify command: `railway run psql $DATABASE_URL -c 'SELECT COUNT(*) FROM "Problem";'`
- Expected: 4628 problems
- If count is 0, re-import data

---

## 6. Service Architecture

**Recommended setup:**

```
Railway Project: maths-tutor
├── Service 1: Postgres (Database)
│   └── Auto-generated DATABASE_URL
├── Service 2: API (Backend)
│   ├── Root: /packages/api
│   ├── Build: npm install && npm run build
│   ├── Start: npx prisma migrate deploy && npm run start
│   ├── Env: DATABASE_URL, PORT=3001, NODE_ENV=production, FRONTEND_URL
│   ├── CORS: Configured to allow requests from FRONTEND_URL
│   └── Domain: https://maths-tutor-api-production.up.railway.app
└── Service 3: Web (Frontend)
    ├── Root: / (or /apps/web)
    ├── Start: npx serve dist -s -p $PORT
    ├── Env: NODE_ENV=production, VITE_API_URL=[Backend Domain]
    ├── API Client: Uses VITE_API_URL to connect to backend
    └── Domain: https://maths-tutor-web-production.up.railway.app
```

**Frontend-Backend Connection:**
- Frontend's `client.ts` uses `VITE_API_URL` environment variable
- `VITE_API_URL` points to backend Railway domain (without `/api` suffix)
- Client code appends `/api` to create full API URLs
- Example: `VITE_API_URL=https://backend.up.railway.app` → calls `https://backend.up.railway.app/api/categories`

**CORS Configuration:**
- Backend uses `FRONTEND_URL` environment variable for CORS
- `FRONTEND_URL` contains frontend Railway domain
- Allows backend to accept requests from frontend origin
- Without this, browser blocks API requests with CORS errors

**Deployment workflow:**
1. Deploy Database first (PostgreSQL service)
2. Deploy Backend second (runs migrations automatically, creates schema)
3. Import data using Railway CLI (after backend creates tables)
4. Deploy Frontend to get its Railway domain
5. Add `FRONTEND_URL` to backend environment variables (frontend domain)
6. Update Frontend code (`client.ts`) to use VITE_API_URL
7. Add `VITE_API_URL` to frontend environment variables (backend domain)
8. Redeploy both services if needed

---

## Related Documentation

- [`NETLIFY-DEPLOYMENT-GUIDE.md`](./NETLIFY-DEPLOYMENT-GUIDE.md) - Alternative Netlify deployment
- [`PROJECT-SETUP.md`](./PROJECT-SETUP.md) - Local development setup
- [`CLAUDE.md`](../CLAUDE.md) - Project overview

---

Last updated: 2026-01-09
