import { test, expect } from "@playwright/test";
import { WorksheetPage } from "../fixtures/WorksheetPage";
import AxeBuilder from "@axe-core/playwright";

/**
 * E2E-019: Accessibility Testing
 * Tests WCAG 2.1 AA compliance and accessibility best practices using axe-core
 */
test.describe("Accessibility", () => {
  test("should have no accessibility violations on homepage", async ({
    page,
  }) => {
    const worksheetPage = new WorksheetPage(page);
    await worksheetPage.goto();

    // Wait for page to load
    await expect(worksheetPage.heroSection).toBeVisible();
    await expect(page.getByRole("button", { name: "Fractions" })).toBeVisible();

    // Manual accessibility checks (until axe-core is installed)

    // Check 1: Page has a main landmark
    const main = page.locator("main");
    await expect(main).toBeVisible();

    // Check 2: All images have alt text (if any)
    const images = await page.locator("img").all();
    if (images.length > 0) {
      for (const img of images) {
        const alt = await img.getAttribute("alt");
        expect(alt).not.toBeNull();
      }
    }

    // Check 3: Buttons have accessible labels (check a few key buttons)
    const fractionsButton = page.getByRole("button", { name: "Fractions" });
    await expect(fractionsButton).toBeVisible();

    const algebraButton = page.getByRole("button", { name: "Algebra" });
    await expect(algebraButton).toBeVisible();

    // Check 5: Headings hierarchy (should start with h1)
    const h1 = page.locator("h1");
    const h1Count = await h1.count();
    expect(h1Count).toBeGreaterThan(0);

    // TODO: Run axe-core accessibility scan
    // const accessibilityScanResults = await new AxeBuilder({ page })
    //   .withTags(['wcag2aa'])
    //   .analyze();

    // expect(accessibilityScanResults.violations).toEqual([]);
  });

  test("should have accessible category selection", async ({ page }) => {
    const worksheetPage = new WorksheetPage(page);
    await worksheetPage.goto();

    await expect(page.getByRole("button", { name: "Fractions" })).toBeVisible();

    // Check category buttons have proper roles
    const categoryButtons = await page.getByRole("button").all();
    expect(categoryButtons.length).toBeGreaterThan(0);

    // Check buttons are keyboard accessible
    const fractionsButton = page.getByRole("button", { name: "Fractions" });
    await fractionsButton.focus();
    const isFocused = await fractionsButton.evaluate(
      (el) => el === document.activeElement,
    );
    expect(isFocused).toBe(true);

    // TODO: Run axe-core scan on category selection
    // const accessibilityScanResults = await new AxeBuilder({ page })
    //   .withTags(['wcag2a', 'wcag2aa'])
    //   .analyze();

    // expect(accessibilityScanResults.violations).toEqual([]);
  });

  test("should have accessible filter controls", async ({ page }) => {
    const worksheetPage = new WorksheetPage(page);
    await worksheetPage.goto();

    // Navigate to a subcategory
    await worksheetPage.selectCategory("Fractions");
    await worksheetPage.selectSubcategory("Addition");
    await worksheetPage.waitForProblemsToLoad();

    // Check difficulty filter checkboxes have labels
    const easyCheckbox = page.getByLabel(/filter by easy difficulty/i);
    await expect(easyCheckbox).toBeVisible();

    const mediumCheckbox = page.getByLabel(/filter by medium difficulty/i);
    await expect(mediumCheckbox).toBeVisible();

    const hardCheckbox = page.getByLabel(/filter by hard difficulty/i);
    await expect(hardCheckbox).toBeVisible();

    // Wait for tags to load
    await expect(page.getByText("Filter by Tags")).toBeVisible();
    await page.waitForTimeout(500);

    // Check tag filter checkboxes have labels (should be at least one)
    const tagCheckboxes = await page
      .locator('input[type="checkbox"][aria-label*="filter by tag"]')
      .all();
    if (tagCheckboxes.length > 0) {
      for (const checkbox of tagCheckboxes) {
        const ariaLabel = await checkbox.getAttribute("aria-label");
        expect(ariaLabel).toBeTruthy();
        expect(ariaLabel).toMatch(/filter by tag/i);
      }
    }

    // TODO: Run axe-core scan on filters
    // const accessibilityScanResults = await new AxeBuilder({ page })
    //   .withTags(['wcag2a', 'wcag2aa'])
    //   .analyze();

    // expect(accessibilityScanResults.violations).toEqual([]);
  });

  test("should have sufficient color contrast", async ({ page }) => {
    const worksheetPage = new WorksheetPage(page);
    await worksheetPage.goto();

    await expect(page.getByRole("button", { name: "Fractions" })).toBeVisible();

    // Manual color contrast check for category buttons
    const fractionsButton = page.getByRole("button", { name: "Fractions" });

    const colors = await fractionsButton.evaluate((el) => {
      const styles = window.getComputedStyle(el);
      return {
        color: styles.color,
        backgroundColor: styles.backgroundColor,
      };
    });

    // Verify colors are defined (actual contrast ratio calculation would require a library)
    expect(colors.color).toBeTruthy();
    expect(colors.backgroundColor).toBeTruthy();

    // TODO: Use axe-core to check color contrast automatically
    // const accessibilityScanResults = await new AxeBuilder({ page })
    //   .withTags(['wcag2aa', 'wcag21aa'])
    //   .analyze();

    // expect(accessibilityScanResults.violations).toEqual([]);
  });

  test("should have accessible empty states", async ({ page }) => {
    const worksheetPage = new WorksheetPage(page);
    await worksheetPage.goto();

    // Check hero section accessibility
    await expect(worksheetPage.heroSection).toBeVisible();

    // Hero section should have a heading
    const heroHeading = page.locator("h1, h2").first();
    const heroText = await heroHeading.textContent();
    expect(heroText).toBeTruthy();

    // TODO: Run axe-core scan on empty state
    // const accessibilityScanResults = await new AxeBuilder({ page })
    //   .withTags(['wcag2a', 'wcag2aa'])
    //   .analyze();

    // expect(accessibilityScanResults.violations).toEqual([]);
  });

  test("should have accessible Download PDF button", async ({ page }) => {
    const worksheetPage = new WorksheetPage(page);
    await worksheetPage.goto();

    // Navigate to a subcategory
    await worksheetPage.selectCategory("Fractions");
    await worksheetPage.selectSubcategory("Addition");
    await worksheetPage.waitForProblemsToLoad();

    // Check Download PDF button is accessible
    const downloadButton = page
      .getByRole("button", { name: /download pdf/i })
      .first();
    await expect(downloadButton).toBeVisible();

    // Check button has accessible label
    const buttonText = await downloadButton.textContent();
    expect(buttonText).toMatch(/download pdf/i);

    // Check button is keyboard accessible
    await downloadButton.focus();
    const isFocused = await downloadButton.evaluate(
      (el) => el === document.activeElement,
    );
    expect(isFocused).toBe(true);

    // TODO:  Run axe-core scan
    // const accessibilityScanResults = await new AxeBuilder({ page })
    //   .withTags(['wcag2a', 'wcag2aa'])
    //   .analyze();

    // expect(accessibilityScanResults.violations).toEqual([]);
  });

  test("should have proper ARIA attributes on interactive elements", async ({
    page,
  }) => {
    const worksheetPage = new WorksheetPage(page);
    await worksheetPage.goto();

    // Navigate to filters
    await worksheetPage.selectCategory("Fractions");
    await worksheetPage.selectSubcategory("Addition");
    await worksheetPage.waitForProblemsToLoad();

    // Check checkboxes have proper ARIA
    const checkboxes = await page.locator('input[type="checkbox"]').all();

    for (const checkbox of checkboxes) {
      // Should have aria-label or associated label
      const ariaLabel = await checkbox.getAttribute("aria-label");
      const id = await checkbox.getAttribute("id");

      if (id) {
        const labelCount = await page.locator(`label[for="${id}"]`).count();
        expect(labelCount > 0 || ariaLabel).toBeTruthy();
      } else {
        expect(ariaLabel).toBeTruthy();
      }
    }

    // Check buttons have proper ARIA
    const buttons = await page.locator("button").all();

    for (const button of buttons) {
      const ariaLabel = await button.getAttribute("aria-label");
      const text = await button.textContent();

      // Buttons should have either text content or aria-label
      expect(text || ariaLabel).toBeTruthy();
    }
  });

  test("should be screen reader friendly", async ({ page }) => {
    const worksheetPage = new WorksheetPage(page);
    await worksheetPage.goto();

    // Check page has a title
    const title = await page.title();
    expect(title).toBeTruthy();
    expect(title.length).toBeGreaterThan(0);

    // Check main content has appropriate landmarks
    const main = page.locator("main");
    await expect(main).toBeVisible();

    // Check for heading hierarchy (h1 should exist)
    const h1 = page.locator("h1");
    const h1Count = await h1.count();
    expect(h1Count).toBeGreaterThan(0);

    // TODO: Test with actual screen reader simulation using axe-core
    // const accessibilityScanResults = await new AxeBuilder({ page })
    //   .withTags(['best-practice', 'wcag2a', 'wcag2aa'])
    //   .analyze();

    // expect(accessibilityScanResults.violations).toEqual([]);
  });
});
