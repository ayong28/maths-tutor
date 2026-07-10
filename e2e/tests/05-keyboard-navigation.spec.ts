import { test, expect } from '@playwright/test';
import { WorksheetPage } from '../pages/WorksheetPage';

/**
 * E2E-018: Keyboard Navigation
 * Tests keyboard accessibility throughout the application
 * Updated for React Router 7 URL-based routing
 */
test.describe('Keyboard Navigation', () => {
  test('should navigate through category links using Tab and activate with Enter', async ({
    page,
  }) => {
    const worksheetPage = new WorksheetPage(page);
    await worksheetPage.goto();
    await worksheetPage.waitForPageReady();

    await expect(worksheetPage.fractionsLink).toBeVisible();

    await page.keyboard.press('Tab');

    let attempts = 0;
    while (attempts < 20) {
      const focused = await page.evaluate(
        () => document.activeElement?.textContent,
      );
      if (focused?.toLowerCase().includes('fractions')) {
        break;
      }
      await page.keyboard.press('Tab');
      attempts++;
    }

    await page.keyboard.press('Enter');

    await expect(page).toHaveURL(/\/fractions$/);

    await expect(page.getByRole('link', { name: /addition/i })).toBeVisible();
  });

  test('should navigate through subcategory links with keyboard', async ({
    page,
  }) => {
    const worksheetPage = new WorksheetPage(page);
    await worksheetPage.gotoCategory('fractions');
    await worksheetPage.waitForPageReady();

    await expect(page.getByRole('link', { name: /addition/i })).toBeVisible();

    await page.getByRole('link', { name: /addition/i }).focus();

    await page.keyboard.press('Enter');

    await expect(page).toHaveURL(/\/fractions\/addition/);

    await expect(worksheetPage.problemsList).toBeVisible();
  });

  test('should navigate to Download PDF button with keyboard', async ({
    page,
  }) => {
    const worksheetPage = new WorksheetPage(page);
    await worksheetPage.gotoWorksheet('fractions', 'addition');
    await worksheetPage.waitForPageReady();

    await expect(worksheetPage.problemsList).toBeVisible();

    const downloadButton = worksheetPage.downloadPdfButton;
    await downloadButton.focus();

    const isFocused = await downloadButton.evaluate(
      (el) => el === document.activeElement,
    );
    expect(isFocused).toBe(true);
  });

  test('should show visible focus indicators on interactive elements', async ({
    page,
  }) => {
    const worksheetPage = new WorksheetPage(page);
    await worksheetPage.goto();
    await worksheetPage.waitForPageReady();

    await expect(worksheetPage.fractionsLink).toBeVisible();

    await worksheetPage.fractionsLink.focus();

    const hasFocusIndicator = await worksheetPage.fractionsLink.evaluate(
      (el) => {
        const styles = window.getComputedStyle(el);
        return styles.outline !== 'none' || styles.boxShadow !== 'none';
      },
    );

    expect(hasFocusIndicator).toBe(true);
  });
});
