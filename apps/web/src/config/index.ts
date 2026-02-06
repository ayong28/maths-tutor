/**
 * Config barrel export
 *
 * Theme colors defined in index.css using Tailwind v4 @theme directive.
 * Use Tailwind classes directly (e.g., bg-slate-900, text-teal-500).
 */

// Category design system
export {
  categoryIcons,
  categoryThemes,
  getCategoryIcon,
  getCategoryTheme,
  type CategoryKey,
  type CategoryTheme,
} from "./categories";

// App constants
export { UI_CONFIG, DIFFICULTY_LEVELS } from "./constants";
