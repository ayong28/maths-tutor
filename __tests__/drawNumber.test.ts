import { drawNumber } from '../generate-worksheet-pdf';
import { MockPDFDocument } from '../__mocks__/pdfkit';

describe('drawNumber', () => {
  let mockDoc: MockPDFDocument;

  beforeEach(() => {
    mockDoc = new MockPDFDocument();
  });

  describe('Whole numbers', () => {
    it('should render whole numbers as plain text', () => {
      const width = drawNumber(mockDoc as any, 100, 200, '5', 12);

      const textCalls = mockDoc.getTextCalls();
      expect(textCalls.some(call => call.text === '5')).toBe(true);
      expect(width).toBeGreaterThan(0);
    });

    it('should handle multi-digit whole numbers', () => {
      const width = drawNumber(mockDoc as any, 100, 200, '42', 12);

      const textCalls = mockDoc.getTextCalls();
      expect(textCalls.some(call => call.text === '42')).toBe(true);
      expect(width).toBeGreaterThan(0);
    });
  });

  describe('Simple fractions', () => {
    it('should render simple fractions with numerator and denominator', () => {
      const width = drawNumber(mockDoc as any, 100, 200, '1/2', 12);

      // Should draw numerator and denominator separately
      const textCalls = mockDoc.getTextCalls();
      expect(textCalls.some(call => call.text === '1')).toBe(true);
      expect(textCalls.some(call => call.text === '2')).toBe(true);
      expect(width).toBeGreaterThan(0);
    });

    it('should handle various fractions', () => {
      const fractions = ['1/8', '3/4', '5/6', '7/10'];

      fractions.forEach(fraction => {
        mockDoc.reset();
        const width = drawNumber(mockDoc as any, 100, 200, fraction, 12);
        expect(width).toBeGreaterThan(0);

        const [num, denom] = fraction.split('/');
        const textCalls = mockDoc.getTextCalls();
        expect(textCalls.some(call => call.text === num)).toBe(true);
        expect(textCalls.some(call => call.text === denom)).toBe(true);
      });
    });
  });

  describe('Mixed numbers', () => {
    it('should render mixed numbers with whole and fraction parts', () => {
      const width = drawNumber(mockDoc as any, 100, 200, '1 1/2', 12);

      const textCalls = mockDoc.getTextCalls();
      expect(textCalls.some(call => call.text === '1')).toBe(true);
      expect(textCalls.some(call => call.text === '1')).toBe(true); // numerator
      expect(textCalls.some(call => call.text === '2')).toBe(true); // denominator
      expect(width).toBeGreaterThan(0);
    });

    it('should handle various mixed numbers', () => {
      const mixedNumbers = ['2 3/4', '3 1/8', '1 5/6'];

      mixedNumbers.forEach(mixed => {
        mockDoc.reset();
        const width = drawNumber(mockDoc as any, 100, 200, mixed, 12);
        expect(width).toBeGreaterThan(0);
      });
    });
  });

  describe('Algebraic expressions', () => {
    it('should render algebraic text as plain text', () => {
      const width = drawNumber(mockDoc as any, 100, 200, '5a', 12);

      const textCalls = mockDoc.getTextCalls();
      expect(textCalls.some(call => call.text === '5a')).toBe(true);
      expect(width).toBeGreaterThan(0);
    });

    it('should handle various algebraic expressions', () => {
      const expressions = ['2a', '3x', '5ab', 'xy', 'x²', '4m²'];

      expressions.forEach(expression => {
        mockDoc.reset();
        const width = drawNumber(mockDoc as any, 100, 200, expression, 12);

        const textCalls = mockDoc.getTextCalls();
        expect(textCalls.some(call => call.text === expression)).toBe(true);
        expect(width).toBeGreaterThan(0);
      });
    });

    it('should handle multi-term algebraic expressions', () => {
      const expression = '6a + 3b';
      const width = drawNumber(mockDoc as any, 100, 200, expression, 12);

      const textCalls = mockDoc.getTextCalls();
      expect(textCalls.some(call => call.text === expression)).toBe(true);
      expect(width).toBeGreaterThan(0);
    });
  });

  describe('Edge cases', () => {
    it('should handle empty strings', () => {
      const width = drawNumber(mockDoc as any, 100, 200, '', 12);
      expect(width).toBeGreaterThanOrEqual(0);
    });

    it('should handle whitespace-only strings', () => {
      const width = drawNumber(mockDoc as any, 100, 200, '   ', 12);
      expect(width).toBeGreaterThanOrEqual(0);
    });

    it('should trim whitespace from input', () => {
      const width1 = drawNumber(mockDoc as any, 100, 200, '5a', 12);
      mockDoc.reset();
      const width2 = drawNumber(mockDoc as any, 100, 200, '  5a  ', 12);

      expect(width1).toBe(width2);
    });
  });
});
