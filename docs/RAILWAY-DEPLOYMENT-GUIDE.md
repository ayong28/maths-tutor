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

```bash
# Link to Railway project
railway link
# Select: Project → Environment → Postgres service

# Get database connection string
railway variables
# Copy the DATABASE_URL value

# Import data using pg_restore
railway run pg_restore --no-owner --no-acl -d $DATABASE_URL database_data.dump
```

**Verify data:**
```bash
railway run psql $DATABASE_URL -c 'SELECT COUNT(*) FROM "Problem";'
# Expected: 4628 problems
```

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
- **Custom Start Command**: `npm run start`

**Settings → Environment Variables:**
```
DATABASE_URL=[from Railway Postgres service - use 'railway variables' to get value]
PORT=3001
NODE_ENV=production
```

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
3. Check deployment logs for success
4. Verify API is running (check logs for "Server listening on port 3001")

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
- [ ] Import data using pg_restore
- [ ] Verify data count (4628 problems)

### Backend
- [ ] Create backend service from GitHub
- [ ] Set Root Directory: `/packages/api`
- [ ] Set Build Command: `npm install && npm run build`
- [ ] Set Start Command: `npm run start`
- [ ] Add environment variables (DATABASE_URL, PORT, NODE_ENV)
- [ ] Deploy and verify logs show "Server listening"
- [ ] Generate domain if needed

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

**API not responding:**
- Check deployment logs for startup errors
- Verify PORT environment variable is set (3001)
- Ensure Express server is listening (check logs)
- Test internal Railway URL before generating public domain

### Database Issues

**Data import fails:**
- Ensure Railway CLI is linked to correct project and Postgres service
- Verify dump file exists and is not corrupted
- Use `--no-owner --no-acl` flags with pg_restore
- Check Railway Postgres service is running

**Data count incorrect after import:**
- Run verify command: `railway run psql $DATABASE_URL -c 'SELECT COUNT(*) FROM "Problem";'`
- Expected: 4628 problems
- If count is 0, re-import data
- Check for migration issues (tables may not exist)

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
│   ├── Start: npm run start
│   └── Env: DATABASE_URL, PORT=3001, NODE_ENV=production
└── Service 3: Web (Frontend)
    ├── Root: / (or /apps/web)
    ├── Start: npx serve dist -s -p $PORT
    └── Env: NODE_ENV=production, VITE_API_URL
```

**Service dependencies:**
1. Deploy Database first
2. Deploy Backend second (needs DATABASE_URL)
3. Deploy Frontend last (needs backend URL)

---

## Related Documentation

- [`NETLIFY-DEPLOYMENT-GUIDE.md`](./NETLIFY-DEPLOYMENT-GUIDE.md) - Alternative Netlify deployment
- [`PROJECT-SETUP.md`](./PROJECT-SETUP.md) - Local development setup
- [`CLAUDE.md`](../CLAUDE.md) - Project overview

---

Last updated: 2026-01-08
