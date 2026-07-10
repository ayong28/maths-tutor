import { test, expect } from '@playwright/test';
import { WorksheetPage } from '../pages/WorksheetPage';

/**
 * E2E-001: Homepage & Initial Load
 * Tests the initial page load, hero section, and category loading
 * Updated for React Router 7 URL-based routing and "Geometric Scholar" design
 */
test.describe('Homepage & Initial Load', () => {
  test('should display hero section on initial load', async ({ page }) => {
    const worksheetPage = new WorksheetPage(page);
    await worksheetPage.goto();

    await expect(worksheetPage.heroHeading).toBeVisible();
    await expect(page.getByRole('heading', { name: /master maths with/i })).toBeVisible();
    await expect(page.getByText(/practice worksheets/i)).toBeVisible();
    await expect(worksheetPage.heroDescription).toBeVisible();
  });

  test('should load categories from API', async ({ page }) => {
    const worksheetPage = new WorksheetPage(page);
    await worksheetPage.goto();
    await worksheetPage.waitForPageReady();

    await expect(page.getByRole('link', { name: /fractions/i }).first()).toBeVisible();
    await expect(page.getByRole('link', { name: /algebra/i }).first()).toBeVisible();

    await worksheetPage.verifyNoErrors();
  });

  test('should have no console errors on load', async ({ page }) => {
    const consoleErrors: string[] = [];
    page.on('console', (msg) => {
      if (msg.type() === 'error') consoleErrors.push(msg.text());
    });

    const worksheetPage = new WorksheetPage(page);
    await worksheetPage.goto();
    await worksheetPage.waitForPageReady();

    expect(consoleErrors).toHaveLength(0);
  });

  test('should navigate to category page when clicking category link', async ({ page }) => {
    const worksheetPage = new WorksheetPage(page);
    await worksheetPage.goto();
    await worksheetPage.waitForPageReady();

    await worksheetPage.selectCategory('Fractions');

    await expect(page).toHaveURL(/\/fractions$/);
    await expect(page.getByRole('heading', { name: /fractions/i })).toBeVisible();
    await expect(page.getByRole('link', { name: /addition/i }).first()).toBeVisible();
  });

  test('should navigate to worksheet page from subcategory', async ({ page }) => {
    const worksheetPage = new WorksheetPage(page);
    await worksheetPage.gotoCategory('fractions');
    await worksheetPage.waitForPageReady();

    await worksheetPage.selectSubcategory('Addition');

    await expect(page).toHaveURL(/\/fractions\/addition/);
    await expect(worksheetPage.problemsList).toBeVisible();
  });

  test('should display sidebar navigation', async ({ page }) => {
    const worksheetPage = new WorksheetPage(page);
    await worksheetPage.goto();

    await expect(worksheetPage.sidebar).toBeVisible();
    await expect(worksheetPage.sidebarLogo).toBeVisible();
    await expect(page.getByRole('link', { name: /all topics/i }).first()).toBeVisible();
  });
});
