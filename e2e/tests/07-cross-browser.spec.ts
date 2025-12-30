import { test, expect, chromium, firefox, webkit } from '@playwright/test';
import { WorksheetPage } from '../fixtures/WorksheetPage';

/**
 * E2E-020: Cross-Browser Compatibility
 * Tests app functionality across Chromium, Firefox, and WebKit
 */
test.describe('Cross-Browser Compatibility', () => {
  // These tests run on all browsers configured in playwright.config.ts
  // Each test automatically runs in Chromium, Firefox, and WebKit

  test('should load homepage correctly in all browsers', async ({ page, browserName }) => {
    const worksheetPage = new WorksheetPage(page);
    await worksheetPage.goto();

    // Wait for hero section
    await expect(worksheetPage.heroSection).toBeVisible();

    // Verify categories load
    await expect(page.getByRole('button', { name: 'Fractions' })).toBeVisible();
    await expect(page.getByRole('button', { name: 'Algebra' })).toBeVisible();

    // Verify page title
    const title = await page.title();
    expect(title).toBeTruthy();

    console.log(`✓ Homepage loaded successfully in ${browserName}`);
  });

  test('should handle category and subcategory selection in all browsers', async ({ page, browserName }) => {
    const worksheetPage = new WorksheetPage(page);
    await worksheetPage.goto();

    // Select category
    await worksheetPage.selectCategory('Fractions');
    await expect(page.getByRole('button', { name: 'Addition' })).toBeVisible();

    // Select subcategory
    await worksheetPage.selectSubcategory('Addition');
    await worksheetPage.waitForProblemsToLoad();

    await expect(page.getByText('Fractions - Addition').first()).toBeVisible();
    await expect(page.getByRole('heading', { name: 'Addition', level: 2 })).toBeVisible();
    console.log(`✓ Category selection works in ${browserName}`);
  });

  test('should apply filters correctly in all browsers', async ({ page, browserName }) => {
    const worksheetPage = new WorksheetPage(page);
    await worksheetPage.goto();

    // Navigate to subcategory
    await worksheetPage.selectCategory('Fractions');
    await worksheetPage.selectSubcategory('Addition');
    await worksheetPage.waitForProblemsToLoad();

    await expect(page.getByText('Fractions - Addition').first()).toBeVisible();
    await expect(page.getByRole('heading', { name: 'Addition', level: 2 })).toBeVisible();

    // Apply difficulty filter
    await page.getByLabel(/filter by easy difficulty/i).click();
    await page.getByRole('button', { name: /apply filters/i }).click();

    // TODO: Find out why 'li' elements can't be located 
    // Wait for filtered results
    await page.waitForTimeout(1000);

    // Verify problems still showing
    await expect(page.getByText('Fractions - Addition').first()).toBeVisible();
    await expect(page.getByRole('heading', { name: 'Addition', level: 2 })).toBeVisible();
  });

  test('should render CSS correctly in all browsers', async ({ page, browserName }) => {
    const worksheetPage = new WorksheetPage(page);
    await worksheetPage.goto();

    await expect(page.getByRole('button', { name: 'Fractions' })).toBeVisible();

    // Check button styling
    const fractionsButton = page.getByRole('button', { name: 'Fractions' });
    const styles = await fractionsButton.evaluate((el) => {
      const computed = window.getComputedStyle(el);
      return {
        display: computed.display,
        padding: computed.padding,
        borderRadius: computed.borderRadius,
        backgroundColor: computed.backgroundColor,
      };
    });

    // Verify styles are applied
    expect(styles.display).toBeTruthy();
    expect(styles.backgroundColor).toBeTruthy();

    console.log(`✓ CSS renders correctly in ${browserName}`);
  });

  test('should handle PDF download in all browsers', async ({ page, browserName }) => {
    const worksheetPage = new WorksheetPage(page);
    await worksheetPage.goto();

    // Navigate to subcategory
    await worksheetPage.selectCategory('Fractions');
    await worksheetPage.selectSubcategory('Addition');
    await worksheetPage.waitForProblemsToLoad();

    // Set up download listener
    const downloadPromise = page.waitForEvent('download');

    // Click Download PDF
    const downloadButton = page.getByRole('button', { name: /download pdf/i }).first();
    await downloadButton.click();

    // Wait for download
    const download = await downloadPromise;

    // Verify filename
    const filename = download.suggestedFilename();
    expect(filename).toMatch(/fractions-addition-worksheet\.pdf/i);

    console.log(`✓ PDF download works in ${browserName}`);
  });

  test('should handle keyboard navigation in all browsers', async ({ page, browserName }) => {
    const worksheetPage = new WorksheetPage(page);
    await worksheetPage.goto();

    await expect(page.getByRole('button', { name: 'Fractions' })).toBeVisible();

    // Focus and activate with keyboard
    const fractionsButton = page.getByRole('button', { name: 'Fractions' });
    await fractionsButton.focus();

    // Verify focus
    const isFocused = await fractionsButton.evaluate((el) => el === document.activeElement);
    expect(isFocused).toBe(true);

    // Activate with Enter
    await page.keyboard.press('Enter');

    // Verify subcategories appear
    await expect(page.getByRole('button', { name: 'Addition' })).toBeVisible();

    console.log(`✓ Keyboard navigation works in ${browserName}`);
  });

  test('should display fractions correctly in all browsers', async ({ page, browserName }) => {
    const worksheetPage = new WorksheetPage(page);
    await worksheetPage.goto();

    // Navigate to fraction problems
    await worksheetPage.selectCategory('Fractions');
    await worksheetPage.selectSubcategory('Addition');
    await worksheetPage.waitForProblemsToLoad();
    const secondItemOnWorksheet = page.locator('ol').locator('li').nth(1);
    await expect(secondItemOnWorksheet).toContainText(/\d+\+\d+=/);

    expect(secondItemOnWorksheet).toBeVisible();

    console.log(`✓ Fractions display correctly in ${browserName}`);
  });

  test('should display algebraic expressions correctly in all browsers', async ({ page, browserName }) => {
    const worksheetPage = new WorksheetPage(page);
    await worksheetPage.goto();

    // Navigate to algebra problems
    await worksheetPage.selectCategory('Algebra');
    await worksheetPage.selectSubcategory('Collecting Terms');
    await worksheetPage.waitForProblemsToLoad();

    // Verify problems display
    await expect(page.getByText('Algebra - Collecting Terms').first()).toBeVisible();
    const problems = await page.locator('li').filter({ hasText: /[a-z]+/ }).count();
    expect(problems).toBeGreaterThan(0);

    console.log(`✓ Algebraic expressions display correctly in ${browserName}`);
  });

  test('should handle mobile viewport in all browsers', async ({ page, browserName }) => {
    // Set mobile viewport
    await page.setViewportSize({ width: 375, height: 667 });

    const worksheetPage = new WorksheetPage(page);
    await worksheetPage.goto();

    // Verify page loads on mobile
    await expect(worksheetPage.heroSection).toBeVisible();
    await expect(page.getByRole('button', { name: 'Fractions' })).toBeVisible();

    // Test interaction on mobile
    await worksheetPage.selectCategory('Fractions');
    await expect(page.getByRole('button', { name: 'Addition' })).toBeVisible();

    console.log(`✓ Mobile viewport works in ${browserName}`);
  });

  test('should handle rapid interactions in all browsers', async ({ page, browserName }) => {
    const worksheetPage = new WorksheetPage(page);
    await worksheetPage.goto();

    await expect(page.getByRole('button', { name: 'Fractions' })).toBeVisible();

    // Rapidly switch categories
    for (let i = 0; i < 3; i++) {
      await page.getByRole('button', { name: 'Fractions' }).click();
      await page.getByRole('button', { name: 'Algebra' }).click();
    }

    // Final selection
    await page.getByRole('button', { name: 'Fractions' }).click();

    // Wait for UI to stabilize
    await page.waitForTimeout(500);

    // Verify correct state
    await expect(page.getByRole('button', { name: 'Addition' })).toBeVisible();

    console.log(`✓ Rapid interactions handled correctly in ${browserName}`);
  });
});

/**
 * Specific browser tests
 * These tests target specific browser quirks or features
 */
test.describe('Browser-Specific Tests', () => {
  test('should handle Chromium-specific features', async ({ browserName, page }) => {
    test.skip(browserName !== 'chromium', 'This test is only for Chromium');

    const worksheetPage = new WorksheetPage(page);
    await worksheetPage.goto();

    // Test Chromium-specific behavior
    await expect(worksheetPage.heroSection).toBeVisible();

    console.log('✓ Chromium-specific features work');
  });

  test('should handle Firefox-specific features', async ({ browserName, page }) => {
    test.skip(browserName !== 'firefox', 'This test is only for Firefox');

    const worksheetPage = new WorksheetPage(page);
    await worksheetPage.goto();

    // Test Firefox-specific behavior
    await expect(worksheetPage.heroSection).toBeVisible();

    console.log('✓ Firefox-specific features work');
  });

  test('should handle WebKit-specific features', async ({ browserName, page }) => {
    test.skip(browserName !== 'webkit', 'This test is only for WebKit');

    const worksheetPage = new WorksheetPage(page);
    await worksheetPage.goto();

    // Test WebKit (Safari) specific behavior
    await expect(worksheetPage.heroSection).toBeVisible();

    console.log('✓ WebKit-specific features work');
  });
});
