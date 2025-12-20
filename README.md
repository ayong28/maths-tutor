# Maths Tutor

A worksheet generator for maths tutoring, featuring fraction and algebra problems aligned with VCAA Level 7-8 curriculum.

## Features

- **870 problems** in PostgreSQL database
- **5 problem types**: Fraction (add/subtract/reduce), Algebra (collecting terms/multiplication)
- **CLI** for on-demand worksheet generation with filtering
- **React web UI** (v2) for browsing and printing worksheets
- **PDF generation** with proper fraction notation

## Quick Start

```bash
# Install dependencies
npm install

# Start PostgreSQL
brew services start postgresql@16

# Start React web UI (http://localhost:5173)
npm run dev

# Start API backend (http://localhost:3001) - in separate terminal
npm run api:dev

# Generate worksheet via CLI
npm run generate -- --type FRACTION_ADDITION --output worksheet.pdf
```

## Project Structure

```
maths-tutor/
├── apps/web/           # React frontend (Vite + Tailwind)
├── packages/api/       # Express API backend
├── src/
│   ├── cli/            # CLI worksheet generator
│   ├── generators/     # Problem selection logic
│   └── db/             # Prisma client
├── prisma/             # Database schema
├── worksheets/         # Markdown worksheet archive
└── generate-worksheet-pdf.ts  # PDF generation
```

## CLI Usage

```bash
# Generate worksheet
npm run generate -- --type FRACTION_ADDITION --output my-worksheet.pdf

# Custom difficulty mix
npm run generate -- --type FRACTION_ADDITION -d "easy:10,medium:15,hard:5"

# With tag filtering
npm run generate -- --type FRACTION_ADDITION --tags unlike-denominators

# Reproducible with seed
npm run generate -- --type FRACTION_ADDITION --seed "class-2025"

# List available problems
npm run generate:list

# List tags for a type
npm run generate:tags -- --type FRACTION_ADDITION
```

## Web UI

The React web interface (v2) provides a browser-based UI for browsing and printing worksheets:

**Features:**
- 🎯 Browse all 870 problems from PostgreSQL database
- 📂 Category/subcategory navigation (Fractions, Algebra)
- 🖨️ Professional print output with 2-page layout (questions + answer key)
- 👁️ Toggle answer display on screen (Show/Hide Answer Key)
- 📄 Print-optimized CSS for A4 worksheets with proper spacing
- ⚡ Real-time loading states and error handling
- 🎨 Clean UI with Tailwind CSS and gradient backgrounds

**Running:**
```bash
# Terminal 1: Start React frontend
npm run dev  # http://localhost:5173

# Terminal 2: Start API backend
npm run api:dev  # http://localhost:3001
```

**Architecture:**
- Frontend: React 18 + Vite + TypeScript + Tailwind CSS
- API: Express.js with Prisma ORM
- Data flow: PostgreSQL → Prisma → Express API → React

## Problem Types

| Type | Count |
|------|-------|
| FRACTION_ADDITION | 210 |
| FRACTION_SUBTRACTION | 210 |
| FRACTION_REDUCTION | 180 |
| ALGEBRA_COLLECTING_TERMS | 150 |
| ALGEBRA_MULTIPLICATION | 120 |

## Development

```bash
# Run tests
npm test

# Start web UI in dev mode
npm run dev

# Build for production
npm run build
```

## Tech Stack

- **Frontend**: React 18, Vite, TypeScript, Tailwind CSS
- **Backend**: Express.js + TypeScript
- **Database**: PostgreSQL 16 + Prisma 6.19
- **PDF**: PDFKit

## License

ISC
