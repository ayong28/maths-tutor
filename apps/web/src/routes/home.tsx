/* eslint-disable react-refresh/only-export-components */
import { useLoaderData, Link } from "react-router";
import { getCategories } from "@/api/client";
import { buildTypeMap, setCachedTypeMap, toSlug } from "@/utils/routing";
import {
  Loader2,
  BookOpen,
  Calculator,
  Sigma,
  Hash,
  Percent,
  ArrowRight,
  Sparkles,
} from "lucide-react";
import BetaBadge from "@/components/BetaBadge";

// Type for loader data
type LoaderData = Awaited<ReturnType<typeof clientLoader>>;

// Category icons mapping
const categoryIcons: Record<string, React.ReactNode> = {
  Fractions: <BookOpen className="w-7 h-7" />,
  Algebra: <span className="text-2xl font-heading font-bold">x</span>,
  Integers: <span className="text-2xl font-heading font-bold">±</span>,
  Decimals: <Hash className="w-7 h-7" />,
  Percentages: <Percent className="w-6 h-6" />,
  Ratios: <Sigma className="w-6 h-6" />,
  default: <Calculator className="w-6 h-6" />,
};

// Category colors
const categoryColors: Record<
  string,
  { bg: string; accent: string; hover: string }
> = {
  Fractions: {
    bg: "from-[#0d9488]/10 to-[#14b8a6]/5",
    accent: "bg-[var(--color-teal-500)]",
    hover: "group-hover:bg-[var(--color-teal-600)]",
  },
  Algebra: {
    bg: "from-[#8b5cf6]/10 to-[#a78bfa]/5",
    accent: "bg-[#8b5cf6]",
    hover: "group-hover:bg-[#7c3aed]",
  },
  Integers: {
    bg: "from-[#f59e0b]/10 to-[#fbbf24]/5",
    accent: "bg-[var(--color-amber-500)]",
    hover: "group-hover:bg-[#d97706]",
  },
  Decimals: {
    bg: "from-[#ec4899]/10 to-[#f472b6]/5",
    accent: "bg-[#ec4899]",
    hover: "group-hover:bg-[#db2777]",
  },
  Percentages: {
    bg: "from-[#3b82f6]/10 to-[#60a5fa]/5",
    accent: "bg-[#3b82f6]",
    hover: "group-hover:bg-[#2563eb]",
  },
  Ratios: {
    bg: "from-[#10b981]/10 to-[#34d399]/5",
    accent: "bg-[#10b981]",
    hover: "group-hover:bg-[#059669]",
  },
  default: {
    bg: "from-[var(--color-slate-200)]/50 to-[var(--color-slate-100)]/30",
    accent: "bg-[var(--color-slate-500)]",
    hover: "group-hover:bg-[var(--color-slate-600)]",
  },
};

// Fetch data before rendering
export async function clientLoader() {
  const categories = await getCategories();

  // Build and cache the TYPE_MAP for use in other routes
  const typeMap = buildTypeMap(categories);
  setCachedTypeMap(typeMap);

  // Build category structure
  const categoryStructure: Record<string, Set<string>> = {};
  const categoryInfo: Record<string, { display: string; count: number }> = {};

  categories.forEach((cat) => {
    if (!categoryStructure[cat.mainCategory]) {
      categoryStructure[cat.mainCategory] = new Set();
      categoryInfo[cat.mainCategory] = {
        display: cat.mainCategory,
        count: 0,
      };
    }
    categoryStructure[cat.mainCategory].add(cat.subCategory);
    categoryInfo[cat.mainCategory].count++;
  });

  const categoryList = Object.keys(categoryStructure);

  return {
    categoryList,
    categoryStructure,
    categoryInfo,
  };
}

// Loading fallback (shown while clientLoader runs)
export function HydrateFallback() {
  return (
    <div className="min-h-screen p-8">
      <div className="max-w-6xl mx-auto">
        <div className="flex items-center justify-center gap-3 py-24">
          <Loader2 className="w-8 h-8 animate-spin text-[var(--color-teal-500)]" />
          <p className="text-[var(--color-slate-500)] font-medium">
            Loading topics...
          </p>
        </div>
      </div>
    </div>
  );
}

// Component uses useLoaderData hook
export default function Home() {
  const { categoryList, categoryInfo } = useLoaderData<LoaderData>();

  return (
    <div className="min-h-screen">
      <BetaBadge />

      {/* Hero Section */}
      <div className="relative overflow-hidden bg-gradient-to-br from-[var(--color-slate-900)] via-[var(--color-slate-800)] to-[var(--color-slate-900)]">
        {/* Decorative elements */}
        <div className="absolute inset-0 overflow-hidden">
          {/* Gradient orbs */}
          <div className="absolute -top-24 -right-24 w-96 h-96 rounded-full bg-gradient-to-br from-[var(--color-teal-400)]/30 to-transparent blur-3xl" />
          <div className="absolute -bottom-32 -left-32 w-[500px] h-[500px] rounded-full bg-gradient-to-tr from-[var(--color-amber-400)]/20 to-transparent blur-3xl" />

          {/* Grid pattern */}
          <div
            className="absolute inset-0 opacity-[0.03]"
            style={{
              backgroundImage: `linear-gradient(var(--color-slate-400) 1px, transparent 1px), linear-gradient(90deg, var(--color-slate-400) 1px, transparent 1px)`,
              backgroundSize: "60px 60px",
            }}
          />

          {/* Floating math symbols */}
          <div className="absolute top-20 left-1/4 text-[var(--color-teal-400)]/20 text-6xl font-heading font-bold animate-float">
            ∑
          </div>
          <div
            className="absolute bottom-20 right-1/4 text-[var(--color-amber-400)]/20 text-5xl font-heading font-bold animate-float"
            style={{ animationDelay: "1s" }}
          >
            π
          </div>
          <div
            className="absolute top-1/2 right-1/6 text-[var(--color-teal-300)]/15 text-4xl font-heading font-bold animate-float"
            style={{ animationDelay: "2s" }}
          >
            √
          </div>
        </div>

        {/* Hero Content */}
        <div className="relative z-10 px-8 py-20 md:py-28">
          <div className="max-w-4xl mx-auto text-center">
            {/* Badge */}
            <div className="inline-flex items-center gap-2 px-4 py-2 rounded-full bg-[var(--color-teal-500)]/10 border border-[var(--color-teal-500)]/20 mb-8 animate-fade-in-up">
              <Sparkles className="w-4 h-4 text-[var(--color-teal-400)]" />
              <span className="text-sm font-medium text-[var(--color-teal-300)]">
                VCAA Level 7 Curriculum
              </span>
            </div>

            {/* Heading */}
            <h1 className="font-heading text-4xl md:text-5xl lg:text-6xl font-bold text-white mb-6 animate-fade-in-up delay-100">
              Master Maths with
              <br />
              <span className="text-transparent bg-clip-text bg-gradient-to-r from-[var(--color-teal-400)] to-[var(--color-amber-400)]">
                Year 7 Practice Worksheets
              </span>
            </h1>

            {/* Description */}
            <p className="text-lg md:text-xl text-[var(--color-slate-300)] max-w-2xl mx-auto mb-10 animate-fade-in-up delay-200">
              Build confidence through practice. 4,628 carefully crafted
              problems across 29 topic types, ready to print as PDF worksheets.
            </p>

            {/* Stats */}
            <div className="flex flex-wrap items-center justify-center gap-8 md:gap-12 animate-fade-in-up delay-300">
              <div className="text-center">
                <p className="text-3xl md:text-4xl font-heading font-bold text-white">
                  4,628
                </p>
                <p className="text-sm text-[var(--color-slate-400)]">
                  Problems
                </p>
              </div>
              <div className="w-px h-12 bg-[var(--color-slate-700)]" />
              <div className="text-center">
                <p className="text-3xl md:text-4xl font-heading font-bold text-white">
                  29
                </p>
                <p className="text-sm text-[var(--color-slate-400)]">
                  Topic Types
                </p>
              </div>
              <div className="w-px h-12 bg-[var(--color-slate-700)]" />
              <div className="text-center">
                <p className="text-3xl md:text-4xl font-heading font-bold text-white">
                  3
                </p>
                <p className="text-sm text-[var(--color-slate-400)]">
                  Difficulty Levels
                </p>
              </div>
            </div>
          </div>
        </div>

        {/* Bottom wave/curve */}
        <div
          className="absolute bottom-0 left-0 right-0 h-16 bg-[var(--color-cream)]"
          style={{
            clipPath: "ellipse(70% 100% at 50% 100%)",
          }}
        />
      </div>

      {/* Category Cards Section */}
      <div className="px-8 py-16 -mt-4">
        <div className="max-w-6xl mx-auto">
          {/* Section Header */}
          <div className="flex items-end justify-between mb-10">
            <div>
              <h2 className="font-heading text-2xl md:text-3xl font-bold text-[var(--color-slate-800)] mb-2">
                Choose a Topic
              </h2>
              <p className="text-[var(--color-slate-500)]">
                Select a math topic to explore worksheets and start practicing
              </p>
            </div>
            <div className="hidden md:flex items-center gap-2 text-sm text-[var(--color-slate-500)]">
              <span>{categoryList.length} topics available</span>
            </div>
          </div>

          {/* Category Grid */}
          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-5">
            {categoryList.map((category, index) => {
              const slug = toSlug(category);
              const info = categoryInfo[category];
              const icon = categoryIcons[category] || categoryIcons["default"];
              const colors =
                categoryColors[category] || categoryColors["default"];

              return (
                <Link
                  key={category}
                  to={`/${slug}`}
                  className={`group relative overflow-hidden rounded-2xl bg-gradient-to-br ${colors.bg} border border-[var(--color-slate-200)] p-6 transition-all duration-300 hover:shadow-lg hover:border-[var(--color-slate-300)] hover:-translate-y-1 animate-scale-in`}
                  style={{ animationDelay: `${index * 75}ms` }}
                >
                  {/* Icon */}
                  <div
                    className={`inline-flex items-center justify-center w-14 h-14 rounded-xl ${colors.accent} ${colors.hover} text-white mb-4 transition-colors shadow-md`}
                  >
                    {icon}
                  </div>

                  {/* Content */}
                  <h3 className="font-heading text-xl font-bold text-[var(--color-slate-800)] mb-1 group-hover:text-[var(--color-slate-900)]">
                    {category}
                  </h3>
                  <p className="text-sm text-[var(--color-slate-500)] mb-4">
                    {info.count} worksheet {info.count === 1 ? "type" : "types"}
                  </p>

                  {/* Arrow indicator */}
                  <div className="flex items-center gap-2 text-sm font-medium text-[var(--color-slate-600)] group-hover:text-[var(--color-slate-800)]">
                    <span>Explore</span>
                    <ArrowRight className="w-4 h-4 transition-transform group-hover:translate-x-1" />
                  </div>

                  {/* Decorative corner */}
                  <div className="absolute top-0 right-0 w-24 h-24 bg-gradient-to-bl from-white/40 to-transparent rounded-bl-[100px] opacity-0 group-hover:opacity-100 transition-opacity" />
                </Link>
              );
            })}
          </div>
        </div>
      </div>
    </div>
  );
}
