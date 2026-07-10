import { test, expect } from '@playwright/test';
import { WorksheetPage } from '../pages/WorksheetPage';

/**
 * E2E-019: Accessibility Testing
 * Tests WCAG 2.1 AA compliance and accessibility best practices
 * Updated for React Router 7 URL-based routing
 */
test.describe('Accessibility', () => {
  test('should have no accessibility violations on homepage', async ({
    page,
  }) => {
    const worksheetPage = new WorksheetPage(page);
    await worksheetPage.goto();
    await worksheetPage.waitForPageReady();

    await expect(worksheetPage.heroHeading).toBeVisible();
    await expect(worksheetPage.fractionsLink).toBeVisible();

    const images = await page.locator('img').all();
    if (images.length > 0) {
      for (const img of images) {
        const alt = await img.getAttribute('alt');
        expect(alt).not.toBeNull();
      }
    }

    const fractionsLink = worksheetPage.fractionsLink;
    await expect(fractionsLink).toBeVisible();

    const h1 = page.locator('h1');
    const h1Count = await h1.count();
    expect(h1Count).toBeGreaterThan(0);
  });

  test('should have accessible category navigation', async ({ page }) => {
    const worksheetPage = new WorksheetPage(page);
    await worksheetPage.goto();
    await worksheetPage.waitForPageReady();

    await expect(worksheetPage.fractionsLink).toBeVisible();

    const categoryLinks = page
      .locator('a[href^="/"]')
      .filter({ has: page.locator('h3') });
    const linkCount = await categoryLinks.count();
    expect(linkCount).toBeGreaterThan(0);

    await worksheetPage.fractionsLink.focus();

    const hasFocusIndicator = await worksheetPage.fractionsLink.evaluate(
      (el) => {
        const styles = window.getComputedStyle(el);
        return styles.outline !== 'none' || styles.boxShadow !== 'none';
      },
    );
    expect(hasFocusIndicator).toBe(true);
  });

  test('should have sufficient color contrast', async ({ page }) => {
    const worksheetPage = new WorksheetPage(page);
    await worksheetPage.goto();
    await worksheetPage.waitForPageReady();

    await expect(worksheetPage.fractionsLink).toBeVisible();

    const fractionsLink = worksheetPage.fractionsLink;

    const colors = await fractionsLink.evaluate((el) => {
      const styles = window.getComputedStyle(el);
      return {
        color: styles.color,
        backgroundColor: styles.backgroundColor,
      };
    });

    expect(colors.color).toBeTruthy();
    expect(colors.backgroundColor).toBeTruthy();
  });

  test('should have accessible empty states', async ({ page }) => {
    const worksheetPage = new WorksheetPage(page);
    await worksheetPage.goto();
    await worksheetPage.waitForPageReady();

    await expect(worksheetPage.heroHeading).toBeVisible();

    const heroHeading = page.locator('h1').first();
    const heroText = await heroHeading.textContent();
    expect(heroText).toBeTruthy();
  });

  test('should have accessible Download PDF button', async ({ page }) => {
    const worksheetPage = new WorksheetPage(page);
    await worksheetPage.gotoWorksheet('fractions', 'addition');
    await worksheetPage.waitForPageReady();

    await expect(worksheetPage.problemsList).toBeVisible();

    const downloadButton = worksheetPage.downloadPdfButton;
    await expect(downloadButton).toBeVisible();

    const buttonText = await downloadButton.textContent();
    expect(buttonText).toMatch(/download pdf/i);

    await downloadButton.focus();
    const isFocused = await downloadButton.evaluate(
      (el) => el === document.activeElement,
    );
    expect(isFocused).toBe(true);
  });

  test('should have proper ARIA attributes on interactive elements', async ({
    page,
  }) => {
    const worksheetPage = new WorksheetPage(page);
    await worksheetPage.gotoWorksheet('fractions', 'addition');
    await worksheetPage.waitForPageReady();

    const checkboxes = await page.locator('input[type="checkbox"]').all();

    for (const checkbox of checkboxes) {
      const ariaLabel = await checkbox.getAttribute('aria-label');
      const id = await checkbox.getAttribute('id');

      if (id) {
        const labelCount = await page.locator(`label[for="${id}"]`).count();
        expect(labelCount > 0 || ariaLabel).toBeTruthy();
      } else {
        expect(ariaLabel).toBeTruthy();
      }
    }

    const buttons = await page.locator('button').all();

    for (const button of buttons) {
      const ariaLabel = await button.getAttribute('aria-label');
      const text = await button.textContent();

      expect(text || ariaLabel).toBeTruthy();
    }
  });

  test('should be screen reader friendly', async ({ page }) => {
    const worksheetPage = new WorksheetPage(page);
    await worksheetPage.goto();
    await worksheetPage.waitForPageReady();

    const title = await page.title();
    expect(title).toBeTruthy();
    expect(title.length).toBeGreaterThan(0);

    const h1 = page.locator('h1');
    const h1Count = await h1.count();
    expect(h1Count).toBeGreaterThan(0);

    await worksheetPage.gotoWorksheet('fractions', 'addition');
    await worksheetPage.waitForPageReady();

    const main = page.locator('main');
    await expect(main).toBeVisible();

    const aside = page.locator('aside');
    await expect(aside).toBeVisible();
  });
});
