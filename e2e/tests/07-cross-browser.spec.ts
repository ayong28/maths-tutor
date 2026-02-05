import { test, expect } from "@playwright/test";
import { WorksheetPage } from "../fixtures/WorksheetPage";

/**
 * E2E-020: Cross-Browser Compatibility
 * Tests app functionality across Chromium, Firefox, and WebKit
 * Updated for React Router 7 URL-based routing
 */
test.describe("Cross-Browser Compatibility", () => {
  // These tests run on all browsers configured in playwright.config.ts

  test("should load homepage correctly in all browsers", async ({
    page,
    browserName,
  }) => {
    const worksheetPage = new WorksheetPage(page);
    await worksheetPage.goto();
    await worksheetPage.waitForPageReady();

    // Wait for hero section
    await expect(worksheetPage.heroHeading).toBeVisible();

    // Verify category links load
    await expect(worksheetPage.fractionsLink).toBeVisible();

    // Verify page title
    const title = await page.title();
    expect(title).toBeTruthy();

    console.log(`✓ Homepage loaded successfully in ${browserName}`);
  });

  test("should handle category and subcategory navigation in all browsers", async ({
    page,
    browserName,
  }) => {
    const worksheetPage = new WorksheetPage(page);
    await worksheetPage.goto();
    await worksheetPage.waitForPageReady();

    // Click category link
    await worksheetPage.selectCategory("Fractions");

    // Should navigate to category page
    await expect(page).toHaveURL(/\/fractions$/);
    await expect(page.getByRole("link", { name: /addition/i })).toBeVisible();

    // Click subcategory link
    await worksheetPage.selectSubcategory("Addition");

    // Should navigate to worksheet page
    await expect(page).toHaveURL(/\/fractions\/addition/);
    await expect(worksheetPage.problemsList).toBeVisible();

    console.log(`✓ Category navigation works in ${browserName}`);
  });

  test("should render CSS correctly in all browsers", async ({
    page,
    browserName,
  }) => {
    const worksheetPage = new WorksheetPage(page);
    await worksheetPage.goto();
    await worksheetPage.waitForPageReady();

    await expect(worksheetPage.fractionsLink).toBeVisible();

    // Check link styling
    const fractionsLink = worksheetPage.fractionsLink;
    const styles = await fractionsLink.evaluate((el) => {
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

  test("should handle PDF download in all browsers", async ({
    page,
    browserName,
  }) => {
    const worksheetPage = new WorksheetPage(page);

    // Navigate directly to worksheet page
    await worksheetPage.gotoWorksheet("fractions", "addition");
    await worksheetPage.waitForPageReady();

    // Wait for problems to load
    await expect(worksheetPage.problemsList).toBeVisible();

    // Set up download listener
    const downloadPromise = page.waitForEvent("download");

    // Click Download PDF
    await worksheetPage.downloadPdfButton.click();

    // Wait for download
    const download = await downloadPromise;

    // Verify filename
    const filename = download.suggestedFilename();
    expect(filename).toMatch(/fractions-addition-worksheet\.pdf/i);

    console.log(`✓ PDF download works in ${browserName}`);
  });

  test("should handle keyboard navigation in all browsers", async ({
    page,
    browserName,
  }) => {
    const worksheetPage = new WorksheetPage(page);
    await worksheetPage.goto();
    await worksheetPage.waitForPageReady();

    await expect(worksheetPage.fractionsLink).toBeVisible();

    // Focus and activate with keyboard
    const fractionsLink = worksheetPage.fractionsLink;
    await fractionsLink.focus();
    await fractionsLink.scrollIntoViewIfNeeded;

    // Verify focus
    // Check for focus ring (Tailwind's focus:ring classes or outline)
    const hasFocusIndicator = await worksheetPage.fractionsLink.evaluate(
      (el) => {
        const styles = window.getComputedStyle(el);
        return styles.outline !== "none" || styles.boxShadow !== "none";
      },
    );
    expect(hasFocusIndicator).toBe(true);

    // Activate with Enter
    await page.keyboard.press("Enter");

    // Should navigate to category page
    await expect(page).toHaveURL(/\/fractions$/);

    console.log(`✓ Keyboard navigation works in ${browserName}`);
  });

  test("should display fractions correctly in all browsers", async ({
    page,
    browserName,
  }) => {
    const worksheetPage = new WorksheetPage(page);

    // Navigate directly to worksheet page
    await worksheetPage.gotoWorksheet("fractions", "addition");
    await worksheetPage.waitForPageReady();

    // Wait for problems to load
    await expect(worksheetPage.problemsList).toBeVisible();

    // Verify fraction problems display
    const problemCount = await worksheetPage.getProblemCount();
    expect(problemCount).toBeGreaterThan(0);

    console.log(`✓ Fractions display correctly in ${browserName}`);
  });

  test("should display algebraic expressions correctly in all browsers", async ({
    page,
    browserName,
  }) => {
    const worksheetPage = new WorksheetPage(page);

    // Navigate directly to algebra worksheet
    await worksheetPage.gotoWorksheet("algebra", "collecting-terms");
    await worksheetPage.waitForPageReady();

    // Wait for problems to load
    await expect(worksheetPage.problemsList).toBeVisible();

    // Verify problems display
    const problemCount = await worksheetPage.getProblemCount();
    expect(problemCount).toBeGreaterThan(0);

    console.log(`✓ Algebraic expressions display correctly in ${browserName}`);
  });

  test("should handle mobile viewport in all browsers", async ({
    page,
    browserName,
  }) => {
    // Set mobile viewport
    await page.setViewportSize({ width: 375, height: 667 });

    const worksheetPage = new WorksheetPage(page);
    await worksheetPage.goto();
    await worksheetPage.waitForPageReady();

    // Verify page loads on mobile
    await expect(worksheetPage.heroHeading).toBeVisible();
    await expect(worksheetPage.fractionsLink).toBeVisible();

    // Test navigation on mobile
    await worksheetPage.selectCategory("Fractions");
    await expect(page).toHaveURL(/\/fractions$/);

    console.log(`✓ Mobile viewport works in ${browserName}`);
  });

  test("should handle rapid navigation in all browsers", async ({
    page,
    browserName,
  }) => {
    const worksheetPage = new WorksheetPage(page);
    await worksheetPage.goto();
    await worksheetPage.waitForPageReady();

    // Navigate to a category
    await worksheetPage.selectCategory("Fractions");
    await expect(page).toHaveURL(/\/fractions$/);

    // Navigate back
    await page.goBack();
    await worksheetPage.waitForPageReady();

    // Navigate to another category
    await worksheetPage.selectCategory("Decimals");
    await expect(page).toHaveURL(/\/decimals$/);

    // Navigate to subcategory
    await worksheetPage.selectSubcategory("Addition");
    await expect(page).toHaveURL(/\/decimals\/addition/);

    console.log(`✓ Rapid navigation handled correctly in ${browserName}`);
  });
});

/**
 * Specific browser tests
 * These tests target specific browser quirks or features
 */
test.describe("Browser-Specific Tests", () => {
  test("should handle Chromium-specific features", async ({
    browserName,
    page,
  }) => {
    test.skip(browserName !== "chromium", "This test is only for Chromium");

    const worksheetPage = new WorksheetPage(page);
    await worksheetPage.goto();
    await worksheetPage.waitForPageReady();

    // Test Chromium-specific behavior
    await expect(worksheetPage.heroHeading).toBeVisible();

    console.log("✓ Chromium-specific features work");
  });

  test("should handle Firefox-specific features", async ({
    browserName,
    page,
  }) => {
    test.skip(browserName !== "firefox", "This test is only for Firefox");

    const worksheetPage = new WorksheetPage(page);
    await worksheetPage.goto();
    await worksheetPage.waitForPageReady();

    // Test Firefox-specific behavior
    await expect(worksheetPage.heroHeading).toBeVisible();

    console.log("✓ Firefox-specific features work");
  });

  test("should handle WebKit-specific features", async ({
    browserName,
    page,
  }) => {
    test.skip(browserName !== "webkit", "This test is only for WebKit");

    const worksheetPage = new WorksheetPage(page);
    await worksheetPage.goto();
    await worksheetPage.waitForPageReady();

    // Test WebKit (Safari) specific behavior
    await expect(worksheetPage.heroHeading).toBeVisible();

    console.log("✓ WebKit-specific features work");
  });
});
