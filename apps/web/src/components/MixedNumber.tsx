import { type FC } from "react";
import { classNames } from "@/utils/utils";
import { Fraction } from "./Fraction";

type MixedNumberProps = {
  whole: string;
  numerator: string;
  denominator: string;
  className?: string;
};

/**
 * Render a mixed number: e.g. 1 3/4 as "1" + fraction.
 * The whole part and the fraction are baseline-aligned via flex.
 */
export const MixedNumber: FC<MixedNumberProps> = ({
  whole,
  numerator,
  denominator,
  className,
}) => {
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
};
