import { drawExpression } from '../generate-worksheet-pdf';
import { MockPDFDocument } from '../__mocks__/pdfkit';

describe('drawExpression', () => {
  let mockDoc: MockPDFDocument;

  beforeEach(() => {
    mockDoc = new MockPDFDocument();
  });

  describe('Algebraic expressions', () => {
    it('should render single-term algebraic expressions as plain text', () => {
      const width = drawExpression(mockDoc as any, 100, 200, '5a', 12);

      const textCalls = mockDoc.getTextCalls();
      expect(textCalls.length).toBeGreaterThan(0);
      expect(textCalls[0]!.text).toBe('5a');
      expect(width).toBeGreaterThan(0);
    });

    it('should render two-term algebraic expressions as plain text', () => {
      const width = drawExpression(mockDoc as any, 100, 200, '2a + 3a', 12);

      const textCalls = mockDoc.getTextCalls();
      expect(textCalls.some(call => call.text === '2a + 3a')).toBe(true);
      expect(width).toBeGreaterThan(0);
    });

    it('should render multi-term algebraic expressions as plain text (bug fix)', () => {
      // This is the critical test for the bug we fixed
      const expression = '2a + 3b + 4a';
      const width = drawExpression(mockDoc as any, 100, 200, expression, 12);

      const textCalls = mockDoc.getTextCalls();
      // The entire expression should be rendered as one text call
      expect(textCalls.some(call => call.text === expression)).toBe(true);
      expect(width).toBeGreaterThan(0);
    });

    it('should handle complex multi-term expressions', () => {
      const expressions = [
        '5x + 2y - 3x + 4y',
        '3x² + 2x + 4x² + 5x',
        '2a + 3b + 4a + 5b + 6a',
      ];

      expressions.forEach(expression => {
        mockDoc.reset();
        const width = drawExpression(mockDoc as any, 100, 200, expression, 12);

        const textCalls = mockDoc.getTextCalls();
        expect(textCalls.some(call => call.text === expression)).toBe(true);
        expect(width).toBeGreaterThan(0);
      });
    });

    it('should handle expressions with subtraction', () => {
      const expression = '7a - 2b - 3a';
      const width = drawExpression(mockDoc as any, 100, 200, expression, 12);

      const textCalls = mockDoc.getTextCalls();
      expect(textCalls.some(call => call.text === expression)).toBe(true);
      expect(width).toBeGreaterThan(0);
    });

    it('should handle expressions with powers', () => {
      const expression = '3x² + 2x';
      const width = drawExpression(mockDoc as any, 100, 200, expression, 12);

      const textCalls = mockDoc.getTextCalls();
      expect(textCalls.some(call => call.text === expression)).toBe(true);
      expect(width).toBeGreaterThan(0);
    });
  });

  describe('Fraction expressions', () => {
    it('should handle simple fractions', () => {
      const width = drawExpression(mockDoc as any, 100, 200, '1/2', 12);

      expect(width).toBeGreaterThan(0);
      // Fractions are rendered specially with numerator, line, and denominator
    });

    it('should handle mixed numbers', () => {
      const width = drawExpression(mockDoc as any, 100, 200, '1 1/2', 12);

      expect(width).toBeGreaterThan(0);
    });

    it('should handle binary fraction operations', () => {
      const width = drawExpression(mockDoc as any, 100, 200, '1/8 + 3/8', 12);

      expect(width).toBeGreaterThan(0);
      // Should render both fractions and the operator
    });
  });

  describe('Edge cases', () => {
    it('should handle empty strings', () => {
      const width = drawExpression(mockDoc as any, 100, 200, '', 12);
      expect(width).toBeGreaterThanOrEqual(0);
    });

    it('should handle single numbers', () => {
      const width = drawExpression(mockDoc as any, 100, 200, '5', 12);
      expect(width).toBeGreaterThan(0);
    });

    it('should return consistent width for same expression', () => {
      const expression = '2a + 3b';
      const width1 = drawExpression(mockDoc as any, 100, 200, expression, 12);
      mockDoc.reset();
      const width2 = drawExpression(mockDoc as any, 100, 200, expression, 12);

      expect(width1).toBe(width2);
    });
  });
});
