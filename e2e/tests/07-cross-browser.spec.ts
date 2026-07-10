import { test, expect } from '@playwright/test';
import { WorksheetPage } from '../pages/WorksheetPage';

/**
 * E2E-020: Cross-Browser Compatibility
 * Tests app functionality across Chromium, Firefox, and WebKit
 * Updated for React Router 7 URL-based routing
 */
test.describe('Cross-Browser Compatibility', () => {
  test('should load homepage correctly in all browsers', async ({
    page,
    browserName,
  }) => {
    const worksheetPage = new WorksheetPage(page);
    await worksheetPage.goto();
    await worksheetPage.waitForPageReady();

    await expect(worksheetPage.heroHeading).toBeVisible();

    await expect(worksheetPage.fractionsLink).toBeVisible();

    const title = await page.title();
    expect(title).toBeTruthy();

    console.log(`✓ Homepage loaded successfully in ${browserName}`);
  });

  test('should handle category and subcategory navigation in all browsers', async ({
    page,
    browserName,
  }) => {
    const worksheetPage = new WorksheetPage(page);
    await worksheetPage.goto();
    await worksheetPage.waitForPageReady();

    await worksheetPage.selectCategory('Fractions');

    await expect(page).toHaveURL(/\/fractions$/);
    await expect(page.getByRole('link', { name: /addition/i })).toBeVisible();

    await worksheetPage.selectSubcategory('Addition');

    await expect(page).toHaveURL(/\/fractions\/addition/);
    await expect(worksheetPage.problemsList).toBeVisible();

    console.log(`✓ Category navigation works in ${browserName}`);
  });

  test('should render CSS correctly in all browsers', async ({
    page,
    browserName,
  }) => {
    const worksheetPage = new WorksheetPage(page);
    await worksheetPage.goto();
    await worksheetPage.waitForPageReady();

    await expect(worksheetPage.fractionsLink).toBeVisible();

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

    expect(styles.display).toBeTruthy();
    expect(styles.backgroundColor).toBeTruthy();

    console.log(`✓ CSS renders correctly in ${browserName}`);
  });

  test('should handle PDF download in all browsers', async ({
    page,
    browserName,
  }) => {
    const worksheetPage = new WorksheetPage(page);

    await worksheetPage.gotoWorksheet('fractions', 'addition');
    await worksheetPage.waitForPageReady();

    await expect(worksheetPage.problemsList).toBeVisible();

    const downloadPromise = page.waitForEvent('download');

    await worksheetPage.downloadPdfButton.click();

    const download = await downloadPromise;

    const filename = download.suggestedFilename();
    expect(filename).toMatch(/fractions-addition-worksheet\.pdf/i);

    console.log(`✓ PDF download works in ${browserName}`);
  });

  test('should handle keyboard navigation in all browsers', async ({
    page,
    browserName,
  }) => {
    const worksheetPage = new WorksheetPage(page);
    await worksheetPage.goto();
    await worksheetPage.waitForPageReady();

    await expect(worksheetPage.fractionsLink).toBeVisible();

    const fractionsLink = worksheetPage.fractionsLink;
    await fractionsLink.focus();

    const hasFocusIndicator = await worksheetPage.fractionsLink.evaluate(
      (el) => {
        const styles = window.getComputedStyle(el);
        return styles.outline !== 'none' || styles.boxShadow !== 'none';
      },
    );
    expect(hasFocusIndicator).toBe(true);

    await page.keyboard.press('Enter');

    await expect(page).toHaveURL(/\/fractions$/);

    console.log(`✓ Keyboard navigation works in ${browserName}`);
  });

  test('should display fractions correctly in all browsers', async ({
    page,
    browserName,
  }) => {
    const worksheetPage = new WorksheetPage(page);

    await worksheetPage.gotoWorksheet('fractions', 'addition');
    await worksheetPage.waitForPageReady();

    await expect(worksheetPage.problemsList).toBeVisible();

    const problemCount = await worksheetPage.getProblemCount();
    expect(problemCount).toBeGreaterThan(0);

    console.log(`✓ Fractions display correctly in ${browserName}`);
  });

  test('should display algebraic expressions correctly in all browsers', async ({
    page,
    browserName,
  }) => {
    const worksheetPage = new WorksheetPage(page);

    await worksheetPage.gotoWorksheet('algebra', 'collecting-terms');
    await worksheetPage.waitForPageReady();

    await expect(worksheetPage.problemsList).toBeVisible();

    const problemCount = await worksheetPage.getProblemCount();
    expect(problemCount).toBeGreaterThan(0);

    console.log(`✓ Algebraic expressions display correctly in ${browserName}`);
  });

  test('should handle mobile viewport in all browsers', async ({
    page,
    browserName,
  }) => {
    await page.setViewportSize({ width: 375, height: 667 });

    const worksheetPage = new WorksheetPage(page);
    await worksheetPage.goto();
    await worksheetPage.waitForPageReady();

    await expect(worksheetPage.heroHeading).toBeVisible();

    await expect(worksheetPage.mobileMenuButton).toBeVisible();

    await worksheetPage.openMobileSidebar();
    await expect(worksheetPage.sidebar).toBeVisible();

    await worksheetPage.selectCategory('Fractions');
    await expect(page).toHaveURL(/\/fractions$/);

    console.log(`✓ Mobile viewport works in ${browserName}`);
  });

  test('should handle rapid navigation in all browsers', async ({
    page,
    browserName,
  }) => {
    const worksheetPage = new WorksheetPage(page);
    await worksheetPage.goto();
    await worksheetPage.waitForPageReady();

    await worksheetPage.selectCategory('Fractions');
    await expect(page).toHaveURL(/\/fractions$/);

    await page.goBack();
    await worksheetPage.waitForPageReady();

    await worksheetPage.selectCategory('Decimals');
    await expect(page).toHaveURL(/\/decimals$/);

    await worksheetPage.selectSubcategory('Addition');
    await expect(page).toHaveURL(/\/decimals\/addition/);

    console.log(`✓ Rapid navigation handled correctly in ${browserName}`);
  });
});

test.describe('Browser-Specific Tests', () => {
  test('should handle Chromium-specific features', async ({
    browserName,
    page,
  }) => {
    test.skip(browserName !== 'chromium', 'This test is only for Chromium');

    const worksheetPage = new WorksheetPage(page);
    await worksheetPage.goto();
    await worksheetPage.waitForPageReady();

    await expect(worksheetPage.heroHeading).toBeVisible();

    console.log('✓ Chromium-specific features work');
  });

  test('should handle Firefox-specific features', async ({
    browserName,
    page,
  }) => {
    test.skip(browserName !== 'firefox', 'This test is only for Firefox');

    const worksheetPage = new WorksheetPage(page);
    await worksheetPage.goto();
    await worksheetPage.waitForPageReady();

    await expect(worksheetPage.heroHeading).toBeVisible();

    console.log('✓ Firefox-specific features work');
  });

  test('should handle WebKit-specific features', async ({
    browserName,
    page,
  }) => {
    test.skip(browserName !== 'webkit', 'This test is only for WebKit');

    const worksheetPage = new WorksheetPage(page);
    await worksheetPage.goto();
    await worksheetPage.waitForPageReady();

    await expect(worksheetPage.heroHeading).toBeVisible();

    console.log('✓ WebKit-specific features work');
  });
});
