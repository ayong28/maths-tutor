# Deploy Maths Tutor to Netlify - Step-by-Step Tutorial

## Overview

Deploy your React + Express + PostgreSQL monorepo to Netlify + Supabase:
- **Frontend**: React 19 + Vite (apps/web/) → Netlify CDN
- **Backend**: Express API (packages/api/) → Netlify Functions (serverless)
- **Database**: PostgreSQL (local) → Supabase (cloud with connection pooling)
- **Data**: Migrate 4828 problems to cloud database

**Estimated time**: 4-5 hours

---

## Step 1: Set Up Supabase Database (1-2 hours)

### 1.1 Create Supabase Project

1. Go to https://supabase.com/dashboard
2. Sign in with GitHub
3. Click **New Project**
4. Configure:
   - **Name**: maths-tutor-prod (or your choice)
   - **Database Password**: Generate strong password (save to password manager)
   - **Region**: Choose closest to you (Australia/Singapore recommended)
   - **Plan**: Free tier (sufficient for this project)
5. Click **Create new project** (takes ~2 minutes)

### 1.1b Use Netlify's Supabase Integration (Alternative - Easier)

**If you prefer automated setup, use the official Netlify-Supabase integration:**

1. In Netlify dashboard: **Integrations** > **Add integration**
2. Search for "Supabase" and click **Install**
3. Select your Supabase project
4. Choose your frontend framework (React/Vite)
5. Netlify auto-configures environment variables

**Benefits:**
- No manual environment variable entry in Step 5.4
- Auto-syncs Supabase settings
- Simplified maintenance
- Uses Netlify's Secrets Controller for enhanced security

**Note:** If using this integration, you can skip manual environment variable setup in Step 5.4. However, you'll still need the connection strings for local development (Steps 1.2-1.3).

### 1.2 Get Connection Strings

Once provisioned, go to **Settings** > **Database**:

**Copy two connection strings** (you'll need both):

1. **Transaction Mode** (port 6543 - for Prisma Client in serverless):
   ```
   postgresql://postgres.xxxx:[PASSWORD]@aws-0-[REGION].pooler.supabase.com:6543/postgres
   ```

2. **Session Mode** (port 5432 - for migrations):
   ```
   postgresql://postgres.xxxx:[PASSWORD]@aws-0-[REGION].pooler.supabase.com:5432/postgres
   ```

**Important**: Replace `[PASSWORD]` with your actual database password

### Why Two Connection Strings?

**Transaction Mode (port 6543):**
- Uses Supavisor connection pooler
- Required for serverless (Netlify Functions)
- Limits connections to prevent exhaustion
- **Limitation:** No prepared statements (hence `?pgbouncer=true`)

**Session Mode (port 5432):**
- Direct database connection
- Required for migrations (Prisma needs full session)
- Not suitable for serverless (too many connections)

**Best Practice:** In serverless, use `connection_limit=1` and increase cautiously if needed.

### 1.3 Run Migrations on Supabase

Open terminal in your project root:

```bash
# IMPORTANT: Verify .gitignore includes .env.production BEFORE creating file
echo ".env.production" >> .gitignore

# Create .env.production file (DO NOT COMMIT THIS)
cat > .env.production << 'EOF'
DATABASE_URL="YOUR_TRANSACTION_MODE_CONNECTION_STRING_HERE"
DIRECT_URL="YOUR_SESSION_MODE_CONNECTION_STRING_HERE"
NODE_ENV=production
EOF

# Now edit .env.production and replace placeholders with actual values from Step 1.2
# Transaction Mode: postgresql://postgres.xxxx:[PASSWORD]@aws-0-[REGION].pooler.supabase.com:6543/postgres?pgbouncer=true&connection_limit=1
# Session Mode: postgresql://postgres.xxxx:[PASSWORD]@aws-0-[REGION].pooler.supabase.com:5432/postgres

# Load environment variables
export $(cat .env.production | xargs)

# Run migrations to create tables
npx prisma migrate deploy
```

⚠️ **SECURITY WARNING**:
- Never commit `.env.production` to Git
- Verify it's in `.gitignore` before adding connection strings
- Use a password manager to store database credentials securely

**Expected output**: "All migrations have been successfully applied"

### 1.4 Export Data from Local Database

Choose one of the following methods to export your data:

**Method 1: Supabase CLI (Recommended if using Supabase locally)**

```bash
# Install Supabase CLI (if not already installed)
npm install -g supabase

# Export data only
supabase db dump --data-only > prisma/data/export.sql
```

**Method 2: Prisma Studio (Interactive - Good for JSON export)**

```bash
# Export all problems as JSON
npx prisma studio
# In Prisma Studio: Select "Problem" table → Export → Download as JSON
# Save as prisma/data/problems.json
```

**Method 3: pg_dump (Traditional PostgreSQL approach)**

```bash
# Find PostgreSQL installation
/Applications/Postgres.app/Contents/Versions/16/bin/pg_dump \
  -U adrian \
  -d maths_tutor_dev \
  --data-only \
  --table=Problem \
  --inserts \
  > prisma/data/export.sql
```

**Note:** Methods 1 and 3 produce SQL files, Method 2 produces JSON. The seed script in Step 1.5 uses JSON format.

### 1.5 Create Seed Script

**Create: `prisma/seed.ts`**

```typescript
import { PrismaClient } from '../generated/prisma';
import * as fs from 'fs';
import * as path from 'path';

const prisma = new PrismaClient();

async function main() {
  console.log('Starting database seed...');

  // Read exported data
  const dataPath = path.join(__dirname, 'data', 'problems.json');
  const problemsData = JSON.parse(fs.readFileSync(dataPath, 'utf-8'));

  console.log(`Found ${problemsData.length} problems to import`);

  // Import in batches for better performance
  const batchSize = 100;
  for (let i = 0; i < problemsData.length; i += batchSize) {
    const batch = problemsData.slice(i, i + batchSize);
    await prisma.problem.createMany({
      data: batch,
      skipDuplicates: true,
    });
    console.log(`Imported ${Math.min(i + batchSize, problemsData.length)} / ${problemsData.length}`);
  }

  console.log('Seeding complete!');
}

main()
  .catch((e) => {
    console.error('Seeding failed:', e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
```

### Alternative: Use Supabase's Standard Seeding Pattern

If you prefer Supabase's recommended approach, create a SQL seed file instead:

**Create: `supabase/seed.sql`**

```sql
-- Seed data for Problem table
-- If you exported SQL using Method 1 or 3, you can use that file:
\i prisma/data/export.sql

-- Or insert data directly:
-- INSERT INTO "Problem" (id, type, category, difficulty, ...) VALUES (...);
```

**Run with Supabase CLI:**

```bash
# This approach works best if you're using Supabase CLI for local development
supabase db reset  # Recreates database and runs migrations + seed
```

**Benefits:**
- Standard Supabase pattern
- Integrates with `supabase db reset` workflow
- Better for SQL exports (Methods 1 & 3)

**Trade-offs:**
- Requires Supabase CLI
- Less flexible than TypeScript for complex data transformations

**Recommendation:** Use TypeScript seed (Step 1.5) for JSON exports or if you need data transformation. Use SQL seed for simple SQL dumps.

### 1.6 Run Seed Script

```bash
# Ensure environment variables are still set
export $(cat .env.production | xargs)

# Run seed
npx tsx prisma/seed.ts
```

**Expected output**: "Imported 4828 / 4828" and "Seeding complete!"

### 1.7 Verify Data Migration

```bash
# Open Prisma Studio connected to Supabase
npx prisma studio

# Or use Supabase dashboard: Database > Table Editor > Problem
# Should show 4828 rows
```

---

## Step 2: Update Prisma Configuration (30 minutes)

### 2.1 Update Prisma Schema

**Edit: `prisma/schema.prisma`**

Find the `generator client` block and update:

```prisma
generator client {
  provider      = "prisma-client-js"
  output        = "../generated/prisma"
  binaryTargets = ["native", "rhel-openssl-3.0.x"]  // Critical for Netlify Functions
  // Alternative options:
  // engineType = "binary"  // Default - uses Query Engine binaries (current approach)
  // engineType = "library" // Smaller bundle size (Prisma 5.15+), may have compatibility issues
}
```

Find the `datasource db` block and update:

```prisma
datasource db {
  provider  = "postgresql"
  url       = env("DATABASE_URL")      // Pooled connection (port 6543)
  directUrl = env("DIRECT_URL")        // Direct connection (port 5432)
}
```

**Why these changes**:

**binaryTargets Configuration:**
- `"native"`: Query engine for your local development (macOS/Windows/Linux)
- `"rhel-openssl-3.0.x"`: Query engine for Netlify Functions (Amazon Linux 2 with Node 20)
- **Node 18+** requires `openssl-3.0.x`
- **Node 16 or earlier** required `openssl-1.0.x` (now deprecated)

**Why binaryTargets matters:**
Prisma needs a Query Engine binary that matches the deployment platform. Without `rhel-openssl-3.0.x`, your Netlify Functions will crash with "Query engine binary not found" errors.

**directUrl for Connection Pooling:**
- `DATABASE_URL`: Used by Prisma Client for queries (pooled via Supavisor on port 6543)
- `DIRECT_URL`: Used by Prisma Migrate for schema changes (direct connection on port 5432)
- Required because connection poolers don't support all migration commands

### 2.2 Regenerate Prisma Client

```bash
npx prisma generate
```

**Expected output**: "Generated Prisma Client"

### 2.3 Add Netlify Vite Plugin (Optional but Recommended)

Install the official Netlify Vite plugin for better local development experience:

```bash
# In the apps/web directory
cd apps/web
npm install -D @netlify/vite-plugin
cd ../..
```

**Update: `apps/web/vite.config.ts`**

```typescript
import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';
import tailwindcss from '@tailwindcss/vite';
import netlify from '@netlify/vite-plugin';  // ADD THIS IMPORT
import path from 'path';

export default defineConfig({
  plugins: [
    react({
      exclude: /routes\/.*.tsx$/,
    }),
    tailwindcss(),
    netlify()  // ADD THIS PLUGIN
  ],
  resolve: {
    alias: {
      '@': path.resolve(__dirname, './src'),
    },
  },
  server: {
    proxy: {
      '/api': {
        target: 'http://localhost:3001',
        changeOrigin: true,
      },
    },
  },
});
```

**Benefits:**
- ✅ Emulates Netlify Functions, redirects, and headers locally
- ✅ No need to run `netlify dev` CLI separately
- ✅ Faster development iteration
- ✅ Access to Netlify Blobs, Cache API, and Image CDN in development
- ✅ Environment variables work the same locally and in production

**Alternative for React Router 7 projects:**
If you're using React Router 7 server features, install `@netlify/vite-plugin-react-router` instead.

**Note:** This step is optional but highly recommended for production parity in local development.

---

## Step 3: Convert Express API to Netlify Function (1 hour)

### 3.1 Install Dependencies

```bash
# Install required dependencies for Express on Netlify Functions
npm install serverless-http @netlify/functions

# TypeScript type definitions (should already be installed)
npm install -D @types/express
```

**What these do:**
- `serverless-http`: Wraps Express app to work as a serverless function
- `@netlify/functions`: Netlify Functions SDK for TypeScript types and context
- `@types/express`: TypeScript definitions for Express (development only)

### 3.2 Create Netlify Functions Directory

```bash
mkdir -p netlify/functions
```

### 3.3 Create API Function Wrapper

**Create: `netlify/functions/api.ts`**

```typescript
import serverless from 'serverless-http';
import express, { Request, Response, NextFunction } from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
import problemsRouter from '../../packages/api/src/routes/problems.routes';

// Load environment variables
dotenv.config();

const app = express();

// Middleware
app.use(cors({
  origin: process.env.FRONTEND_URL || '*',
  credentials: true,
}));

app.use(express.json());

// Request logging (minimal in production)
if (process.env.NODE_ENV === 'development') {
  app.use((req: Request, _res: Response, next: NextFunction) => {
    console.log(`${req.method} ${req.path}`);
    next();
  });
}

// Routes - mount at /api (Netlify redirects handle path rewriting)
app.use('/api', problemsRouter);

// Health check
app.get('/api/health', (_req: Request, res: Response) => {
  res.json({ status: 'ok', timestamp: new Date().toISOString() });
});

// 404 handler
app.use((_req: Request, res: Response) => {
  res.status(404).json({ error: 'Route not found' });
});

// Error handling middleware
app.use((err: Error, _req: Request, res: Response, _next: NextFunction) => {
  console.error('Unhandled error:', err);
  res.status(500).json({
    error: 'Internal server error',
    message: process.env.NODE_ENV === 'development' ? err.message : undefined,
  });
});

// Export as serverless function
export const handler = serverless(app);
```

**Key differences from `packages/api/src/index.ts`**:
- No `app.listen()` (serverless doesn't listen on port)
- Routes mounted at `/api` to match existing frontend code
- Export `handler` instead of starting server

### 3.4 Create TypeScript Config for Functions

**Create: `netlify/functions/tsconfig.json`**

```json
{
  "extends": "../../tsconfig.json",
  "compilerOptions": {
    "target": "ES2020",
    "lib": ["ES2020"],
    "module": "commonjs",
    "moduleResolution": "node",
    "outDir": "../../dist/functions",
    "rootDir": ".",
    "esModuleInterop": true,
    "skipLibCheck": true
  },
  "include": ["**/*.ts"],
  "exclude": ["node_modules"]
}
```

**Configuration notes:**
- `module: "commonjs"`: Required for Netlify Functions (Node.js runtime)
- `lib: ["ES2020"]`: Explicitly defines available JavaScript features
- `moduleResolution: "node"`: Standard Node.js module resolution
- `esModuleInterop`: Allows importing CommonJS modules with ES6 syntax

---

## Step 4: Configure Netlify Build (30 minutes)

### 4.1 Create Netlify Configuration

**Create: `netlify.toml`** at project root

```toml
[build]
  base = "/"                           # Monorepo root
  publish = "apps/web/dist"            # Vite build output
  command = "npm run build:netlify"    # Custom build command

[build.environment]
  NODE_VERSION = "20"                  # Node 20 LTS

[functions]
  directory = "netlify/functions"
  node_bundler = "esbuild"                      # Fast bundling
  external_node_modules = ["express"]           # Keep Express external (required)
  included_files = ["generated/prisma/**"]      # Include Prisma client

# Redirect API requests to serverless function
[[redirects]]
  from = "/api/*"
  to = "/.netlify/functions/api/:splat"
  status = 200
  force = true

# SPA fallback for client-side routing
[[redirects]]
  from = "/*"
  to = "/index.html"
  status = 200

# Security headers
[[headers]]
  for = "/*"
  [headers.values]
    X-Frame-Options = "DENY"
    X-Content-Type-Options = "nosniff"
    Referrer-Policy = "strict-origin-when-cross-origin"
```

### 4.2 Update Root package.json

**Edit: `package.json`** - Add to `scripts` section:

```json
{
  "scripts": {
    "build:netlify": "npm run build:api && npm run build:web",
    "build:api": "cd netlify/functions && npx tsc",
    "build:web": "npm run build -w apps/web"
  }
}
```

Also add to `dependencies` (move from devDependencies if needed):

```json
{
  "dependencies": {
    "serverless-http": "^3.2.0",
    "@netlify/functions": "^2.8.0"
  }
}
```

**Note:** These must be in `dependencies` (not `devDependencies`) so they're available during Netlify build.

### 4.3 Update .gitignore

**Edit: `.gitignore`** - Add these lines:

```
# Netlify
.netlify/
dist/functions/

# Production environment variables
.env.production
```

### 4.4 Test Local Build

```bash
# Test the build process
npm run build:netlify

# Verify outputs
ls -la apps/web/dist/        # Should have index.html, assets/
ls -la dist/functions/       # Should have api.js
```

**Expected results:**
- `apps/web/dist/` contains `index.html` and `assets/` folder
- `dist/functions/` contains `api.js` (compiled function)

### 4.5 Local Development Options

Choose the development approach that works best for you:

#### **Option A: Standard Development (Current Setup)**

```bash
# Terminal 1: Run React dev server
npm run dev

# Terminal 2: Run Express API
npm run api:dev
```

**When to use:**
- ✅ Fastest iteration during active development
- ✅ Familiar workflow (separate frontend/backend)
- ⚠️ Doesn't emulate Netlify features

#### **Option B: Netlify Vite Plugin (Recommended if installed Step 2.3)**

```bash
# Single terminal - runs everything with Netlify emulation
npm run dev
```

**When to use:**
- ✅ After installing `@netlify/vite-plugin` in Step 2.3
- ✅ Want to test Netlify redirects/headers locally
- ✅ Need access to Netlify Blobs, Cache API, or Image CDN
- ✅ Prefer single-command startup

**Benefits:**
- Functions, redirects, and environment variables work like production
- No separate API server needed
- Faster than Netlify CLI

#### **Option C: Netlify CLI (Most accurate production simulation)**

```bash
# Install Netlify CLI globally (one-time)
npm install -g netlify-cli

# Run full Netlify environment
netlify dev
```

**When to use:**
- ✅ Testing deployment-specific issues
- ✅ Need exact production parity
- ✅ Debugging edge cases before deploying

**Trade-offs:**
- ⚠️ Slower startup than other options
- ⚠️ Requires Netlify CLI installation
- ⚠️ May need Netlify account login

**Recommendation:** Use Option A or B during development, Option C for pre-deployment testing.

---

## Step 5: Deploy to Netlify (30 minutes)

### 5.1 Commit Changes

```bash
git add .
git commit -m "Configure Netlify deployment with Supabase

- Add netlify.toml with monorepo build config and redirects
- Configure external_node_modules for Express compatibility
- Create Netlify function wrapper for Express API
- Update Prisma schema for serverless (binaryTargets, directUrl)
- Add build:netlify scripts for deployment
- Add serverless-http and @netlify/functions dependencies
- Optional: Add @netlify/vite-plugin for local Netlify emulation

🤖 Generated with Claude Code"
```

### 5.2 Push to GitHub

```bash
# Push to your default branch
git push origin master
```

### 5.3 Connect Repository to Netlify

1. Go to https://app.netlify.com
2. Click **Add new site** > **Import an existing project**
3. Choose **GitHub** and authorize Netlify
4. Select your **maths-tutor** repository
5. Configure build settings (should auto-detect from netlify.toml):
   - **Base directory**: (leave empty)
   - **Build command**: `npm run build:netlify`
   - **Publish directory**: `apps/web/dist`
   - **Functions directory**: `netlify/functions`
6. **Don't click Deploy yet** - set environment variables first

### 5.4 Set Environment Variables

In Netlify UI: **Site settings** > **Environment variables** > **Add a variable**

Add these 4 variables:

| Key | Value |
|-----|-------|
| `DATABASE_URL` | `postgresql://postgres.xxxx:[PASSWORD]@aws-0-[REGION].pooler.supabase.com:6543/postgres?pgbouncer=true&connection_limit=1` |
| `DIRECT_URL` | `postgresql://postgres.xxxx:[PASSWORD]@aws-0-[REGION].pooler.supabase.com:5432/postgres` |
| `NODE_ENV` | `production` |
| `FRONTEND_URL` | `https://your-site-name.netlify.app` (update after first deploy) |

**Important**: Use the actual values from Supabase Step 1.2

### 5.5 Deploy

Click **Deploy site** button

**Watch build logs**:
- Installing dependencies (~2 min)
- Building API functions (~30 sec)
- Building React app (~1 min)
- Deploying (~30 sec)

**Expected**: Green checkmark "Published" with URL like `https://magnificent-panda-abc123.netlify.app`

### 5.6 Update FRONTEND_URL

After first deploy:
1. Copy your site URL
2. Go to **Site settings** > **Environment variables**
3. Edit `FRONTEND_URL` variable
4. Paste your actual URL
5. Click **Save**
6. Go to **Deploys** > **Trigger deploy** > **Clear cache and deploy site**

---

## Step 6: Test Deployment (1 hour)

### 6.1 Frontend Tests

Visit your Netlify URL and test:

- [ ] Homepage loads without errors
- [ ] Navigate to a category (e.g., click "Fractions")
- [ ] Navigate to a subcategory (e.g., click "Addition")
- [ ] Problems load on worksheet page
- [ ] Difficulty filters work
- [ ] Tag filters work (if applicable)
- [ ] Browser back/forward buttons work
- [ ] Open browser DevTools > Console - no errors
- [ ] Share a worksheet URL - deep linking works

### 6.2 API Tests

Test API endpoints directly:

```bash
# Replace with your actual Netlify URL
SITE_URL="https://your-site-name.netlify.app"

# Test categories endpoint
curl "$SITE_URL/api/categories" | jq

# Expected: Array of 25 categories with counts

# Test problems endpoint
curl "$SITE_URL/api/problems?type=FRACTION_ADDITION&limit=5" | jq

# Expected: Array of 5 problems

# Test tags endpoint
curl "$SITE_URL/api/tags/FRACTION_ADDITION" | jq

# Expected: Array of tag strings
```

### 6.3 Database Tests

In Netlify UI: **Functions** > **api** > **Function logs**

- Check for connection errors
- Should see successful responses
- Monitor for slow requests (cold starts)

In Supabase dashboard: **Database** > **Query Performance**

- Check connection pool usage
- Should see queries executing successfully

### 6.4 Performance Tests

- **First load** (cold start): May take 2-5 seconds
- **Subsequent loads** (warm): Should be < 1 second
- **API responses**: Should be < 500ms for warm functions

**If slow**: This is normal for serverless cold starts. Consider Netlify Pro for better performance.

---

## Step 7: Optional Enhancements

### 7.1 Custom Domain

In Netlify: **Domain settings** > **Add custom domain**

Follow wizard to add your domain and configure DNS.

### 7.2 HTTPS & Security

Netlify automatically provisions SSL certificates (Let's Encrypt). Should work immediately.

### 7.3 Analytics

Enable Netlify Analytics: **Analytics** > **Enable Analytics**

Free tier includes basic traffic stats.

---

## Troubleshooting

### Issue: Build Fails with "Cannot find module"

**Solution**: Ensure all dependencies are in `dependencies`, not `devDependencies`:

```bash
npm install --save express cors dotenv serverless-http @netlify/functions
```

**Check:** Verify these are in the `dependencies` section of your root `package.json`, not `devDependencies`.

### Issue: API Returns 500 Error

**Check**:
1. Netlify function logs for error details
2. DATABASE_URL is correctly set in environment variables
3. Supabase database is accessible (check Supabase dashboard)

### Issue: API Returns 404

**Check**:
1. netlify.toml redirects are configured correctly
2. Functions deployed (check Netlify UI > Functions tab)
3. Build logs show "1 new function" deployed

### Issue: Database Connection Timeout

**Solution**: Verify connection string has `?pgbouncer=true&connection_limit=1`

### Issue: Frontend Shows Old Data

**Solution**: Clear Netlify cache:
1. **Deploys** > **Trigger deploy** > **Clear cache and deploy site**

### Issue: CORS Errors

**Check**: `FRONTEND_URL` environment variable matches your actual Netlify URL

### Issue: Express Function Fails with Module Errors

**Symptoms**: API returns errors like "Cannot find module 'express'" or function doesn't start

**Solution**: Verify `netlify.toml` has `external_node_modules`:

```toml
[functions]
  external_node_modules = ["express"]
```

**Why this matters**: Without this, esbuild may bundle Express incorrectly, causing runtime failures.

### Issue: Prisma Client Not Found in Functions

**Symptoms**: "Cannot find module '@prisma/client'" or "PrismaClient is not a constructor"

**Solution**: Ensure `netlify.toml` includes Prisma files:

```toml
[functions]
  included_files = ["generated/prisma/**"]
```

Also verify `binaryTargets = ["native", "rhel-openssl-3.0.x"]` in `prisma/schema.prisma`.

---

## Rollback Strategy

If deployment has issues:

### Quick Rollback (Frontend)

1. Netlify dashboard > **Deploys**
2. Find previous working deploy
3. Click three dots > **Publish deploy**

### Database Rollback

```bash
# If migration caused issues
export $(cat .env.production | xargs)
npx prisma migrate resolve --rolled-back MIGRATION_NAME
npx prisma migrate deploy
```

### Full Rollback (Code)

```bash
git revert HEAD
git push origin master
# Netlify auto-deploys previous version
```

---

## Cost Estimates

**Supabase Free Tier**:
- 500MB database ✅ (sufficient for 4828 problems)
- Unlimited API requests ✅
- Connection pooling included ✅

**Netlify Free Tier**:
- 100GB bandwidth/month ✅
- 125k function invocations/month ✅
- 300 build minutes/month ✅

**Expected monthly cost**: **$0** for typical usage (< 10k users/month)

---

## Critical Files Modified/Created

**Created**:
- `netlify.toml` - Netlify build configuration with external_node_modules
- `netlify/functions/api.ts` - Serverless Express wrapper
- `netlify/functions/tsconfig.json` - TypeScript config for functions (enhanced)
- `prisma/seed.ts` - Database seeding script (or `supabase/seed.sql` if using SQL approach)
- `.env.production` - Production environment variables (not committed)

**Modified**:
- `prisma/schema.prisma` - Added binaryTargets and directUrl for serverless
- `package.json` - Added build:netlify scripts, serverless-http, and @netlify/functions
- `.gitignore` - Added Netlify build artifacts and .env.production
- `apps/web/vite.config.ts` - Optional: Added @netlify/vite-plugin for local development

**Optional but Recommended**:
- `apps/web/package.json` - Add @netlify/vite-plugin to devDependencies

**No changes needed**:
- `apps/web/src/api/client.ts` - Already uses `/api` prefix (works with redirects)
- `packages/api/src/routes/problems.routes.ts` - Reused as-is

---

## Sources

- [Vite on Netlify | Netlify Docs](https://docs.netlify.com/build/frameworks/framework-setup-guides/vite/)
- [React Router on Netlify | Netlify Docs](https://docs.netlify.com/build/frameworks/framework-setup-guides/react-router/)
- [Express on Netlify | Netlify Docs](https://docs.netlify.com/build/frameworks/framework-setup-guides/express/)
- [Functions overview | Netlify Docs](https://docs.netlify.com/build/functions/overview/)
- [Monorepos | Netlify Docs](https://docs.netlify.com/build/configure-builds/monorepos/)
- [Deploy to Netlify | Prisma Documentation](https://www.prisma.io/docs/orm/prisma-client/deployment/serverless/deploy-to-netlify)
- [Netlify DB (Neon integration)](https://www.netlify.com/blog/netlify-db-database-for-ai-native-development/)
- [Prisma Postgres on Netlify](https://www.netlify.com/integrations/prisma/postgres-setup-guide/)
