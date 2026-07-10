import { type Page, type Locator, expect } from '@playwright/test';

export class WorksheetPage {
  readonly page: Page;

  // Homepage
  readonly heroHeading: Locator;
  readonly heroDescription: Locator;
  readonly categoryGrid: Locator;
  readonly categoryLinks: Locator;
  readonly fractionsLink: Locator;

  // Category page
  readonly categoryHeading: Locator;
  readonly subcategoryLinks: Locator;
  readonly backToAllTopicsLink: Locator;

  // Worksheet page
  readonly worksheetHeading: Locator;
  readonly problemsList: Locator;
  readonly downloadPdfButton: Locator;
  readonly showAnswerKeyButton: Locator;
  readonly backToCategoryLink: Locator;

  // Filters
  readonly filtersButton: Locator;
  readonly filterPanel: Locator;
  readonly difficultySection: Locator;
  readonly tagSection: Locator;
  readonly applyFiltersButton: Locator;
  readonly clearFiltersButton: Locator;

  // Breadcrumb
  readonly breadcrumb: Locator;

  // Sidebar
  readonly sidebar: Locator;
  readonly sidebarLogo: Locator;
  readonly mobileMenuButton: Locator;

  // States
  readonly loadingSpinner: Locator;
  readonly errorMessage: Locator;

  constructor(page: Page) {
    this.page = page;

    // Homepage
    this.heroHeading = page.getByRole('heading', { name: /master maths with/i });
    this.heroDescription = page.getByText(/build confidence through practice/i);
    this.categoryGrid = page.locator('.grid').filter({ has: page.locator('a[href^="/"]') });
    this.categoryLinks = page.locator('a[href^="/"]').filter({ has: page.locator('h3') });
    this.fractionsLink = page.getByRole('link', { name: /fractions/i }).filter({ has: page.locator('h3', { hasText: /fractions/i }) });

    // Category page
    this.categoryHeading = page.getByRole('heading', { level: 1 });
    this.subcategoryLinks = page.locator('a[href*="/"]').filter({ has: page.locator('h3') });
    this.backToAllTopicsLink = page.getByRole('link', { name: /back to all topics/i });

    // Worksheet page
    this.worksheetHeading = page.getByRole('heading', { level: 1 });
    this.problemsList = page.locator('ol').filter({ has: page.locator('li') });
    this.downloadPdfButton = page.locator('button[aria-label="Download PDF"]');
    this.showAnswerKeyButton = page.getByRole('button', { name: /answers/i });
    this.backToCategoryLink = page.getByRole('link', { name: /back to/i });

    // Filters
    this.filtersButton = page.getByRole('button', { name: /filters/i });
    this.filterPanel = page.locator('.bg-white.border-b');
    this.difficultySection = page.getByRole('heading', { name: /difficulty level/i });
    this.tagSection = page.getByRole('heading', { name: /filter by tags/i });
    this.applyFiltersButton = page.getByRole('button', { name: /apply filters/i });
    this.clearFiltersButton = page.getByRole('button', { name: /clear all/i });

    // Breadcrumb
    this.breadcrumb = page.locator('nav').filter({ hasText: /home/i });

    // Sidebar locators
    this.sidebar = page.locator('aside').first();
    this.sidebarLogo = page.getByRole('link', { name: /master math/i });
    this.mobileMenuButton = page.getByRole('button', { name: /open navigation menu/i });

    // States
    this.loadingSpinner = page.locator('.animate-spin');
    this.errorMessage = page.locator('[class*="text-red"], [class*="#dc2626"]').filter({ hasText: /error/i });
  }

  async goto() {
    await this.page.goto('/');
  }

  async gotoCategory(category: string) {
    const slug = category.toLowerCase().replace(/\s+/g, '-');
    await this.page.goto(`/${slug}`);
  }

  async gotoWorksheet(category: string, subcategory: string) {
    const catSlug = category.toLowerCase().replace(/\s+/g, '-');
    const subSlug = subcategory.toLowerCase().replace(/\s+/g, '-');
    await this.page.goto(`/${catSlug}/${subSlug}`);
  }

  async selectCategory(category: string) {
    await this.page.getByRole('link', { name: new RegExp(category, 'i') }).first().click();
  }

  async selectSubcategory(subcategory: string) {
    await this.page.getByRole('link', { name: new RegExp(subcategory, 'i') }).first().click();
  }

  async waitForPageReady() {
    await this.page.waitForLoadState('networkidle');
  }

  async toggleAnswerKey() {
    await this.showAnswerKeyButton.click();
  }

  async downloadPdf() {
    const [download] = await Promise.all([
      this.page.waitForEvent('download'),
      this.downloadPdfButton.click(),
    ]);
    return download;
  }

  async getProblemCount(): Promise<number> {
    const items = await this.problemsList.locator('li').all();
    return items.length;
  }

  async openFilters() {
    const button = this.filtersButton;
    const isActive = await button.evaluate((el) => el.classList.contains('bg-[var(--color-teal-500)]'));
    if (!isActive) {
      await button.click();
    }
  }

  async toggleDifficulty(difficulty: 'EASY' | 'MEDIUM' | 'HARD') {
    await this.openFilters();
    await this.page.getByRole('checkbox', { name: new RegExp(difficulty, 'i') }).click();
  }

  async toggleTag(tag: string) {
    await this.openFilters();
    await this.page.getByLabel(new RegExp(`filter by tag.*${tag}`, 'i')).click();
  }

  async applyFilters() {
    await this.applyFiltersButton.click();
  }

  async clearFilters() {
    await this.openFilters();
    await this.clearFiltersButton.click();
  }

  async hasFilterPendingBadge(): Promise<boolean> {
    const badge = this.page.getByText(/changed/i);
    return await badge.isVisible();
  }

  async openMobileSidebar() {
    await this.mobileMenuButton.click();
    await this.sidebar.waitFor({ state: 'visible' });
  }

  async isSidebarVisible(): Promise<boolean> {
    return await this.sidebar.isVisible();
  }

  async verifyNoErrors() {
    await expect(this.errorMessage).toBeHidden();
  }
}
