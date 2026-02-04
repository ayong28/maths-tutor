import { Page, Locator, expect } from '@playwright/test';

/**
 * Page Object Model for the Math Worksheet Application (React Router 7)
 * Updated to match URL-based routing structure and new "Geometric Scholar" design:
 * - / (homepage with hero and category grid)
 * - /:category (subcategory list)
 * - /:category/:subcategory (worksheet with collapsible filters)
 */
export class WorksheetPage {
  readonly page: Page;

  // Homepage elements
  readonly heroHeading: Locator;
  readonly heroDescription: Locator;
  readonly categoryLinks: Locator;
  readonly categoryGrid: Locator;

  // Category page elements
  readonly categoryHeading: Locator;
  readonly subcategoryLinks: Locator;
  readonly backToAllTopicsLink: Locator;

  // Worksheet page elements (/:category/:subcategory)
  readonly worksheetHeading: Locator;
  readonly problemsList: Locator;
  readonly downloadPdfButton: Locator;
  readonly showAnswerKeyButton: Locator;
  readonly backToCategoryLink: Locator;

  // Filter elements (worksheet page - collapsible panel)
  readonly filtersButton: Locator;
  readonly filterPanel: Locator;
  readonly difficultySection: Locator;
  readonly tagSection: Locator;
  readonly applyFiltersButton: Locator;
  readonly clearFiltersButton: Locator;

  // Breadcrumb
  readonly breadcrumb: Locator;

  // Sidebar navigation (persistent)
  readonly sidebar: Locator;
  readonly sidebarLogo: Locator;

  // Loading/Error states
  readonly loadingSpinner: Locator;
  readonly errorMessage: Locator;

  constructor(page: Page) {
    this.page = page;

    // Homepage - updated for new design
    this.heroHeading = page.getByRole('heading', { name: /master maths with/i });
    this.heroDescription = page.getByText(/build confidence through practice/i);
    this.categoryGrid = page.locator('.grid').filter({ has: page.locator('a[href^="/"]') });
    this.categoryLinks = page.locator('a[href^="/"]').filter({
      has: page.locator('h3'),
    });

    // Category page
    this.categoryHeading = page.getByRole('heading', { level: 1 });
    this.subcategoryLinks = page.locator('a[href*="/"]').filter({
      has: page.locator('h3'),
    });
    this.backToAllTopicsLink = page.getByRole('link', { name: /back to all topics/i });

    // Worksheet page
    this.worksheetHeading = page.getByRole('heading', { level: 1 });
    this.problemsList = page.locator('ol').filter({ has: page.locator('li') });
    this.downloadPdfButton = page.getByRole('button', { name: /download pdf/i });
    this.showAnswerKeyButton = page.getByRole('button', { name: /answers/i });
    this.backToCategoryLink = page.getByRole('link', { name: /back to/i });

    // Filters (worksheet page - collapsible panel)
    this.filtersButton = page.getByRole('button', { name: /filters/i });
    this.filterPanel = page.locator('.bg-white.border-b'); // Filter panel when open
    this.difficultySection = page.getByRole('heading', { name: /difficulty level/i });
    this.tagSection = page.getByRole('heading', { name: /filter by tags/i });
    this.applyFiltersButton = page.getByRole('button', { name: /apply filters/i });
    this.clearFiltersButton = page.getByRole('button', { name: /clear all/i });

    // Breadcrumb
    this.breadcrumb = page.locator('nav').filter({ hasText: /home/i });

    // Sidebar navigation
    this.sidebar = page.locator('aside').first();
    this.sidebarLogo = page.getByRole('link', { name: /mathpractice/i });

    // States
    this.loadingSpinner = page.locator('.animate-spin');
    this.errorMessage = page.locator('[class*="text-red"], [class*="#dc2626"]').filter({ hasText: /error/i });
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
    await this.page.getByRole('link', { name: new RegExp(category, 'i') }).first().click();
  }

  /**
   * Click a subcategory link on the category page
   */
  async selectSubcategory(subcategory: string) {
    await this.page.getByRole('link', { name: new RegExp(subcategory, 'i') }).first().click();
  }

  /**
   * Open the filter panel (if closed)
   */
  async openFilters() {
    const button = this.filtersButton;
    // Check if filters panel is not already open by checking button state
    const isActive = await button.evaluate((el) => el.classList.contains('bg-[var(--color-teal-500)]'));
    if (!isActive) {
      await button.click();
    }
  }

  /**
   * Toggle a difficulty filter checkbox (worksheet page only)
   * Must call openFilters() first
   */
  async toggleDifficulty(difficulty: 'EASY' | 'MEDIUM' | 'HARD') {
    await this.openFilters();
    const checkbox = this.page.getByRole('checkbox', { name: new RegExp(difficulty, 'i') });
    await checkbox.click();
  }

  /**
   * Toggle a tag filter checkbox (worksheet page only)
   * Must call openFilters() first
   */
  async toggleTag(tag: string) {
    await this.openFilters();
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
    await this.openFilters();
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
   * Get filter pending badge visibility (Changed badge)
   */
  async hasFilterPendingBadge(): Promise<boolean> {
    const badge = this.page.getByText(/changed/i);
    return await badge.isVisible();
  }

  /**
   * Get current URL path
   */
  getCurrentPath(): string {
    return new URL(this.page.url()).pathname;
  }

  /**
   * Check if sidebar is visible
   */
  async isSidebarVisible(): Promise<boolean> {
    return await this.sidebar.isVisible();
  }
}
