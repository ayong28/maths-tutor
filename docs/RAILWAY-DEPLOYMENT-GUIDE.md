# Deploy Maths Tutor to Railway - Quick Guide

## Overview

Deploy the React SPA frontend to Railway with PostgreSQL backend.

**Stack:**
- **Frontend**: React 19 + Vite (SPA mode) → Railway static hosting
- **Backend**: PostgreSQL → Railway database service
- **Build Output**: `dist/` (not `build/client` - this is SPA mode, not SSR)

---

## Common Issues & Solutions

### Issue: Railway looking for `/app/build/client`

**Error:**
```
copy /app/build/client
ERROR: failed to build: "/app/build/client": not found
```

**Root Cause:**
- Railway auto-detects React Router 7 and expects **SSR mode** output (`build/client`)
- This app uses **SPA mode** with Vite which outputs to `dist/`

**Solution: Use Custom Start Command**

1. Go to Railway Dashboard → Your Service → Settings
2. Under **Deploy** section:
   - **Custom Start Command**: `npx serve dist -s -p $PORT`
3. Save changes

**Note:** Do NOT create a `PORT` environment variable - Railway provides it automatically.

---

## Domain Configuration

### Setting Up Public Domain

1. In Railway Dashboard → Settings → **Networking**
2. Click **Generate Domain**
3. When prompted for port: **Use 8080**
4. Railway will generate a public URL (e.g., `your-app.up.railway.app`)

**Port Explanation:**
- Railway asks which internal port to expose publicly
- Port 8080 is standard for web services
- Your app runs on `$PORT` (set by Railway), traffic routes to 8080

---

## Build Configuration

### Option 1: Railway Dashboard (Recommended)

**Build Settings:**
- Build Command: `npm run build` (auto-detected from package.json)
- Start Command: `npx serve dist -s -p $PORT`
- Root Directory: `/` (monorepo root)

**Environment Variables:**
- `NODE_ENV`: `production`
- Database variables (if using Railway Postgres - see below)

### Option 2: Using nixpacks.toml (Alternative)

If you need more control, create `nixpacks.toml` in project root:

```toml
[phases.setup]
nixPkgs = ["nodejs"]

[phases.install]
cmds = ["npm ci"]

[phases.build]
cmds = ["npm run build"]

[start]
cmd = "npx serve dist -s -p $PORT"
```

**Note:** Railway auto-detects this file - no manual configuration needed.

---

## Database Setup

### Connect to Railway PostgreSQL

1. In Railway Dashboard: **New** → **Database** → **PostgreSQL**
2. Copy connection variables from database service
3. Add to frontend service environment variables (if needed for API calls)

### Import Data to Railway Database

```bash
# Link to Railway project
railway link

# Get database connection string
railway variables

# Import data using pg_restore
railway run pg_restore --no-owner --no-acl -d $DATABASE_URL database_data.dump
```

**Verify data:**
```bash
railway run psql $DATABASE_URL -c 'SELECT COUNT(*) FROM "Problem";'
```

---

## Deployment Checklist

- [ ] Set Custom Start Command: `npx serve dist -s -p $PORT`
- [ ] Generate domain with port 8080
- [ ] Connect PostgreSQL database (if needed)
- [ ] Set environment variables (API URL, etc.)
- [ ] Deploy and verify build succeeds
- [ ] Test generated domain URL

---

## Troubleshooting

### Build fails with "not found" error
- Verify build outputs to `dist/` not `build/client`
- Check Custom Start Command uses `dist/`

### Domain not accessible
- Verify port is set to 8080
- Check Railway deployment logs for errors
- Ensure `serve` package can be installed (in dependencies or use `npx`)

### Environment variables not working
- Railway auto-provides `$PORT` - don't manually set it
- Check variable names match exactly in Railway dashboard

---

## Related Documentation

- [`NETLIFY-DEPLOYMENT-GUIDE.md`](./NETLIFY-DEPLOYMENT-GUIDE.md) - Alternative Netlify deployment
- [`PROJECT-SETUP.md`](./PROJECT-SETUP.md) - Local development setup
- [`CLAUDE.md`](../CLAUDE.md) - Project overview

---

Last updated: 2026-01-08
