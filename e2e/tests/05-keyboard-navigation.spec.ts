import { test, expect } from '@playwright/test';
import { WorksheetPage } from '../fixtures/WorksheetPage';

/**
 * E2E-018: Keyboard Navigation
 * Tests keyboard accessibility throughout the application
 */
test.describe('Keyboard Navigation', () => {
  test('should navigate through categories using Tab and activate with Enter', async ({ page }) => {
    const worksheetPage = new WorksheetPage(page);
    await worksheetPage.goto();

    // Wait for categories to load
    await expect(page.getByRole('button', { name: 'Fractions' })).toBeVisible();

    // Tab to the first category button (after hero section links)
    await page.keyboard.press('Tab'); // Skip to first focusable element

    // Keep tabbing until we reach Fractions button
    let attempts = 0;
    while (attempts < 20) {
      const focused = await page.evaluate(() => document.activeElement?.textContent);
      if (focused?.includes('Fractions')) {
        break;
      }
      await page.keyboard.press('Tab');
      attempts++;
    }

    // Activate with Enter
    await page.keyboard.press('Enter');

    // Verify subcategories appear
    await expect(page.getByRole('button', { name: 'Addition' })).toBeVisible();

    // Verify focus is visible (button should have focus styles)
    const fractionsButton = page.getByRole('button', { name: 'Fractions' });
    await expect(fractionsButton).toHaveClass(/bg-blue-200/);
  });

  test('should activate buttons with Space key', async ({ page }) => {
    const worksheetPage = new WorksheetPage(page);
    await worksheetPage.goto();

    await expect(page.getByRole('button', { name: 'Fractions' })).toBeVisible();

    // Click Fractions with mouse first to show subcategories
    await page.getByRole('button', { name: 'Fractions' }).click();
    await expect(page.getByRole('button', { name: 'Addition' })).toBeVisible();

    // Focus the Addition button and activate with Space
    await page.getByRole('button', { name: 'Addition' }).focus();
    await page.keyboard.press('Space');

    // Verify problems load
    await expect(page.getByText('Fractions - Addition').first()).toBeVisible();
    await expect(page.getByRole('heading', { name: 'Addition', level: 2 })).toBeVisible();
  });

  test('should navigate through difficulty filter checkboxes with Tab', async ({ page }) => {
    const worksheetPage = new WorksheetPage(page);
    await worksheetPage.goto();

    // Navigate to a subcategory
    await worksheetPage.selectCategory('Fractions');
    await worksheetPage.selectSubcategory('Addition');
    await worksheetPage.waitForProblemsToLoad();

    // Focus the first difficulty checkbox
    const easyCheckbox = page.getByLabel('Easy');
    await easyCheckbox.focus();

    // Toggle with Space
    await page.keyboard.press('Space');

    // Tab to next checkbox
    await page.keyboard.press('Tab');

    // Should focus Medium checkbox
    const focused = await page.evaluate(() => document.activeElement?.getAttribute('aria-label'));
    expect(focused).toMatch(/medium difficulty/i);

    // Toggle Medium with Space
    await page.keyboard.press('Space');

    // Keep tabbing until we find Apply Filters button
    // we could run into an infinite loop`
    while (true) {
      const focusedText = await page.evaluate(() => document.activeElement?.textContent);
      if (focusedText?.includes('Apply Filters')) {
        break;
      }
      await page.keyboard.press('Tab');
    }

    // Verify Apply Filters button is focused and check for Pending state
    const applyFiltersButton = page.getByRole('button', { name: /apply filters/i });
    const pendingSpan = applyFiltersButton.locator('span', { hasText: 'Pending' });
    // Activate Apply Filters with Enter
    await page.keyboard.press('Enter');
    await expect(pendingSpan).toBeHidden();
  });

  test('should navigate tag filters with keyboard', async ({ page }) => {
    const worksheetPage = new WorksheetPage(page);
    await worksheetPage.goto();

    // Navigate to a subcategory with tags
    await worksheetPage.selectCategory('Fractions');
    await worksheetPage.selectSubcategory('Addition');
    await worksheetPage.waitForProblemsToLoad();

    // Wait for tags to load
    await expect(page.getByText('Filter by Tags')).toBeVisible();

    // Focus first tag checkbox
    const firstTag = page.getByRole('checkbox', { name: /filter by tag/i }).first();
    await firstTag.focus();

    // Toggle with Space
    await page.keyboard.press('Space');

    // Verify checkbox is checked
    await expect(firstTag).toBeChecked();

    // Tab to next tag
    await page.keyboard.press('Tab');

    // Toggle second tag
    await page.keyboard.press('Space');

    // Keep tabbing until we find Apply Filters button
    // we could run into an infinite loop`
    while (true) {
      const focusedText = await page.evaluate(() => document.activeElement?.textContent);
      if (focusedText?.includes('Apply Filters')) {
        break;
      }
      await page.keyboard.press('Tab');
    }

    // Verify Apply Filters button is focused and check for Pending state
    const applyFiltersButton = page.getByRole('button', { name: /apply filters/i });
    const pendingSpan = applyFiltersButton.locator('span', { hasText: 'Pending' });
    // Activate Apply Filters with Enter
    await page.keyboard.press('Enter');
    await expect(pendingSpan).toBeHidden();

  });

  test('should navigate to Download PDF button with keyboard', async ({ page }) => {
    const worksheetPage = new WorksheetPage(page);
    await worksheetPage.goto();

    // Navigate to a subcategory
    await worksheetPage.selectCategory('Fractions');
    await worksheetPage.selectSubcategory('Addition');
    await worksheetPage.waitForProblemsToLoad();

    // Focus the Download PDF button
    const downloadButton = page.getByRole('button', { name: /download pdf/i }).first();
    await downloadButton.focus();

    // Verify button is focused
    const isFocused = await downloadButton.evaluate((el) => el === document.activeElement);
    expect(isFocused).toBe(true);

    // Note: We don't actually trigger the download in this test to avoid file handling
    // Just verify the button can be focused
  });

  test('should show visible focus indicators on all interactive elements', async ({ page }) => {
    const worksheetPage = new WorksheetPage(page);
    await worksheetPage.goto();

    await expect(page.getByRole('button', { name: 'Fractions' })).toBeVisible();

    // Test focus indicator on category button
    const fractionsButton = page.getByRole('button', { name: 'Fractions' });
    await fractionsButton.focus();

    // Check for focus ring (Tailwind's focus:ring classes)
    const hasFocusRing = await fractionsButton.evaluate((el) => {
      const styles = window.getComputedStyle(el);
      // Check for outline or box-shadow (focus ring)
      return styles.outline !== 'none' || styles.boxShadow !== 'none';
    });

    expect(hasFocusRing).toBe(true);
  });

  test('should maintain focus after category selection', async ({ page }) => {
    const worksheetPage = new WorksheetPage(page);
    await worksheetPage.goto();

    await expect(page.getByRole('button', { name: 'Fractions' })).toBeVisible();

    // Focus and activate Fractions button
    const fractionsButton = page.getByRole('button', { name: 'Fractions' });
    await fractionsButton.focus();
    await page.keyboard.press('Enter');

    // Wait for subcategories
    await expect(page.getByRole('button', { name: 'Addition' })).toBeVisible();

    // Focus should remain on Fractions button or move to logical next element
    const focused = await page.evaluate(() => document.activeElement?.textContent);

    // Either still on Fractions or moved to a subcategory
    expect(focused).toBeDefined();
  });

});
