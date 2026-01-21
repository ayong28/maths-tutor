import { Page, Locator, expect } from '@playwright/test';

/**
 * Page Object Model for the Math Worksheet Application (React Router 7)
 * Updated to match URL-based routing structure:
 * - / (homepage with category grid)
 * - /:category (subcategory list)
 * - /:category/:subcategory (worksheet with filters)
 */
export class WorksheetPage {
  readonly page: Page;

  // Homepage elements
  readonly heroHeading: Locator;
  readonly heroDescription: Locator;
  readonly categoryLinks: Locator;

  // Category page elements
  readonly categoryHeading: Locator;
  readonly subcategoryLinks: Locator;
  readonly backToCategoriesLink: Locator;

  // Worksheet page elements (/:category/:subcategory)
  readonly worksheetHeading: Locator;
  readonly problemsList: Locator;
  readonly downloadPdfButton: Locator;
  readonly showAnswerKeyButton: Locator;
  readonly backToCategoryButton: Locator;

  // Filter elements (worksheet page only)
  readonly filtersHeading: Locator;
  readonly difficultySection: Locator;
  readonly tagSection: Locator;
  readonly applyFiltersButton: Locator;
  readonly clearFiltersButton: Locator;

  // Breadcrumb
  readonly breadcrumb: Locator;

  // Loading/Error states
  readonly loadingSpinner: Locator;
  readonly errorMessage: Locator;

  constructor(page: Page) {
    this.page = page;

    // Homepage
    this.heroHeading = page.getByRole('heading', { name: /master math with/i });
    this.heroDescription = page.getByText(/select a topic and category/i);
    this.categoryLinks = page.locator('a[href^="/"]').filter({
      has: page.locator('h3'),
    });

    // Category page
    this.categoryHeading = page.locator('h2').filter({ hasText: /.+/ });
    this.subcategoryLinks = page.locator('ul a[href*="/"]');
    this.backToCategoriesLink = page.getByRole('link', { name: /back to categories/i });

    // Worksheet page
    this.worksheetHeading = page.locator('main h2').first();
    this.problemsList = page.locator('ol').filter({ has: page.locator('li') });
    this.downloadPdfButton = page.getByRole('button', { name: /download pdf/i });
    this.showAnswerKeyButton = page.getByRole('button', { name: /show answer key|hide answer key/i });
    this.backToCategoryButton = page.getByRole('button', { name: /back to/i });

    // Filters (worksheet page sidebar)
    this.filtersHeading = page.getByRole('heading', { name: /filters/i });
    this.difficultySection = page.getByText(/filter by difficulty/i);
    this.tagSection = page.getByText(/filter by tags/i);
    this.applyFiltersButton = page.getByRole('button', { name: /apply filters/i });
    this.clearFiltersButton = page.getByRole('button', { name: /clear filters/i });

    // Breadcrumb
    this.breadcrumb = page.locator('nav').filter({ hasText: /home/i });

    // States
    this.loadingSpinner = page.locator('.animate-spin');
    this.errorMessage = page.locator('[class*="text-red"]').filter({ hasText: /error/i });
  }

  /**
   * Navigate to homepage
   */
  async goto() {
    await this.page.goto('/');
  }

  /**
   * Navigate directly to a category page
   */
  async gotoCategory(category: string) {
    const slug = category.toLowerCase().replace(/\s+/g, '-');
    await this.page.goto(`/${slug}`);
  }

  /**
   * Navigate directly to a worksheet page
   */
  async gotoWorksheet(category: string, subcategory: string) {
    const catSlug = category.toLowerCase().replace(/\s+/g, '-');
    const subSlug = subcategory.toLowerCase().replace(/\s+/g, '-');
    await this.page.goto(`/${catSlug}/${subSlug}`);
  }

  /**
   * Click a category link on the homepage
   */
  async selectCategory(category: string) {
    await this.page.getByRole('link', { name: new RegExp(category, 'i') }).click();
  }

  /**
   * Click a subcategory link on the category page
   */
  async selectSubcategory(subcategory: string) {
    await this.page.getByRole('link', { name: new RegExp(subcategory, 'i') }).click();
  }

  /**
   * Toggle a difficulty filter checkbox (worksheet page only)
   */
  async toggleDifficulty(difficulty: 'EASY' | 'MEDIUM' | 'HARD') {
    const checkbox = this.page.getByRole('checkbox', { name: new RegExp(difficulty, 'i') });
    await checkbox.click();
  }

  /**
   * Toggle a tag filter checkbox (worksheet page only)
   */
  async toggleTag(tag: string) {
    const checkbox = this.page.locator(`input[type="checkbox"][id^="tag-"]`).filter({
      has: this.page.locator(`[id="tag-${tag}"]`),
    });
    // Alternative: click by label
    await this.page.getByLabel(new RegExp(`filter by tag.*${tag}`, 'i')).click();
  }

  /**
   * Apply staged filters
   */
  async applyFilters() {
    await this.applyFiltersButton.click();
  }

  /**
   * Clear all filters
   */
  async clearFilters() {
    await this.clearFiltersButton.click();
  }

  /**
   * Toggle the answer key visibility
   */
  async toggleAnswerKey() {
    await this.showAnswerKeyButton.click();
  }

  /**
   * Download PDF
   */
  async downloadPdf() {
    const downloadPromise = this.page.waitForEvent('download');
    await this.downloadPdfButton.click();
    const download = await downloadPromise;
    return download;
  }

  /**
   * Wait for page to be ready (loading complete)
   */
  async waitForPageReady() {
    await this.page.waitForLoadState('networkidle');
  }

  /**
   * Get the count of displayed problems
   */
  async getProblemCount(): Promise<number> {
    const problems = await this.problemsList.locator('li').all();
    return problems.length;
  }

  /**
   * Check if hero section is visible (homepage)
   */
  async isHeroVisible(): Promise<boolean> {
    return await this.heroHeading.isVisible();
  }

  /**
   * Verify page loaded without errors
   */
  async verifyNoErrors() {
    await expect(this.errorMessage).toBeHidden();
  }

  /**
   * Get filter pending badge visibility
   */
  async hasFilterPendingBadge(): Promise<boolean> {
    const badge = this.page.getByText(/pending/i);
    return await badge.isVisible();
  }

  /**
   * Get current URL path
   */
  getCurrentPath(): string {
    return new URL(this.page.url()).pathname;
  }
}
