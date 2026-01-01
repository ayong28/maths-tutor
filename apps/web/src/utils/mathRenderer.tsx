import type { ReactElement } from 'react';
import { Fraction } from '@/components/Fraction';
import { MixedNumber } from '@/components/MixedNumber';
import { tokenizeMathExpression, parseFraction, parseMixedNumber } from './utils';

/**
 * Render a math expression with proper fraction/mixed number formatting
 * Handles: "2/3", "1 1/2", "2/3 + 1/4", "3a + 2b", etc.
 */
export function renderMathExpression(expr: string): ReactElement {
  const tokens = tokenizeMathExpression(expr);

  return (
    <span className="inline-flex flex-row items-center flex-wrap [-webkit-font-smoothing:auto]">
      {tokens.map((token, idx) => {
        const cleanedToken = token.trim();

        if (!cleanedToken) {
          return <span key={`whitespace-${idx}`} className="mx-0.5" />;
        }

        // Check for mixed numbers (e.g., "1 1/2")
        const mixed = parseMixedNumber(cleanedToken);
        if (mixed) {
          return (
            <MixedNumber
              key={`mixed-${idx}`}
              whole={mixed.whole}
              numerator={mixed.numerator}
              denominator={mixed.denominator}
            />
          );
        }

        // Check for fractions (e.g., "2/3")
        const frac = parseFraction(cleanedToken);
        if (frac) {
          return (
            <Fraction
              key={`fraction-${idx}`}
              numerator={frac.numerator}
              denominator={frac.denominator}
            />
          );
        }

        // Fill-in blank
        if (cleanedToken === "___") {
          return (
            <span
              key={`fill-${idx}`}
              className="inline-block border-b border-dashed border-blue-300 w-16 align-middle mx-2 min-h-[1.5em]"
            />
          );
        }

        // Regular token (operator, number, variable)
        return (
          <span
            key={`token-${idx}`}
            className="mx-0.5 select-none font-math text-xl leading-tight min-w-[0.8em] text-center inline-block align-middle"
          >
            {cleanedToken}
          </span>
        );
      })}
    </span>
  );
}
