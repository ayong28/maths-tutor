import { test, expect, devices } from "@playwright/test";
import { WorksheetPage } from "../fixtures/WorksheetPage";

/**
 * E2E-012: Mobile Responsiveness
 * Tests the app works correctly on different viewport sizes
 * Updated for React Router 7 URL-based routing
 */
test.describe("Mobile Responsiveness", () => {
  test("should work on mobile viewport (iPhone SE)", async ({ browser }) => {
    const context = await browser.newContext({
      ...devices["iPhone SE"],
    });
    const page = await context.newPage();
    const worksheetPage = new WorksheetPage(page);

    // Test homepage on mobile
    await worksheetPage.goto();
    await worksheetPage.waitForPageReady();

    // Verify hero is visible
    await expect(worksheetPage.heroHeading).toBeVisible();

    // Sidebar is hidden on mobile, hamburger menu should be visible
    await expect(worksheetPage.mobileMenuButton).toBeVisible();

    // Open mobile sidebar and verify fractions link is accessible
    await worksheetPage.openMobileSidebar();
    await expect(worksheetPage.sidebar).toBeVisible();

    // Navigate to worksheet page directly (sidebar closes on navigation)
    await worksheetPage.gotoWorksheet("fractions", "addition");
    await worksheetPage.waitForPageReady();

    // On mobile, main content should be visible, sidebar hidden
    const main = page.locator("main");
    await expect(main).toBeVisible();

    // Verify problems load
    await expect(worksheetPage.problemsList).toBeVisible();

    // Verify Download PDF button is accessible
    const downloadButton = worksheetPage.downloadPdfButton;
    await expect(downloadButton).toBeVisible();

    const boundingBox = await downloadButton.boundingBox();
    expect(boundingBox).not.toBeNull();
    if (boundingBox) {
      // Touch targets should be at least 40x40px
      expect(boundingBox.height).toBeGreaterThanOrEqual(40);
    }

    await context.close();
  });

  test("should work on tablet viewport (iPad)", async ({ browser }) => {
    const context = await browser.newContext({
      ...devices["iPad"],
    });
    const page = await context.newPage();
    const worksheetPage = new WorksheetPage(page);

    // Test homepage on tablet
    await worksheetPage.goto();
    await worksheetPage.waitForPageReady();

    // Verify hero and categories visible
    await expect(worksheetPage.heroHeading).toBeVisible();
    await expect(worksheetPage.fractionsLink).toBeVisible();

    // Navigate to worksheet page
    await worksheetPage.gotoWorksheet("fractions", "addition");
    await worksheetPage.waitForPageReady();

    // On tablet, both aside and main should be visible side-by-side
    const aside = page.locator("aside");
    const main = page.locator("main");

    await expect(aside).toBeVisible();
    await expect(main).toBeVisible();

    // Verify problems grid is visible
    const problemCount = await worksheetPage.getProblemCount();
    expect(problemCount).toBeGreaterThan(0);

    await context.close();
  });

  test("should work on desktop viewport (1920x1080)", async ({ browser }) => {
    const context = await browser.newContext({
      viewport: { width: 1920, height: 1080 },
    });
    const page = await context.newPage();
    const worksheetPage = new WorksheetPage(page);

    await worksheetPage.goto();
    await worksheetPage.waitForPageReady();

    // Navigate to worksheet
    await worksheetPage.gotoWorksheet("fractions", "addition");
    await worksheetPage.waitForPageReady();

    // On desktop, sidebar and main content should be side-by-side
    const sidebar = page.locator("aside");
    await expect(sidebar).toBeVisible();

    const main = page.locator("main");
    await expect(main).toBeVisible();

    // On desktop, problems should be displayed in a grid
    const problemsList = page.locator("ol").last();
    const gridColumns = await problemsList.evaluate((el) => {
      const style = window.getComputedStyle(el);
      return {
        display: style.display,
        gridTemplateColumns: style.gridTemplateColumns,
      };
    });

    // Should use grid layout on desktop
    expect(gridColumns.display).toBe("grid");

    await context.close();
  });

  test("should work on large desktop viewport (2560x1440)", async ({
    browser,
  }) => {
    const context = await browser.newContext({
      viewport: { width: 2560, height: 1440 },
    });
    const page = await context.newPage();
    const worksheetPage = new WorksheetPage(page);

    await worksheetPage.goto();
    await worksheetPage.waitForPageReady();

    // Verify content is centered and not stretched too wide
    // const mainContainer = page.locator(".max-w-5xl");
    await expect(worksheetPage.heroDescription).toBeVisible();

    // Content should be max-width constrained
    const boundingBox = await worksheetPage.heroDescription.boundingBox();
    expect(boundingBox).not.toBeNull();
    if (boundingBox) {
      // Should not exceed max-width (5xl is ~64rem ~1024px)
      expect(boundingBox.width).toBeLessThanOrEqual(1100);
    }

    await context.close();
  });

  test("should have readable text on all viewports", async ({ browser }) => {
    const viewports = [
      { name: "Mobile", width: 375, height: 667 },
      { name: "Tablet", width: 768, height: 1024 },
      { name: "Desktop", width: 1920, height: 1080 },
    ];

    for (const viewport of viewports) {
      const context = await browser.newContext({ viewport });
      const page = await context.newPage();

      await page.goto("/");
      await page.waitForLoadState("networkidle");

      // Verify text is readable (font-size should be at least 14px for body text)
      const bodyFontSize = await page.evaluate(() => {
        const body = document.body;
        return window.getComputedStyle(body).fontSize;
      });

      // Parse font size (e.g., "16px" -> 16)
      const fontSize = parseInt(bodyFontSize);
      expect(fontSize).toBeGreaterThanOrEqual(14);

      await context.close();
    }
  });
});
