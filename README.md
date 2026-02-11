# MathPractice - Year 7 Worksheets

> This is a personal project. 
> I am not accepting external contributions to ensure this remains 
> a true representation of my individual work.

A worksheet generator for maths tutoring, featuring 4,628 problems across 29 topic types aligned with the VCAA Level 7 curriculum.

![New UI](docs/images/ui-after-redesign.jpg)

## Features

- **4,628 problems** in PostgreSQL database across 29 topic types
- **Full VCAA Level 7 coverage**: Fractions, Algebra, Integers, Decimals, Percentages, Ratios, Coordinates, Linear Graphs, Index Notation, Geometry, Statistics & Probability
- **React web UI** with "Geometric Scholar" design — dark sidebar navigation, category cards, URL-based routing
- **PDF worksheet generation** with proper fraction notation (2-page layout: problems + answer key)
- **CLI** for on-demand worksheet generation with filtering
- **144 tests** (32 PDF + 74 Web + 38 E2E with Playwright)

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
├── apps/web/           # React frontend (Vite + React Router 7 + Tailwind)
│   └── src/
│       ├── routes/     # URL-based routes (home, category, worksheet)
│       ├── components/ # UI components (BetaBadge, CopyrightFooter, etc.)
│       └── hooks/      # Custom hooks (usePDFGenerator)
├── packages/api/       # Express API backend + Prisma
│   └── src/
│       ├── routes/     # API endpoints
│       └── services/   # Database business logic
├── src/                # CLI + PDF generator
├── e2e/                # Playwright E2E tests (38 tests)
├── docs/               # Documentation (see docs/README.md)
└── generated/          # Prisma client (not tracked)
```

## Web UI

The React web interface features the "Geometric Scholar" design with URL-based routing:

**Features:**

- Browse 4,628 problems across 29 topic types
- Persistent sidebar navigation with quick access links
- URL-based routing (`/fractions/addition`, `/algebra/collecting-terms`)
- Deep linking and browser back/forward support
- PDF download with 2-page layout (problems + answer key)
- Toggle answer display on screen
- Responsive design for mobile/tablet/desktop
- WCAG accessibility compliant

**Running:**

```bash
# Terminal 1: Start React frontend
npm run dev  # http://localhost:5173

# Terminal 2: Start API backend
npm run api:dev  # http://localhost:3001
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

## Problem Types (29 total)

| Category       | Types                                                      |
| -------------- | ---------------------------------------------------------- |
| Fractions      | Addition, Subtraction, Reduction, Multiplication, Division |
| Algebra        | Collecting Terms, Multiplication, Substitution, Expansion  |
| Integers       | Addition, Subtraction, Multiplication, Division            |
| Decimals       | Addition, Subtraction, Multiplication, Division            |
| Percentages    | Of Amount, Increase/Decrease                               |
| Ratios         | Ratio & Rates                                              |
| Coordinates    | Plotting                                                   |
| Linear Graphs  | Graphing                                                   |
| Index Notation | Powers, Square Roots, Laws                                 |
| Geometry       | Area, Angles                                               |
| Statistics     | Probability, Data Analysis                                 |

## Testing

```bash
# All tests
npm test                       # PDF + Web tests (106)
npm run test:e2e:chromium      # Playwright E2E (38 tests)

# Specific test suites
npm run test:integration       # App integration tests (21)
npm run test:hooks             # React hooks tests (53)
npm run test:e2e               # E2E all browsers (228 tests)
```

## Tech Stack

- **Frontend**: React 18, React Router 7, Vite, TypeScript, Tailwind CSS 4.1
- **Backend**: Express.js + TypeScript
- **Database**: PostgreSQL 16 + Prisma 6.19
- **PDF**: pdfkit, @react-pdf/renderer
- **Testing**: Jest, @testing-library/react, Playwright, @axe-core/playwright
- **Design**: Outfit + Plus Jakarta Sans fonts, Lucide React icons

## Documentation

See [`docs/README.md`](docs/README.md) for full documentation index including:

- Project setup guide
- Deployment guides (Railway, Netlify)
- Testing guides
- React Router 7 migration tutorial

## License

License & Copyright

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

Note: While the underlying code is open-source, the visual design, branding, and personal assets (images/logos) are copyright © 2026 Adrian Yong. Please do not clone the specific "look and feel" for your own commercial or portfolio use.

---

© 2026 Adrian Yong. All rights reserved.
