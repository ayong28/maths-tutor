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
```

**Why include migrations in Start Command:**
- Ensures database schema is up-to-date before app starts
- Automatically runs migrations on every deployment
- Avoids manual migration steps
- Works with Railway's internal DATABASE_URL automatically

**How to get DATABASE_URL:**
```bash
# In terminal, link Railway CLI to Postgres service
railway link
# Select: Project → production → Postgres

# Get the DATABASE_URL
railway variables | grep DATABASE_URL
# Copy the full connection string
```

### Deploy Backend

1. Save settings
2. Railway auto-deploys on push to main branch
3. Check deployment logs:
   - Look for migration success: `Prisma Migrate applied...`
   - Verify API starts: `Server listening on port 3001`
4. Database schema is now ready for data import

---

## 3. Frontend Deployment (React SPA)

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
VITE_API_URL=[your backend Railway URL]
```

**Note:** Do NOT manually set `PORT` - Railway provides it automatically.

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
- [ ] Add environment variables (DATABASE_URL, PORT=3001, NODE_ENV=production)
- [ ] Deploy and verify logs show:
  - [ ] `Prisma Migrate applied...` (migrations ran)
  - [ ] `Server listening on port 3001` (API started)
- [ ] Generate domain if needed

### Database Import (after backend deployed)
- [ ] Link Railway CLI to Postgres service
- [ ] Import data: `railway run pg_restore --no-owner --no-acl -d $DATABASE_URL database_data.dump`
- [ ] Verify data count: 4628 problems

### Frontend
- [ ] Create frontend service from GitHub
- [ ] Set Custom Start Command: `npx serve dist -s -p $PORT`
- [ ] Generate domain with port 8080
- [ ] Add environment variables (VITE_API_URL)
- [ ] Deploy and verify build succeeds
- [ ] Test generated domain URL

---

## 5. Troubleshooting

### Frontend Issues

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

### Backend Issues

**Error: Cannot find module '/app/index.js':**
- Verify Root Directory is set to `/packages/api`
- Check Build Command includes: `npm install && npm run build`
- Ensure Start Command is: `npm run start` (not `npm start`)
- Verify `dist/index.js` exists after build

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
│   └── Env: DATABASE_URL, PORT=3001, NODE_ENV=production
└── Service 3: Web (Frontend)
    ├── Root: / (or /apps/web)
    ├── Start: npx serve dist -s -p $PORT
    └── Env: NODE_ENV=production, VITE_API_URL
```

**Deployment workflow:**
1. Deploy Database first (PostgreSQL service)
2. Deploy Backend second (runs migrations automatically, creates schema)
3. Import data using Railway CLI (after backend creates tables)
4. Deploy Frontend last (connects to backend API)

---

## Related Documentation

- [`NETLIFY-DEPLOYMENT-GUIDE.md`](./NETLIFY-DEPLOYMENT-GUIDE.md) - Alternative Netlify deployment
- [`PROJECT-SETUP.md`](./PROJECT-SETUP.md) - Local development setup
- [`CLAUDE.md`](../CLAUDE.md) - Project overview

---

Last updated: 2026-01-08
