import { Page, Locator, expect } from '@playwright/test';

/**
 * Page Object Model for the Math Worksheet Application
 * Encapsulates common interactions and assertions
 */
export class WorksheetPage {
  readonly page: Page;

  // Header elements
  readonly headerTitle: Locator;
  readonly headerSubtitle: Locator;

  // Sidebar elements
  readonly topicsHeading: Locator;
  readonly categoryButtons: Locator;
  readonly difficultySection: Locator;
  readonly tagSection: Locator;
  readonly applyFiltersButton: Locator;
  readonly clearFiltersButton: Locator;

  // Main content elements
  readonly heroSection: Locator;
  readonly pageTitle: Locator;
  readonly problemsList: Locator;
  readonly downloadPdfButton: Locator;
  readonly showAnswerKeyButton: Locator;
  readonly backToCategoriesButton: Locator;

  // Loading/Error states
  readonly loadingSpinner: Locator;
  readonly errorMessage: Locator;

  constructor(page: Page) {
    this.page = page;

    // Header
    this.headerTitle = page.getByRole('heading', { name: /maths tutoring worksheets/i });
    this.headerSubtitle = page.locator('header').getByText(/select a topic and category/i);

    // Sidebar
    this.topicsHeading = page.getByRole('heading', { name: /topics/i });
    this.categoryButtons = page.getByRole('button').filter({ hasText: /fractions|algebra/i });
    this.difficultySection = page.getByText(/filter by difficulty/i);
    this.tagSection = page.getByText(/filter by tags/i);
    this.applyFiltersButton = page.getByRole('button', { name: /apply filters/i });
    this.clearFiltersButton = page.getByRole('button', { name: /clear filters/i });

    // Main content
    this.heroSection = page.getByRole('heading', { name: /master math with/i });
    this.pageTitle = page.getByRole('heading', { level: 2 }).filter({ hasText: /fractions|algebra/i });
    this.problemsList = page.locator('ol').filter({ has: page.locator('li') });
    this.downloadPdfButton = page.getByRole('button', { name: /download pdf/i });
    this.showAnswerKeyButton = page.getByRole('button', { name: /show answer key|hide answer key/i });
    this.backToCategoriesButton = page.getByRole('button', { name: /back to categories/i });

    // States
    this.loadingSpinner = page.getByText(/loading/i);
    this.errorMessage = page.locator('[class*="text-red"]').filter({ hasText: /error/i });
  }

  /**
   * Navigate to the homepage
   */
  async goto() {
    await this.page.goto('/');
  }

  /**
   * Select a category from the sidebar
   */
  async selectCategory(category: 'Fractions' | 'Algebra') {
    await this.page.getByRole('button', { name: category, exact: true }).click();
  }

  /**
   * Select a subcategory (must have category selected first)
   */
  async selectSubcategory(subcategory: string) {
    await this.page.getByRole('button', { name: subcategory, exact: true }).click();
  }

  /**
   * Toggle a difficulty filter checkbox
   */
  async toggleDifficulty(difficulty: 'EASY' | 'MEDIUM' | 'HARD') {
    const checkbox = this.page.getByRole('checkbox', { name: new RegExp(difficulty, 'i') });
    await checkbox.click();
  }

  /**
   * Toggle a tag filter checkbox
   */
  async toggleTag(tag: string) {
    const checkbox = this.page.locator(`input[type="checkbox"][id^="tag-"]`).filter({ hasText: tag });
    await checkbox.click();
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
   * Go back to categories (clear subcategory selection)
   */
  async goBackToCategories() {
    await this.backToCategoriesButton.click();
  }

  /**
   * Wait for problems to load
   */
  async waitForProblemsToLoad() {
    await this.page.waitForLoadState('networkidle');
    await expect(this.loadingSpinner).toBeHidden({ timeout: 10000 });
  }

  /**
   * Get the count of displayed problems
   */
  async getProblemCount(): Promise<number> {
    const problems = await this.problemsList.locator('li').all();
    return problems.length;
  }

  /**
   * Check if hero section is visible
   */
  async isHeroVisible(): Promise<boolean> {
    return await this.heroSection.isVisible();
  }

  /**
   * Check if a category is highlighted/selected
   */
  async isCategorySelected(category: string): Promise<boolean> {
    const button = this.page.getByRole('button', { name: category, exact: true });
    const className = await button.getAttribute('class');
    return className?.includes('bg-blue-200') || false;
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
}
