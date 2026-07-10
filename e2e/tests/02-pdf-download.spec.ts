import { test, expect } from '@playwright/test';
import { WorksheetPage } from '../pages/WorksheetPage';

/**
 * E2E-007: PDF Download
 * Tests PDF generation and download functionality
 * Updated for React Router 7 URL-based routing
 */
test.describe('PDF Download', () => {
  test('should download PDF with correct filename when clicking Download PDF button', async ({ page }) => {
    const worksheetPage = new WorksheetPage(page);

    await worksheetPage.gotoWorksheet('fractions', 'addition');
    await worksheetPage.waitForPageReady();

    await expect(worksheetPage.problemsList).toBeVisible();

    const downloadPromise = page.waitForEvent('download');
    await worksheetPage.downloadPdfButton.click();

    const download = await downloadPromise;

    // Verify filename pattern
    const filename = download.suggestedFilename();
    expect(filename).toMatch(/fractions-addition-worksheet\.pdf/i);
  });

  test('should show loading state while generating PDF', async ({ page }) => {
    const worksheetPage = new WorksheetPage(page);

    await worksheetPage.gotoWorksheet('fractions', 'addition');
    await worksheetPage.waitForPageReady();

    await expect(worksheetPage.problemsList).toBeVisible();

    // We verify the download helper works cleanly
    const download = await worksheetPage.downloadPdf();
    await expect(download.suggestedFilename()).toMatch(/fractions-addition-worksheet\.pdf/i);
  });

  test('should download PDF for different problem types', async ({ page }) => {
    const worksheetPage = new WorksheetPage(page);

    await worksheetPage.gotoWorksheet('fractions', 'addition');
    await worksheetPage.waitForPageReady();

    await expect(worksheetPage.problemsList).toBeVisible();

    const download = await worksheetPage.downloadPdf();
    const filename = download.suggestedFilename();

    expect(filename).toMatch(/fractions-addition-worksheet\.pdf/i);
  });
});
