import { test, expect, devices } from '@playwright/test';
import { WorksheetPage } from '../pages/WorksheetPage';

/**
 * E2E-012: Mobile Responsiveness
 * Tests the app works correctly on different viewport sizes
 * Updated for React Router 7 URL-based routing
 */
test.describe('Mobile Responsiveness', () => {
  test('should work on mobile viewport (iPhone SE)', async ({ browser }) => {
    const context = await browser.newContext({
      ...devices['iPhone SE'],
    });
    const page = await context.newPage();
    const worksheetPage = new WorksheetPage(page);

    await worksheetPage.goto();
    await worksheetPage.waitForPageReady();

    await expect(worksheetPage.heroHeading).toBeVisible();
    await expect(worksheetPage.mobileMenuButton).toBeVisible();
    await worksheetPage.openMobileSidebar();
    await expect(worksheetPage.sidebar).toBeVisible();

    await worksheetPage.gotoWorksheet('fractions', 'addition');
    await worksheetPage.waitForPageReady();

    await page.setViewportSize({ width: 375, height: 667 });

    const main = page.locator('main');
    await expect(main).toBeVisible();
    await expect(worksheetPage.problemsList).toBeVisible();

    const downloadButton = worksheetPage.downloadPdfButton;
    await expect(downloadButton).toBeVisible();

    const boundingBox = await downloadButton.boundingBox();
    expect(boundingBox).not.toBeNull();
    if (boundingBox) {
      expect(boundingBox.height).toBeGreaterThanOrEqual(40);
    }

    await context.close();
  });

  test('should work on tablet viewport (iPad)', async ({ browser }) => {
    const context = await browser.newContext({
      ...devices['iPad'],
    });
    const page = await context.newPage();
    const worksheetPage = new WorksheetPage(page);

    await worksheetPage.goto();
    await worksheetPage.waitForPageReady();

    await expect(worksheetPage.fractionsLink).toBeVisible();

    await worksheetPage.gotoWorksheet('fractions', 'addition');
    await worksheetPage.waitForPageReady();

    const aside = page.locator('aside');
    const main = page.locator('main');

    await expect(aside).toBeVisible();
    await expect(main).toBeVisible();

    const problemCount = await worksheetPage.getProblemCount();
    expect(problemCount).toBeGreaterThan(0);

    await context.close();
  });

  test('should work on desktop viewport (1920x1080)', async ({ browser }) => {
    const context = await browser.newContext({
      viewport: { width: 1920, height: 1080 },
    });
    const page = await context.newPage();
    const worksheetPage = new WorksheetPage(page);

    await worksheetPage.goto();
    await worksheetPage.waitForPageReady();

    await worksheetPage.gotoWorksheet('fractions', 'addition');
    await worksheetPage.waitForPageReady();

    const sidebar = page.locator('aside');
    await expect(sidebar).toBeVisible();

    const main = page.locator('main');
    await expect(main).toBeVisible();

    const problemsList = page.locator('ol').last();
    const gridColumns = await problemsList.evaluate((el) => {
      const style = window.getComputedStyle(el);
      return {
        display: style.display,
        gridTemplateColumns: style.gridTemplateColumns,
      };
    });

    expect(gridColumns.display).toBe('grid');

    await context.close();
  });

  test('should work on large desktop viewport (2560x1440)', async ({ browser }) => {
    const context = await browser.newContext({
      viewport: { width: 2560, height: 1440 },
    });
    const page = await context.newPage();
    const worksheetPage = new WorksheetPage(page);

    await worksheetPage.goto();
    await worksheetPage.waitForPageReady();

    await expect(worksheetPage.heroDescription).toBeVisible();

    const boundingBox = await worksheetPage.heroDescription.boundingBox();
    expect(boundingBox).not.toBeNull();
    if (boundingBox) {
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

      await page.goto('/');
      await page.waitForLoadState('networkidle');

      const bodyFontSize = await page.evaluate(() => {
        const body = document.body;
        return window.getComputedStyle(body).fontSize;
      });

      const fontSize = parseInt(bodyFontSize);
      expect(fontSize).toBeGreaterThanOrEqual(14);

      await context.close();
    }
  });
});
