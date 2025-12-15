import { classNames } from "@/utils/utils";
import { Fraction } from "./Fraction";


/**
 * Render a mixed number: e.g. 1 3/4 as "1" + fraction.
 * The whole part and the fraction are baseline-aligned via flex.
 */
export function MixedNumber({ whole, numerator, denominator, className }: { numerator: string; denominator: string; className?: string; whole: string; }) {
  return (
    <span
      className={classNames(
        "inline-flex flex-row items-center mx-0.5 min-h-[1.9em] align-middle justify-center",
        className || ''
      )}
    >
      <span
        className="mr-0.5 font-math text-lg shrink-0 leading-tight min-w-[0.7em] text-right"
      >
        {whole}
      </span>
      <Fraction numerator={numerator} denominator={denominator} />
    </span>
  );
}
