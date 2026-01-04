# E2E Test Plan - Math Tutoring Worksheets

**Phase 9: Polish & Testing**
**Test Framework:** Playwright
**Last Updated:** 2025-12-29

## Overview

Comprehensive E2E testing strategy for the Math Tutoring Worksheets application. This plan covers all critical user journeys, edge cases, and ensures the app works correctly across the full stack (React frontend + Express API + PostgreSQL database).

## Test Environment Setup

**Prerequisites:**
- PostgreSQL database running on localhost:5432
- Test database: `maths_tutor_test` (separate from dev database)
- React dev server: `http://localhost:5173`
- Express API server: `http://localhost:3001`

**Test Data Requirements:**
- Seed database with known test problems for predictable assertions
- At least 30 problems per problem type
- Mix of difficulties (EASY, MEDIUM, HARD)
- Problems with tags for filter testing

## Critical User Flows

### 1. Homepage & Initial Load
**Test ID:** E2E-001
**Priority:** High
**User Story:** As a user, I want to see a welcoming homepage when I first visit

**Test Steps:**
1. Navigate to `http://localhost:5173`
2. Verify HeroSection is displayed
3. Verify header displays "Maths Tutoring Worksheets"
4. Verify sidebar shows "Topics" heading
5. Verify categories load from API (check for "Fractions" and "Algebra")
6. Verify no errors in console

**Assertions:**
- Hero heading contains "Master Math with"
- Hero heading contains "Interactive Worksheets"
- "Get Started" button is visible
- Three feature cards are displayed (Easy to Use, Comprehensive, Printable)
- Categories sidebar contains at least 2 categories

---

### 2. Category Selection Flow
**Test ID:** E2E-002
**Priority:** High
**User Story:** As a user, I want to select a math category to view subcategories

**Test Steps:**
1. Navigate to homepage
2. Click "Fractions" category
3. Verify subcategories appear
4. Verify "Fractions" is highlighted

**Assertions:**
- "Fractions" button has active styling (bg-blue-200)
- Subcategories include: "Addition", "Subtraction", "Reduction"
- ChevronRight icon is displayed
- Main content area still shows HeroSection

---

### 3. Subcategory Selection & Problem Display
**Test ID:** E2E-003
**Priority:** High
**User Story:** As a user, I want to view math problems when I select a subcategory

**Test Steps:**
1. Navigate to homepage
2. Click "Fractions" → "Addition"
3. Wait for API call to complete
4. Verify problems are displayed

**Assertions:**
- Loading spinner appears briefly
- Page title shows "Fractions - Addition"
- Exactly 30 problems are displayed (default limit)
- Problems are in 2-column grid layout
- Each problem has a number (1-30)
- Problems contain fractions with proper rendering
- "Download PDF" button is visible
- "Show Answer Key" button is visible
- "Back to Categories" button is visible

---

### 4. Difficulty Filtering
**Test ID:** E2E-004
**Priority:** High
**User Story:** As a user, I want to filter problems by difficulty level

**Test Steps:**
1. Navigate to "Fractions" → "Addition"
2. Check "EASY" difficulty checkbox
3. Verify "Apply Filters" button shows "Pending" badge
4. Click "Apply Filters"
5. Wait for API response
6. Verify problems update

**Assertions:**
- Difficulty filter section is enabled (not grayed out)
- EASY checkbox is checked
- "Apply Filters" button becomes enabled
- "Pending" badge appears on button
- API call includes `?difficulty=EASY` parameter
- Problems reload with loading indicator
- New problems are displayed (may be fewer than 30)

**Additional Test Cases:**
- Test multiple difficulty selections (EASY + MEDIUM)
- Test "Clear Filters" button resets checkboxes and reloads all problems

---

### 5. Tag Filtering
**Test ID:** E2E-005
**Priority:** High
**User Story:** As a user, I want to filter problems by tags

**Test Steps:**
1. Navigate to "Fractions" → "Addition"
2. Wait for tags to load
3. Check a tag checkbox (e.g., "unlike-denominators")
4. Click "Apply Filters"
5. Verify problems update

**Assertions:**
- Tag filter section displays available tags
- Tags are loaded from API based on problem type
- Tag checkbox can be selected
- "Apply Filters" button shows pending state
- API call includes `?tags=unlike-denominators` parameter
- Filtered problems are displayed

**Additional Test Cases:**
- Test multiple tag selections
- Test combining difficulty + tag filters
- Verify tag filter is disabled when no subcategory is selected

---

### 6. Answer Key Toggle
**Test ID:** E2E-006
**Priority:** Medium
**User Story:** As a user, I want to show/hide answers to check my work

**Test Steps:**
1. Navigate to "Fractions" → "Addition"
2. Wait for problems to load
3. Click "Show Answer Key" button
4. Verify answers appear inline
5. Click "Hide Answer Key"
6. Verify answers disappear

**Assertions:**
- Initially, answers are hidden
- Button text changes to "Hide Answer Key"
- Answers appear next to each problem (inline-answer class)
- Answers are properly formatted (fractions rendered correctly)
- Button text changes back to "Show Answer Key"
- Answers are hidden again

---

### 7. PDF Download
**Test ID:** E2E-007
**Priority:** High
**User Story:** As a user, I want to download a PDF worksheet for offline use

**Test Steps:**
1. Navigate to "Fractions" → "Addition"
2. Wait for problems to load
3. Click "Download PDF" button
4. Wait for PDF generation
5. Verify download starts

**Assertions:**
- "Download PDF" button is enabled
- Button shows loading state ("Generating..." with spinner)
- PDF file download is triggered
- Filename follows pattern: `fractions-addition-worksheet.pdf`
- Button returns to normal state after generation

**Manual Verification Required:**
- Open downloaded PDF and verify:
  - Page 1 has 30 problems in 2-column layout
  - Page 2 has answer key
  - Fractions are properly rendered
  - Header includes Name, Date, Problems count

---

### 8. Navigation Flow
**Test ID:** E2E-008
**Priority:** Medium
**User Story:** As a user, I want to navigate between categories and back to homepage

**Test Steps:**
1. Navigate to "Fractions" → "Addition"
2. Click "Back to Categories"
3. Verify returns to HeroSection
4. Switch to "Algebra" → "Collecting Terms"
5. Verify new problems load

**Assertions:**
- "Back to Categories" clears selected subcategory
- HeroSection is displayed again
- Previously selected category is still highlighted
- Switching categories resets filters
- New problem type loads correct problems
- Algebra problems render as plain text (not fractions)

---

### 9. Filter State Management
**Test ID:** E2E-009
**Priority:** Medium
**User Story:** As a user, I expect filters to reset when I change categories

**Test Steps:**
1. Navigate to "Fractions" → "Addition"
2. Select EASY difficulty and a tag
3. Apply filters
4. Switch to "Fractions" → "Subtraction"
5. Verify filters are cleared

**Assertions:**
- Difficulty checkboxes are unchecked
- Tag checkboxes are unchecked
- "Apply Filters" button is disabled
- All problems load (no filters applied)
- Filter state is independent per subcategory

---

### 10. Error Handling - API Failures
**Test ID:** E2E-010
**Priority:** High
**User Story:** As a user, I want to see helpful error messages when the API fails

**Test Steps:**
1. Stop the Express API server
2. Navigate to homepage
3. Attempt to load a subcategory
4. Verify error handling

**Assertions:**
- Categories show error message: "Error loading categories"
- Error icon (AlertCircle) is displayed
- Error message is user-friendly
- No console errors crash the app
- Retry mechanism works when API is restored

**Additional Test Cases:**
- Test 404 errors (invalid problem type)
- Test network timeout
- Test malformed API responses

---

### 11. Loading States
**Test ID:** E2E-011
**Priority:** Medium
**User Story:** As a user, I want to see loading indicators while data fetches

**Test Steps:**
1. Simulate slow network (Playwright can throttle)
2. Navigate to "Fractions" → "Addition"
3. Verify loading states appear

**Assertions:**
- Category loading shows spinner + "Loading categories..."
- Problem loading shows spinner + "Loading problems..."
- Tag loading shows spinner + "Loading tags..."
- PDF generation shows spinner + "Generating..."
- UI is not interactive during loading

---

### 12. Mobile Responsiveness (Viewport Testing)
**Test ID:** E2E-012
**Priority:** Medium
**User Story:** As a mobile user, I want the app to work on my phone

**Test Steps:**
1. Set viewport to mobile (375x667 - iPhone SE)
2. Navigate to homepage
3. Interact with all features

**Assertions:**
- Sidebar changes to mobile layout (not side-by-side)
- Touch targets are at least 44x44px
- Text is readable without zooming
- Hero section scales properly
- Problem grid adjusts to single column on very small screens
- Buttons remain accessible

**Additional Viewports:**
- Tablet: 768x1024 (iPad)
- Desktop: 1920x1080
- Large Desktop: 2560x1440

---

## Edge Cases & Boundary Tests

### 13. Empty State Handling
**Test ID:** E2E-013
**Test Case:** No problems match filter criteria

**Steps:**
1. Select a subcategory
2. Apply very restrictive filters (e.g., HARD + rare tag)
3. Verify empty state message

**Expected:**
- Message: "No problems found for this category."
- No crash or blank screen

---

### 14. Maximum Filter Selection
**Test ID:** E2E-014
**Test Case:** Select all difficulties and all tags

**Steps:**
1. Check all difficulty levels
2. Check all available tags
3. Apply filters

**Expected:**
- API request includes all selected values
- Problems that match ANY difficulty and ANY tag are shown
- No performance degradation

---

### 15. Rapid Clicking / Race Conditions
**Test ID:** E2E-015
**Test Case:** User rapidly clicks categories and filters

**Steps:**
1. Rapidly click between categories
2. Rapidly toggle filters on/off
3. Click "Apply Filters" multiple times

**Expected:**
- UI doesn't break or show duplicate problems
- Only the latest API request is processed
- No orphaned loading states

---

## Performance Tests

### 16. Page Load Performance
**Test ID:** E2E-016
**Metrics to Track:**
- Time to First Contentful Paint (FCP) < 1.5s
- Time to Interactive (TTI) < 3s
- Largest Contentful Paint (LCP) < 2.5s

---

### 17. API Response Time
**Test ID:** E2E-017
**Metrics to Track:**
- GET /api/problems/categories < 200ms
- GET /api/problems?type=X < 500ms
- GET /api/problems/tags?type=X < 200ms

---

## Accessibility Tests

### 18. Keyboard Navigation
**Test ID:** E2E-018
**Steps:**
1. Navigate using Tab key only
2. Use Enter/Space to interact

**Expected:**
- All interactive elements are reachable
- Focus indicators are visible
- Logical tab order

---

### 19. Screen Reader Compatibility
**Test ID:** E2E-019
**Steps:**
1. Run axe-core accessibility tests
2. Check ARIA labels

**Expected:**
- No critical accessibility violations
- Form inputs have labels
- Buttons have descriptive text

---

## Cross-Browser Testing

### 20. Browser Compatibility
**Test ID:** E2E-020
**Browsers to Test:**
- Chromium (primary)
- Firefox
- WebKit (Safari)

**Critical Flows to Verify:**
- Problem rendering (fractions display correctly)
- PDF download works
- CSS layout is consistent

---

## Test Data Management

**Setup:**
- Create `seed-test-data.ts` script to populate test database
- Use predictable IDs and content for assertions

**Teardown:**
- Reset database between test runs
- Clear downloaded files

---

## Test Execution Strategy

**Test Grouping:**
1. Smoke tests (E2E-001, 002, 003) - Run on every commit
2. Full regression suite - Run before deployment
3. Mobile tests - Run daily
4. Performance tests - Run weekly

**Parallel Execution:**
- Tests can run in parallel if they use isolated test data
- Max 4 workers to avoid database contention

---

## Success Criteria

**Phase 9 Complete When:**
- [ ] All 20 E2E tests passing
- [ ] 0 accessibility violations (critical/serious)
- [ ] Mobile responsive on 3+ viewports
- [ ] Cross-browser tested (Chromium, Firefox, WebKit)
- [ ] Performance metrics met
- [ ] CI/CD pipeline includes E2E tests

---

## Known Limitations

1. PDF content validation requires manual inspection (Playwright cannot assert PDF internals easily)
2. Fraction rendering accuracy may vary by font availability
3. Tests require backend API to be running (not fully mocked)

---

## Next Steps After E2E Tests

1. Component tests for complex components (Fraction, MixedNumber, PrintableWorksheet)
2. Visual regression testing with Playwright screenshots
3. Load testing for concurrent users
4. Security testing (XSS, injection attacks)
