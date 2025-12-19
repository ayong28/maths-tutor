import { classNames } from "@/utils/utils";

/**
 * Render a simple fraction (proper, improper) in math notation, e.g. 3/4.
 * Improved: add `min-h-[1.2em]` and align numerators and denominators.
 */
export function Fraction({
  numerator,
  denominator,
  className,
}: {
  numerator: string;
  denominator: string;
  className?: string;
}) {
  // Use baseline by default and center text with min-w/-h to ensure uniform height.
  return (
    <span
      className={classNames(
        "inline-flex flex-col items-center mx-0.5 min-w-[1 rem] min-h-[1 rem] justify-center align-middle",
        className || ""
      )}
    >
      <span className="border-b border-blue-600 px-0.5 leading-tight font-math text-sm">
        {numerator}
      </span>
      <span className="leading-tight font-math text-sm">{denominator}</span>
    </span>
  );
}
