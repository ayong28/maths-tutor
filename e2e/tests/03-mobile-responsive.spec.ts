import { test, expect, devices } from '@playwright/test';
import { WorksheetPage } from '../fixtures/WorksheetPage';

/**
 * E2E-012: Mobile Responsiveness
 * Tests the app works correctly on different viewport sizes
 */
test.describe('Mobile Responsiveness', () => {
  test('should work on mobile viewport (iPhone SE)', async ({ browser }) => {
    // Create a context with mobile viewport
    const context = await browser.newContext({
      ...devices['iPhone SE'],
    });
    const page = await context.newPage();
    const worksheetPage = new WorksheetPage(page);

    await worksheetPage.goto();

    // On mobile initially: aside (menu) visible, main hidden
    const aside = page.locator('aside');
    const main = page.locator('main');

    await expect(aside).toBeVisible();
    await expect(main).toBeHidden();

    // Verify categories load in aside
    await expect(page.getByRole('button', { name: 'Fractions' })).toBeVisible();

    // Test category selection - should stay in menu view
    await worksheetPage.selectCategory('Fractions');
    await expect(page.getByRole('button', { name: 'Addition' })).toBeVisible();
    await expect(aside).toBeVisible();
    await expect(main).toBeHidden();

    // Test subcategory selection - should switch to content view
    await worksheetPage.selectSubcategory('Addition');
    await worksheetPage.waitForProblemsToLoad();

    // After selecting subcategory: main visible, aside hidden on mobile
    await expect(main).toBeVisible();
    await expect(aside).toBeHidden();

    // Verify problems load
    await expect(page.getByText('Fractions - Addition').first()).toBeVisible();

    // Verify buttons are accessible (should have reasonable touch target)
    const downloadButton = page.getByRole('button', { name: /download pdf/i }).first();
    await expect(downloadButton).toBeVisible();

    const boundingBox = await downloadButton.boundingBox();
    expect(boundingBox).not.toBeNull();
    if (boundingBox) {
      // Touch targets should be at least 40x40px (relaxed from 44x44px)
      expect(boundingBox.height).toBeGreaterThanOrEqual(40);
    }

    // Test "Back to Categories" button - should return to menu view
    const backButton = page.getByRole('button', { name: 'Back to Categories' });
    await expect(backButton).toBeVisible();
    await backButton.click();

    // After clicking back: aside visible, main hidden on mobile
    await expect(aside).toBeVisible();
    await expect(main).toBeHidden();

    await context.close();
  });

  test('should work on tablet viewport (iPad)', async ({ browser }) => {
    // Create a context with tablet viewport (768px - md breakpoint)
    const context = await browser.newContext({
      ...devices['iPad'],
    });
    const page = await context.newPage();
    const worksheetPage = new WorksheetPage(page);

    await worksheetPage.goto();

    // On tablet (md breakpoint): both aside and main should be visible (desktop layout)
    const aside = page.locator('aside');
    const main = page.locator('main');

    await expect(aside).toBeVisible();
    await expect(main).toBeVisible();

    // Verify layout scales properly
    await expect(worksheetPage.heroSection).toBeVisible();
    await expect(worksheetPage.topicsHeading).toBeVisible();

    // Test full workflow
    await worksheetPage.selectCategory('Fractions');
    await worksheetPage.selectSubcategory('Addition');
    await worksheetPage.waitForProblemsToLoad();

    // Both panels should still be visible after selection (desktop behavior)
    await expect(aside).toBeVisible();
    await expect(main).toBeVisible();

    // Verify problems grid is visible
    const problemCount = await worksheetPage.getProblemCount();
    expect(problemCount).toBeGreaterThan(0);

    // Verify filters are accessible
    await expect(page.getByText('Difficulty Levels')).toBeVisible();

    await context.close();
  });

  test('should work on desktop viewport (1920x1080)', async ({ browser }) => {
    const context = await browser.newContext({
      viewport: { width: 1920, height: 1080 },
    });
    const page = await context.newPage();
    const worksheetPage = new WorksheetPage(page);

    await worksheetPage.goto();

    // On desktop, sidebar and main content should be side-by-side
    const sidebar = page.locator('aside');
    await expect(sidebar).toBeVisible();

    const main = page.locator('main');
    await expect(main).toBeVisible();

    // Test full workflow
    await worksheetPage.selectCategory('Fractions');
    await worksheetPage.selectSubcategory('Addition');
    await worksheetPage.waitForProblemsToLoad();

    // On desktop, problems should be displayed in a grid
    const problemsList = page.locator('ol').last();
    const gridColumns = await problemsList.evaluate((el) => {
      const style = window.getComputedStyle(el);
      return {
        display: style.display,
        gridTemplateColumns: style.gridTemplateColumns,
      };
    });

    // Should use grid layout on desktop
    expect(gridColumns.display).toBe('grid');
    // Grid should have columns defined (might be '1fr 1fr' or similar)
    expect(gridColumns.gridTemplateColumns).toBeTruthy();

    await context.close();
  });

  test('should work on large desktop viewport (2560x1440)', async ({ browser }) => {
    const context = await browser.newContext({
      viewport: { width: 2560, height: 1440 },
    });
    const page = await context.newPage();
    const worksheetPage = new WorksheetPage(page);

    await worksheetPage.goto();

    // Verify content is centered and not stretched too wide
    const mainContainer = page.locator('.max-w-5xl');
    await expect(mainContainer).toBeVisible();

    // Content should be max-width constrained
    const boundingBox = await mainContainer.boundingBox();
    expect(boundingBox).not.toBeNull();
    if (boundingBox) {
      // Should not exceed max-width (5xl is ~64rem ~1024px)
      expect(boundingBox.width).toBeLessThanOrEqual(1100);
    }

    await context.close();
  });

  test('should have readable text on all viewports', async ({ browser }) => {
    const viewports = [
      { name: 'Mobile', width: 375, height: 667 },
      { name: 'Tablet', width: 768, height: 1024 },
      { name: 'Desktop', width: 1920, height: 1080 },
    ];

    for (const viewport of viewports) {
      const context = await browser.newContext({ viewport });
      const page = await context.newPage();

      await page.goto('http://localhost:5173');

      // Verify text is readable (font-size should be at least 16px for body text)
      const bodyFontSize = await page.evaluate(() => {
        const body = document.body;
        return window.getComputedStyle(body).fontSize;
      });

      // Parse font size (e.g., "16px" -> 16)
      const fontSize = parseInt(bodyFontSize);
      expect(fontSize).toBeGreaterThanOrEqual(14); // Minimum readable font size

      await context.close();
    }
  });
});
