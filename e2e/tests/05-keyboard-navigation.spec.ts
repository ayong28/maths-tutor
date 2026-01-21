import { test, expect } from '@playwright/test';
import { WorksheetPage } from '../fixtures/WorksheetPage';

/**
 * E2E-018: Keyboard Navigation
 * Tests keyboard accessibility throughout the application
 * Updated for React Router 7 URL-based routing
 */
test.describe('Keyboard Navigation', () => {
  test('should navigate through category links using Tab and activate with Enter', async ({ page }) => {
    const worksheetPage = new WorksheetPage(page);
    await worksheetPage.goto();
    await worksheetPage.waitForPageReady();

    // Wait for category links to load
    await expect(page.getByRole('link', { name: /fractions/i })).toBeVisible();

    // Tab to the first category link
    await page.keyboard.press('Tab');

    // Keep tabbing until we reach Fractions link
    let attempts = 0;
    while (attempts < 20) {
      const focused = await page.evaluate(() => document.activeElement?.textContent);
      if (focused?.toLowerCase().includes('fractions')) {
        break;
      }
      await page.keyboard.press('Tab');
      attempts++;
    }

    // Activate with Enter
    await page.keyboard.press('Enter');

    // Should navigate to category page
    await expect(page).toHaveURL(/\/fractions$/);

    // Verify subcategory links appear
    await expect(page.getByRole('link', { name: /addition/i })).toBeVisible();
  });

  test('should navigate through subcategory links with keyboard', async ({ page }) => {
    const worksheetPage = new WorksheetPage(page);
    await worksheetPage.gotoCategory('fractions');
    await worksheetPage.waitForPageReady();

    // Wait for subcategory links
    await expect(page.getByRole('link', { name: /addition/i })).toBeVisible();

    // Focus the Addition link
    await page.getByRole('link', { name: /addition/i }).focus();

    // Activate with Enter
    await page.keyboard.press('Enter');

    // Should navigate to worksheet page
    await expect(page).toHaveURL(/\/fractions\/addition/);

    // Verify problems load
    await expect(worksheetPage.problemsList).toBeVisible();
  });

  test('should navigate through difficulty filter checkboxes with Tab', async ({ page }) => {
    const worksheetPage = new WorksheetPage(page);
    await worksheetPage.gotoWorksheet('fractions', 'addition');
    await worksheetPage.waitForPageReady();

    // Wait for filters to load
    await expect(worksheetPage.filtersHeading).toBeVisible();

    // Focus the first difficulty checkbox
    const easyCheckbox = page.getByRole('checkbox', { name: /easy/i });
    await easyCheckbox.focus();

    // Toggle with Space
    await page.keyboard.press('Space');

    // Verify checkbox is checked
    await expect(easyCheckbox).toBeChecked();

    // Tab to next checkbox
    await page.keyboard.press('Tab');

    // Should focus Medium checkbox
    const focusedName = await page.evaluate(() => {
      const el = document.activeElement as HTMLInputElement;
      return el?.getAttribute('aria-label') || el?.name || '';
    });
    expect(focusedName.toLowerCase()).toContain('medium');
  });

  test('should navigate tag filters with keyboard', async ({ page }) => {
    const worksheetPage = new WorksheetPage(page);
    await worksheetPage.gotoWorksheet('fractions', 'addition');
    await worksheetPage.waitForPageReady();

    // Check if tags are available
    const tagSection = page.getByText(/filter by tags/i);
    const hasTagSection = await tagSection.isVisible().catch(() => false);

    if (!hasTagSection) {
      test.skip();
      return;
    }

    // Focus first tag checkbox
    const firstTag = page.locator('input[id^="tag-"]').first();
    await firstTag.focus();

    // Toggle with Space
    await page.keyboard.press('Space');

    // Verify checkbox is checked
    await expect(firstTag).toBeChecked();
  });

  test('should navigate to Download PDF button with keyboard', async ({ page }) => {
    const worksheetPage = new WorksheetPage(page);
    await worksheetPage.gotoWorksheet('fractions', 'addition');
    await worksheetPage.waitForPageReady();

    // Wait for problems to load
    await expect(worksheetPage.problemsList).toBeVisible();

    // Focus the Download PDF button
    const downloadButton = worksheetPage.downloadPdfButton;
    await downloadButton.focus();

    // Verify button is focused
    const isFocused = await downloadButton.evaluate((el) => el === document.activeElement);
    expect(isFocused).toBe(true);

    // Note: We don't actually trigger the download in this test to avoid file handling
  });

  test('should show visible focus indicators on interactive elements', async ({ page }) => {
    const worksheetPage = new WorksheetPage(page);
    await worksheetPage.goto();
    await worksheetPage.waitForPageReady();

    // Wait for category links to load
    await expect(page.getByRole('link', { name: /fractions/i })).toBeVisible();

    // Test focus indicator on category link
    const fractionsLink = page.getByRole('link', { name: /fractions/i });
    await fractionsLink.focus();

    // Check for focus ring (Tailwind's focus:ring classes or outline)
    const hasFocusIndicator = await fractionsLink.evaluate((el) => {
      const styles = window.getComputedStyle(el);
      // Check for outline or box-shadow (focus ring)
      return styles.outline !== 'none' || styles.boxShadow !== 'none';
    });

    expect(hasFocusIndicator).toBe(true);
  });

  test('should navigate Apply Filters button with keyboard', async ({ page }) => {
    const worksheetPage = new WorksheetPage(page);
    await worksheetPage.gotoWorksheet('fractions', 'addition');
    await worksheetPage.waitForPageReady();

    // Toggle a filter to enable Apply button
    const easyCheckbox = page.getByRole('checkbox', { name: /easy/i });
    await easyCheckbox.click();

    // Focus Apply Filters button
    const applyButton = worksheetPage.applyFiltersButton;
    await applyButton.focus();

    // Verify button is focused
    const isFocused = await applyButton.evaluate((el) => el === document.activeElement);
    expect(isFocused).toBe(true);

    // Activate with Enter
    await page.keyboard.press('Enter');

    // URL should update with filter params
    await expect(page).toHaveURL(/difficulty=EASY/i);
  });
});
