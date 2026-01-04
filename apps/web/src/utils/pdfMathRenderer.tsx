import { Text, View } from '@react-pdf/renderer';
import type { ReactElement } from 'react';
import { tokenizeMathExpression, parseFraction, parseMixedNumber } from './utils';

/**
 * Render a math expression for PDF using @react-pdf/renderer components
 * Converts fractions to inline text format (e.g., "2/3" stays as "2/3")
 */
export function renderPDFMathExpression(expr: string): ReactElement {
  // For PDFs, we'll use simpler text-based representation
  // Fractions will be displayed as "numerator/denominator"
  return <Text>{expr}</Text>;
}

/**
 * Alternative: More sophisticated rendering with fraction components
 * This attempts to render fractions vertically in PDFs
 */
export function renderPDFMathExpressionAdvanced(expr: string): ReactElement {
  const tokens = tokenizeMathExpression(expr);

  return (
    <View style={{ flexDirection: 'row', alignItems: 'center' }}>
      {tokens.map((token, idx) => {
        const cleanedToken = token.trim();

        if (!cleanedToken) {
          return <Text key={`whitespace-${idx}`}> </Text>;
        }

        // Check for mixed numbers (e.g., "1 1/2")
        const mixed = parseMixedNumber(cleanedToken);
        if (mixed) {
          return (
            <View key={`mixed-${idx}`} style={{ flexDirection: 'row', alignItems: 'center' }}>
              <Text style={{ marginRight: 2 }}>{mixed.whole}</Text>
              <View style={{ flexDirection: 'column', alignItems: 'center', marginHorizontal: 2 }}>
                <Text style={{ fontSize: 8, borderBottom: '1px solid black', paddingHorizontal: 2 }}>
                  {mixed.numerator}
                </Text>
                <Text style={{ fontSize: 8, paddingHorizontal: 2 }}>
                  {mixed.denominator}
                </Text>
              </View>
            </View>
          );
        }

        // Check for fractions (e.g., "2/3")
        const frac = parseFraction(cleanedToken);
        if (frac) {
          return (
            <View key={`fraction-${idx}`} style={{ flexDirection: 'column', alignItems: 'center', marginHorizontal: 2 }}>
              <Text style={{ fontSize: 8, borderBottom: '1px solid black', paddingHorizontal: 2 }}>
                {frac.numerator}
              </Text>
              <Text style={{ fontSize: 8, paddingHorizontal: 2 }}>
                {frac.denominator}
              </Text>
            </View>
          );
        }

        // Fill-in blank
        if (cleanedToken === "___") {
          return <Text key={`fill-${idx}`}>_______</Text>;
        }

        // Regular token (operator, number, variable)
        return <Text key={`token-${idx}`}> {cleanedToken} </Text>;
      })}
    </View>
  );
}
