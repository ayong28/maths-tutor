import { test, expect } from "@playwright/test";
import { WorksheetPage } from "../fixtures/WorksheetPage";

type CategoryInfo = {
  type: string;
  count: number;
  displayName: string;
  mainCategory: string;
  subCategory: string;
};

const API_BASE_URL =
  process.env.E2E_API_BASE_URL ?? "http://localhost:3001/api";

let categories: CategoryInfo[] = [];

const toSlug = (value: string): string =>
  value
    .toLowerCase()
    .replace(/\s+/g, "-")
    .replace(/&/g, "")
    .replace(/[^a-z0-9-]/g, "")
    .replace(/-+/g, "-")
    .replace(/^-|-$/g, "");

test.beforeAll(async ({ request }) => {
  const response = await request.get(`${API_BASE_URL}/categories`);
  expect(response.ok()).toBeTruthy();
  categories = (await response.json()) as CategoryInfo[];
  expect(Array.isArray(categories)).toBeTruthy();
});

test.describe("Category and sub-category access", () => {
  test("should reach every category and sub-category from the homepage", async ({
    page,
  }) => {
    test.setTimeout(180 * 1000);
    test.skip(!categories.length, "No categories returned from API");

    const worksheetPage = new WorksheetPage(page);
    const grouped = categories.reduce<Record<string, string[]>>(
      (acc, category) => {
        if (!category.mainCategory || !category.subCategory) {
          return acc; // Skip invalid entries
        }
        const mainCategory = category.mainCategory;
        if (!acc[mainCategory]) {
          acc[mainCategory] = [];
        }
        const subCategory = acc[mainCategory];
        if (!subCategory.includes(category.subCategory)) {
          subCategory.push(category.subCategory);
        }
        return acc;
      },
      {},
    );

    for (const [mainCategory, subCategories] of Object.entries(grouped)) {
      await test.step(`Open ${mainCategory}`, async () => {
        await worksheetPage.goto();
        await worksheetPage.waitForPageReady();

        const categoryLink = page
          .locator("main")
          .getByRole("link", { name: new RegExp(mainCategory, "i") })
          .first();

        await expect(
          categoryLink,
          `Missing card for ${mainCategory}`,
        ).toBeVisible();

        const categorySlug = toSlug(mainCategory);

        page.waitForURL(new RegExp(`/${categorySlug}(?:\\?.*)?$`, "i"));
        categoryLink.click();

        await expect(page).toHaveURL(
          new RegExp(`/${categorySlug}(?:\\?.*)?$`, "i"),
        );

        await expect(
          page.getByRole("heading", { name: new RegExp(mainCategory, "i") }),
        ).toBeVisible();

        for (const subCategory of subCategories) {
          await test.step(`Navigate to ${mainCategory} → ${subCategory}`, async () => {
            const subLink = page
              .locator("main")
              .getByRole("link", { name: new RegExp(subCategory, "i") })
              .first();

            await expect(
              subLink,
              `Missing sub-category ${subCategory}`,
            ).toBeVisible();

            const subSlug = toSlug(subCategory);

            page.waitForURL(
              new RegExp(`/${categorySlug}/${subSlug}(?:\\?.*)?$`, "i"),
            );
            subLink.click();

            await expect(page).toHaveURL(
              new RegExp(`/${categorySlug}/${subSlug}(?:\\?.*)?$`, "i"),
            );
            await expect(
              page.getByRole("heading", {
                level: 1,
                name: new RegExp(subCategory, "i"),
              }),
            ).toBeVisible();

            await page.goBack();
            await worksheetPage.waitForPageReady();
          });
        }
      });
    }
  });
});
