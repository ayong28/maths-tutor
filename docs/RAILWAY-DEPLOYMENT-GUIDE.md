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
