# Windows 11 Setup Guide

Complete guide for setting up the maths-tutor project on Windows 11, from git clone to running the backend and frontend locally.

## Prerequisites

Install the following before starting:

- **Node.js** v18+ — [nodejs.org](https://nodejs.org) (includes npm)
- **Git** — [git-scm.com](https://git-scm.com)
- **PostgreSQL 16** — [postgresql.org/download/windows](https://www.postgresql.org/download/windows/)
  - During installation, set a password for the `postgres` superuser — note it down
  - Default port: `5432` (leave as-is)
  - Install pgAdmin if prompted (optional)

---

## 1. Clone the Repository

```powershell
git clone <repo-url>
cd maths-tutor
```

---

## 2. Install Dependencies

```powershell
npm install
```

This installs dependencies for the root workspace, `apps/web`, and `packages/api`.

---

## 3. PostgreSQL Setup

### 3.1 Verify PostgreSQL is Running

PostgreSQL installs as a Windows service and starts automatically. Verify:

```powershell
Get-Service postgresql-x64-16
```

Expected output: `Status: Running`. If stopped, start it:

```powershell
Start-Service postgresql-x64-16
```

### 3.2 Create the Database User

The app connects as a named user (e.g. your Windows username, `adrian`). Create this user in PostgreSQL.

Add `psql` to your PowerShell session temporarily:

```powershell
$env:PATH += ";C:\Program Files\PostgreSQL\16\bin"
```

Connect as the `postgres` superuser and create the app user:

```powershell
$env:PGPASSWORD = "your-postgres-password"
psql -U postgres -c "CREATE USER adrian WITH PASSWORD 'your-password';"
```

Replace `adrian` with your preferred username and set a password.

### 3.3 Create the Database

```powershell
$env:PGPASSWORD = "your-postgres-password"
psql -U postgres -c "CREATE DATABASE maths_tutor_dev OWNER adrian;"
```

### 3.4 Run Prisma Migrations

This creates all the required tables:

```powershell
cd packages/api
$env:DATABASE_URL = "postgresql://adrian:your-password@localhost:5432/maths_tutor_dev?schema=public"
npx prisma migrate deploy
cd ../..
```

### 3.5 Grant Table Permissions

The tables are created by the migration runner. Grant your app user full access:

```powershell
$env:PGPASSWORD = "your-postgres-password"
& "C:\Program Files\PostgreSQL\16\bin\psql.exe" -U postgres -d maths_tutor_dev -c "GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO adrian; GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO adrian;"
```

---

## 4. Import Problem Data

The database schema is empty after migrations. Populate it from the SQL dump at `packages/api/scripts/data/new-server-data.sql`.

### 4.1 Clear Existing Data (if re-importing)

If the tables already have data from a previous import, truncate first:

```powershell
$env:PGPASSWORD = "your-postgres-password"
& "C:\Program Files\PostgreSQL\16\bin\psql.exe" -U postgres -d maths_tutor_dev -c 'TRUNCATE public."Problem", public."WorksheetProblem", public."GeneratedWorksheet", public."WorksheetTemplate" CASCADE;'
```

### 4.2 Run the Import

Import must be run as the `postgres` superuser (the dump uses `COPY` which requires table ownership or superuser access):

```powershell
$env:PGPASSWORD = "your-postgres-password"
& "C:\Program Files\PostgreSQL\16\bin\psql.exe" -U postgres -d maths_tutor_dev -f "packages\api\scripts\data\new-server-data.sql"
```

Expected output includes `COPY 4748` for the Problem table. The `_prisma_migrations` duplicate key error at the end is safe to ignore — those records already exist from the migration step.

### 4.3 Re-grant Permissions After Import

The `COPY` commands run as `postgres`, so re-grant permissions to your app user:

```powershell
$env:PGPASSWORD = "your-postgres-password"
& "C:\Program Files\PostgreSQL\16\bin\psql.exe" -U postgres -d maths_tutor_dev -c "GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO adrian; GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO adrian;"
```

### 4.4 Verify Import

```powershell
$env:PGPASSWORD = "your-password"
& "C:\Program Files\PostgreSQL\16\bin\psql.exe" -U adrian -d maths_tutor_dev -c 'SELECT COUNT(*) FROM public."Problem";'
```

Expected: `4748`

---

## 5. Environment Variables

Create a `.env` file at `packages/api/.env`:

```env
DATABASE_URL="postgresql://adrian:your-password@localhost:5432/maths_tutor_dev?schema=public"
```

The API loads this automatically via `dotenv` on startup. Without this file, the server will start but every API request will fail with `Environment variable not found: DATABASE_URL`.

---

## 6. Start the Backend

### Normal Start (from project root)

```powershell
npm run api:dev
```

This runs `prisma generate` then starts the Express server on `localhost:3001`.

### If `prisma generate` Fails (DLL Locked)

On Windows, if a previous server instance is still running, `prisma generate` will fail with an `EPERM` rename error because the Prisma query engine DLL is locked. Fix:

1. Find and kill the process on port 3001:

```powershell
$pid = (netstat -ano | Select-String ":3001 " | Select-String "LISTENING" | ForEach-Object { ($_ -split '\s+')[-1] } | Select-Object -First 1)
Stop-Process -Id $pid -Force
```

2. Start the server directly, skipping `prisma generate` (the DLL already exists):

```powershell
cd packages/api
npx tsx watch src/index.ts
```

### Verify Backend is Running

```powershell
Invoke-WebRequest -Uri http://localhost:3001/api/categories -UseBasicParsing | Select-Object StatusCode
```

Expected: `StatusCode: 200`

---

## 7. Start the Frontend

Open a second terminal:

```powershell
npm run dev
```

The React app starts on `http://localhost:5173` (or `5174` if 5173 is occupied).

---

## 8. Verify Everything Works

- Open `http://localhost:5173` (or `5174`) in your browser
- The sidebar should load problem categories (Fractions, Algebra, etc.)
- Clicking a category should show problems fetched from the API

---

## Troubleshooting

### "password authentication failed"

The `postgres` user password was set during PostgreSQL installation. If you've forgotten it, reset it:

1. Open `C:\Program Files\PostgreSQL\16\data\pg_hba.conf` as Administrator
2. Change `scram-sha-256` to `trust` on the `host` lines
3. Restart the service: `Restart-Service postgresql-x64-16`
4. Connect without a password: `psql -U postgres`
5. Reset: `ALTER USER postgres PASSWORD 'new-password';`
6. Revert `pg_hba.conf` back to `scram-sha-256` and restart the service again

### "permission denied for table Problem"

The app user (`adrian`) lacks access to tables owned by `postgres`. Run:

```powershell
$env:PGPASSWORD = "your-postgres-password"
& "C:\Program Files\PostgreSQL\16\bin\psql.exe" -U postgres -d maths_tutor_dev -c "GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO adrian; GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO adrian;"
```

### "EADDRINUSE: port 3001 already in use"

A previous server instance is still running. Find and kill it:

```powershell
$pid = (netstat -ano | Select-String ":3001 " | Select-String "LISTENING" | ForEach-Object { ($_ -split '\s+')[-1] } | Select-Object -First 1)
Stop-Process -Id $pid -Force
```

### "EPERM: operation not permitted" on prisma generate

The Prisma query engine DLL is locked by a running node process. Kill all processes on port 3001 (see above), then start the API directly with `npx tsx watch src/index.ts` instead of `npm run api:dev`.

### Port 5173 already in use

Vite will automatically try the next available port (e.g. `5174`). This is safe — just use whichever port Vite reports in its startup output.

### psql not found in PowerShell

Add it to your path for the session:

```powershell
$env:PATH += ";C:\Program Files\PostgreSQL\16\bin"
```

Or use the full path: `& "C:\Program Files\PostgreSQL\16\bin\psql.exe"`

---

## Quick Reference

| Task | Command |
|------|---------|
| Start PostgreSQL | `Start-Service postgresql-x64-16` |
| Start backend | `npm run api:dev` (from root) |
| Start frontend | `npm run dev` (from root) |
| Start backend (bypass prisma generate) | `cd packages/api && npx tsx watch src/index.ts` |
| Check port usage | `netstat -ano \| findstr :3001` |
| Kill process by PID | `Stop-Process -Id <PID> -Force` |
| Verify DB connection | `psql -U adrian -d maths_tutor_dev -c "SELECT COUNT(*) FROM \"Problem\";"` |
