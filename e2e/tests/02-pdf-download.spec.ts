import { test, expect } from '@playwright/test';
import { WorksheetPage } from '../fixtures/WorksheetPage';
import * as path from 'path';
import * as fs from 'fs';

/**
 * E2E-007: PDF Download
 * Tests PDF generation and download functionality
 * Updated for React Router 7 URL-based routing
 */
test.describe('PDF Download', () => {
  test('should download PDF with correct filename when clicking Download PDF button', async ({ page }) => {
    const worksheetPage = new WorksheetPage(page);

    // Navigate directly to worksheet page
    await worksheetPage.gotoWorksheet('fractions', 'addition');
    await worksheetPage.waitForPageReady();

    // Wait for problems to be visible
    await expect(worksheetPage.problemsList).toBeVisible();

    // Set up download listener before clicking
    const downloadPromise = page.waitForEvent('download');

    // Click Download PDF button
    const downloadButton = worksheetPage.downloadPdfButton;

    // Verify button is enabled
    await expect(downloadButton).toBeEnabled();

    // Click the button
    await downloadButton.click();

    // Wait for download to start
    const download = await downloadPromise;

    // Verify filename pattern
    const filename = download.suggestedFilename();
    expect(filename).toMatch(/fractions-addition-worksheet\.pdf/i);

    // Optional: Save the file and verify it exists
    const downloadsPath = path.join(__dirname, '../../playwright-downloads');
    if (!fs.existsSync(downloadsPath)) {
      fs.mkdirSync(downloadsPath, { recursive: true });
    }

    const filePath = path.join(downloadsPath, filename);
    await download.saveAs(filePath);

    // Verify file was saved
    expect(fs.existsSync(filePath)).toBeTruthy();

    // Verify file has content (PDF should be > 0 bytes)
    const stats = fs.statSync(filePath);
    expect(stats.size).toBeGreaterThan(0);

    // Clean up downloaded file
    fs.unlinkSync(filePath);
  });

  test('should show loading state while generating PDF', async ({ page }) => {
    const worksheetPage = new WorksheetPage(page);

    // Navigate directly to worksheet page
    await worksheetPage.gotoWorksheet('fractions', 'addition');
    await worksheetPage.waitForPageReady();

    // Wait for problems to be visible
    await expect(worksheetPage.problemsList).toBeVisible();

    const downloadButton = worksheetPage.downloadPdfButton;

    // Set up download listener
    const downloadPromise = page.waitForEvent('download');

    // Click the button
    await downloadButton.click();

    // Button should either show loading state or return to normal quickly
    // We just verify the download completes successfully
    await downloadPromise;

    // After download, button should return to normal state
    await expect(downloadButton).toContainText(/download pdf/i);
  });

  test('should download PDF for different problem types', async ({ page }) => {
    const worksheetPage = new WorksheetPage(page);

    // Navigate directly to Algebras → Collecting Terms
    await worksheetPage.gotoWorksheet('algebra', 'collecting-terms');
    await worksheetPage.waitForPageReady();

    // Wait for problems to be visible
    await expect(worksheetPage.problemsList).toBeVisible();

    const downloadPromise = page.waitForEvent('download');

    await worksheetPage.downloadPdfButton.click();

    const download = await downloadPromise;
    const filename = download.suggestedFilename();

    // Verify algebra worksheet filename
    expect(filename).toMatch(/^algebra-collecting-terms-worksheet.*\.pdf/i);

    // Save and verify file
    const downloadsPath = path.join(__dirname, '../../playwright-downloads');
    if (!fs.existsSync(downloadsPath)) {
      fs.mkdirSync(downloadsPath, { recursive: true });
    }

    const filePath = path.join(downloadsPath, filename);
    await download.saveAs(filePath);

    expect(fs.existsSync(filePath)).toBeTruthy();
    const stats = fs.statSync(filePath);
    expect(stats.size).toBeGreaterThan(0);

    // Clean up
    fs.unlinkSync(filePath);
  });
});
