/**
 * Category Design System
 *
 * Centralized icons and color themes for math categories.
 * Core app theme (slate/teal) is preserved — these are supplementary accent colors.
 */

import {
  BookOpen,
  Variable,
  Plus,
  Hash,
  Percent,
  Scale,
  TrendingUp,
  Superscript,
  Shapes,
  BarChart3,
  Compass,
  Calculator,
} from "lucide-react";

// ============================================================================
// Types
// ============================================================================

export type CategoryKey =
  | "Fractions"
  | "Algebra"
  | "Integers"
  | "Decimals"
  | "Percentages"
  | "Ratio & Rates"
  | "Linear Graphs"
  | "Index Notation"
  | "Geometry"
  | "Statistics"
  | "Coordinates";

export type CategoryTheme = {
  /** Gradient for card backgrounds: "from-[...]/10 to-[...]/5" */
  bgGradient: string;
  /** Icon container background: "bg-[...]" */
  accent: string;
  /** Icon container hover: "group-hover:bg-[...]" */
  accentHover: string;
  /** Text accent color: "text-[...]" */
  textAccent: string;
  /** Border accent: "border-[...]" */
  borderAccent: string;
  /** Raw hex values for dynamic/inline styles */
  hex: {
    primary: string;
    dark: string;
  };
};

// ============================================================================
// Icons
// ============================================================================

const ICON_CLASS = "w-7 h-7";
const ICON_STROKE = 2.5;

export const categoryIcons: Record<string, React.ReactNode> = {
  Fractions: <BookOpen className={ICON_CLASS} strokeWidth={ICON_STROKE} />,
  Algebra: <Variable className={ICON_CLASS} strokeWidth={ICON_STROKE} />,
  Integers: <Plus className={ICON_CLASS} strokeWidth={ICON_STROKE} />,
  Decimals: <Hash className={ICON_CLASS} strokeWidth={ICON_STROKE} />,
  Percentages: <Percent className="w-6 h-6" strokeWidth={ICON_STROKE} />,
  "Ratio & Rates": <Scale className="w-6 h-6" strokeWidth={ICON_STROKE} />,
  "Linear Graphs": <TrendingUp className="w-6 h-6" strokeWidth={ICON_STROKE} />,
  "Index Notation": (
    <Superscript className="w-6 h-6" strokeWidth={ICON_STROKE} />
  ),
  Geometry: <Shapes className="w-6 h-6" strokeWidth={ICON_STROKE} />,
  Statistics: <BarChart3 className="w-6 h-6" strokeWidth={ICON_STROKE} />,
  Coordinates: <Compass className="w-6 h-6" strokeWidth={ICON_STROKE} />,
  default: <Calculator className="w-6 h-6" />,
};

// ============================================================================
// Color Themes
// ============================================================================

export const categoryThemes: Record<string, CategoryTheme> = {
  // Teal - Primary app accent
  Fractions: {
    bgGradient: "from-[#0d9488]/10 to-[#14b8a6]/5",
    accent: "bg-teal-500",
    accentHover: "group-hover:bg-teal-600",
    textAccent: "text-teal-600",
    borderAccent: "border-teal-300",
    hex: { primary: "#14b8a6", dark: "#0d9488" },
  },

  // Purple - Math/algebra
  Algebra: {
    bgGradient: "from-[#8b5cf6]/10 to-[#a78bfa]/5",
    accent: "bg-[#8b5cf6]",
    accentHover: "group-hover:bg-[#7c3aed]",
    textAccent: "text-[#7c3aed]",
    borderAccent: "border-[#c4b5fd]",
    hex: { primary: "#8b5cf6", dark: "#7c3aed" },
  },

  // Amber - Warmth
  Integers: {
    bgGradient: "from-[#f59e0b]/10 to-[#fbbf24]/5",
    accent: "bg-amber-500",
    accentHover: "group-hover:bg-[#d97706]",
    textAccent: "text-[#d97706]",
    borderAccent: "border-[#fcd34d]",
    hex: { primary: "#f59e0b", dark: "#d97706" },
  },

  // Pink - Contrast
  Decimals: {
    bgGradient: "from-[#ec4899]/10 to-[#f472b6]/5",
    accent: "bg-[#ec4899]",
    accentHover: "group-hover:bg-[#db2777]",
    textAccent: "text-[#db2777]",
    borderAccent: "border-[#f9a8d4]",
    hex: { primary: "#ec4899", dark: "#db2777" },
  },

  // Blue - Variety
  Percentages: {
    bgGradient: "from-[#3b82f6]/10 to-[#60a5fa]/5",
    accent: "bg-[#3b82f6]",
    accentHover: "group-hover:bg-[#2563eb]",
    textAccent: "text-[#2563eb]",
    borderAccent: "border-[#93c5fd]",
    hex: { primary: "#3b82f6", dark: "#2563eb" },
  },

  // Rose - Contrast
  "Ratio & Rates": {
    bgGradient: "from-[#f43f5e]/10 to-[#f87171]/5",
    accent: "bg-[#f43f5e]",
    accentHover: "group-hover:bg-[#e11d48]",
    textAccent: "text-[#e11d48]",
    borderAccent: "border-[#fda4af]",
    hex: { primary: "#f43f5e", dark: "#e11d48" },
  },

  // Purple - Graphs
  "Linear Graphs": {
    bgGradient: "from-[#8b5cf6]/10 to-[#a78bfa]/5",
    accent: "bg-[#8b5cf6]",
    accentHover: "group-hover:bg-[#7c3aed]",
    textAccent: "text-[#7c3aed]",
    borderAccent: "border-[#c4b5fd]",
    hex: { primary: "#8b5cf6", dark: "#7c3aed" },
  },

  // Blue - Powers/math
  "Index Notation": {
    bgGradient: "from-[#3b82f6]/10 to-[#60a5fa]/5",
    accent: "bg-[#3b82f6]",
    accentHover: "group-hover:bg-[#2563eb]",
    textAccent: "text-[#2563eb]",
    borderAccent: "border-[#93c5fd]",
    hex: { primary: "#3b82f6", dark: "#2563eb" },
  },

  // Amber - Shapes
  Geometry: {
    bgGradient: "from-[#f59e0b]/10 to-[#fbbf24]/5",
    accent: "bg-amber-500",
    accentHover: "group-hover:bg-[#d97706]",
    textAccent: "text-[#d97706]",
    borderAccent: "border-[#fcd34d]",
    hex: { primary: "#f59e0b", dark: "#d97706" },
  },

  // Emerald - Data
  Statistics: {
    bgGradient: "from-[#10b981]/10 to-[#34d399]/5",
    accent: "bg-[#10b981]",
    accentHover: "group-hover:bg-[#059669]",
    textAccent: "text-[#059669]",
    borderAccent: "border-[#6ee7b7]",
    hex: { primary: "#10b981", dark: "#059669" },
  },

  // Pink - Graphs/coordinates
  Coordinates: {
    bgGradient: "from-[#ec4899]/10 to-[#f472b6]/5",
    accent: "bg-[#ec4899]",
    accentHover: "group-hover:bg-[#db2777]",
    textAccent: "text-[#db2777]",
    borderAccent: "border-[#f9a8d4]",
    hex: { primary: "#ec4899", dark: "#db2777" },
  },

  // Default - Slate (fallback)
  default: {
    bgGradient: "from-slate-200/50 to-slate-100/30",
    accent: "bg-slate-500",
    accentHover: "group-hover:bg-slate-600",
    textAccent: "text-slate-600",
    borderAccent: "border-slate-300",
    hex: { primary: "#5a6577", dark: "#3d4654" },
  },
};

// ============================================================================
// Helper Functions
// ============================================================================

/**
 * Get the icon for a category
 */
export function getCategoryIcon(category: string): React.ReactNode {
  return categoryIcons[category] ?? categoryIcons["default"];
}

/**
 * Get the color theme for a category
 */
export function getCategoryTheme(category: string): CategoryTheme {
  return categoryThemes[category] ?? categoryThemes["default"];
}
