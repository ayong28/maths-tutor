import { test, expect } from '@playwright/test';
import { WorksheetPage } from '../fixtures/WorksheetPage';

/**
 * E2E-001: Homepage & Initial Load
 * Tests the initial page load, hero section, and category loading
 */
test.describe('Homepage & Initial Load', () => {
  test('should display hero section on initial load', async ({ page }) => {
    const worksheetPage = new WorksheetPage(page);
    await worksheetPage.goto();

    // Verify header
    await expect(worksheetPage.headerTitle).toBeVisible();
    await expect(worksheetPage.headerSubtitle).toBeVisible();

    // Verify hero section is displayed
    await expect(worksheetPage.heroSection).toBeVisible();
    await expect(page.getByRole('heading', { name: /master math with/i })).toBeVisible();
    await expect(page.getByText(/interactive worksheets/i)).toBeVisible();

    // Verify hero features (using heading roles for specificity)
    await expect(page.getByRole('heading', { name: /easy to use/i })).toBeVisible();
    await expect(page.getByRole('heading', { name: /comprehensive/i })).toBeVisible();
    await expect(page.getByRole('heading', { name: /printable/i })).toBeVisible();

    // Verify "Get Started" button
    await expect(page.getByRole('button', { name: /get started/i })).toBeVisible();
  });

  test('should load categories from API', async ({ page }) => {
    const worksheetPage = new WorksheetPage(page);
    await worksheetPage.goto();

    // Verify "Topics" heading
    await expect(worksheetPage.topicsHeading).toBeVisible();

    // Wait for categories to load
    await page.waitForLoadState('networkidle');

    // Verify categories are present
    await expect(page.getByRole('button', { name: 'Fractions', exact: true })).toBeVisible();
    await expect(page.getByRole('button', { name: 'Algebra', exact: true })).toBeVisible();

    // Verify no errors
    await worksheetPage.verifyNoErrors();
  });

  test('should have no console errors on load', async ({ page }) => {
    const consoleErrors: string[] = [];
    page.on('console', (msg) => {
      if (msg.type() === 'error') {
        consoleErrors.push(msg.text());
      }
    });

    const worksheetPage = new WorksheetPage(page);
    await worksheetPage.goto();

    await page.waitForLoadState('networkidle');

    // Assert no console errors
    expect(consoleErrors).toHaveLength(0);
  });
});
