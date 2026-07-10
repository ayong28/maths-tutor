import { type Page, type Locator, expect } from '@playwright/test';

export class Sidebar {
  readonly page: Page;
  readonly sidebar: Locator;
  readonly sidebarLogo: Locator;
  readonly mobileMenuButton: Locator;

  constructor(page: Page) {
    this.page = page;
    this.sidebar = page.locator('aside').first();
    this.sidebarLogo = page.getByRole('link', { name: /mathpractice/i });
    this.mobileMenuButton = page.getByRole('button', { name: /open navigation menu/i });
  }

  async isVisible(): Promise<boolean> {
    return await this.sidebar.isVisible();
  }

  async openMobileSidebar() {
    const isMenuVisible = await this.mobileMenuButton.isVisible();
    if (isMenuVisible) {
      await this.mobileMenuButton.click();
      await this.sidebar.waitFor({ state: 'visible' });
    }
  }
}
