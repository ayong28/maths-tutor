
// ...existing code...

export function classNames(...classes: string[]) {
  return classes.filter(Boolean).join(" ");
}// --- Fraction rendering helpers ---
/**
 * Given a string like "2/3" returns {numerator: 2, denominator: 3}, or null if not a fraction.
 */
export function parseFraction(str: string) {
  const fracMatch = String(str).match(/^(\d+)\s*\/\s*(\d+)$/);
  if (fracMatch) return { numerator: fracMatch[1], denominator: fracMatch[2] };
  return null;
}
/**
 * Given a string like "3 1/4" returns {whole: 3, numerator:1, denominator:4}, else null.
 */
export function parseMixedNumber(str: string) {
  const mixMatch = String(str).match(/^(\d+)\s+(\d+)\s*\/\s*(\d+)$/);
  if (mixMatch) {
    return {
      whole: mixMatch[1],
      numerator: mixMatch[2],
      denominator: mixMatch[3]
    };
  }
  return null;
}

