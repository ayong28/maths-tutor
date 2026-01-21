import { test, expect } from '@playwright/test';
import { WorksheetPage } from '../fixtures/WorksheetPage';

/**
 * E2E-001: Homepage & Initial Load
 * Tests the initial page load, hero section, and category loading
 * Updated for React Router 7 URL-based routing
 */
test.describe('Homepage & Initial Load', () => {
  test('should display hero section on initial load', async ({ page }) => {
    const worksheetPage = new WorksheetPage(page);
    await worksheetPage.goto();

    // Verify hero section is displayed
    await expect(worksheetPage.heroHeading).toBeVisible();
    await expect(page.getByRole('heading', { name: /master math with/i })).toBeVisible();
    await expect(page.getByText(/year 7 math worksheets/i)).toBeVisible();

    // Verify description text
    await expect(worksheetPage.heroDescription).toBeVisible();
  });

  test('should load categories from API', async ({ page }) => {
    const worksheetPage = new WorksheetPage(page);
    await worksheetPage.goto();

    // Wait for categories to load
    await worksheetPage.waitForPageReady();

    // Verify category links are present (using links, not buttons)
    await expect(page.getByRole('link', { name: /fractions/i })).toBeVisible();
    await expect(page.getByRole('link', { name: /algebra/i })).toBeVisible();

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

    await worksheetPage.waitForPageReady();

    // Assert no console errors
    expect(consoleErrors).toHaveLength(0);
  });

  test('should navigate to category page when clicking category link', async ({ page }) => {
    const worksheetPage = new WorksheetPage(page);
    await worksheetPage.goto();
    await worksheetPage.waitForPageReady();

    // Click on Fractions category
    await worksheetPage.selectCategory('Fractions');

    // Should navigate to /fractions
    await expect(page).toHaveURL(/\/fractions$/);

    // Should show subcategories
    await expect(page.getByRole('heading', { name: /fractions/i })).toBeVisible();
    await expect(page.getByRole('link', { name: /addition/i })).toBeVisible();
  });

  test('should navigate to worksheet page from subcategory', async ({ page }) => {
    const worksheetPage = new WorksheetPage(page);
    await worksheetPage.gotoCategory('fractions');
    await worksheetPage.waitForPageReady();

    // Click on Addition subcategory
    await worksheetPage.selectSubcategory('Addition');

    // Should navigate to /fractions/addition
    await expect(page).toHaveURL(/\/fractions\/addition/);

    // Should show problems
    await expect(worksheetPage.problemsList).toBeVisible();
  });
});
