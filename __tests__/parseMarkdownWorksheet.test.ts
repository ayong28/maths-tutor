import { parseMarkdownWorksheet } from '../generate-worksheet-pdf';
import path from 'path';

describe('parseMarkdownWorksheet', () => {
  describe('Fraction worksheets', () => {
    it('should parse a simple fraction worksheet correctly', () => {
      const fixturePath = path.join(__dirname, 'fixtures', 'test-fraction-simple.md');
      const result = parseMarkdownWorksheet(fixturePath);

      expect(result.title).toBe('Practice Sheet – Test Fractions');
      expect(result.problems).toHaveLength(6);
      expect(result.tips).toHaveLength(2);
    });

    it('should extract problems in correct order (left column first, then right column)', () => {
      const fixturePath = path.join(__dirname, 'fixtures', 'test-fraction-simple.md');
      const result = parseMarkdownWorksheet(fixturePath);

      // Left column problems (1-3)
      expect(result.problems[0]!.question).toBe('1/8 + 3/8');
      expect(result.problems[1]!.question).toBe('2/10 + 5/10');
      expect(result.problems[2]!.question).toBe('3/6 + 1/6');

      // Right column problems (4-6)
      expect(result.problems[3]!.question).toBe('2 1/8 + 5/8');
      expect(result.problems[4]!.question).toBe('3 2/7 + 4/7');
      expect(result.problems[5]!.question).toBe('1 4/9 + 3/9');
    });

    it('should parse answers correctly including mixed numbers', () => {
      const fixturePath = path.join(__dirname, 'fixtures', 'test-fraction-simple.md');
      const result = parseMarkdownWorksheet(fixturePath);

      expect(result.problems[0]!.answer).toBe('1/2');
      expect(result.problems[1]!.answer).toBe('7/10');
      expect(result.problems[2]!.answer).toBe('2/3');
      expect(result.problems[3]!.answer).toBe('2 3/4'); // Mixed number
      expect(result.problems[4]!.answer).toBe('3 6/7'); // Mixed number
      expect(result.problems[5]!.answer).toBe('1 7/9'); // Mixed number
    });

    it('should parse tips correctly', () => {
      const fixturePath = path.join(__dirname, 'fixtures', 'test-fraction-simple.md');
      const result = parseMarkdownWorksheet(fixturePath);

      expect(result.tips).toHaveLength(2);
      expect(result.tips[0]!).toBe('Add the numerators and keep the same denominator');
      expect(result.tips[1]!).toBe('Always reduce your answer to lowest terms');
    });
  });

  describe('Algebra worksheets', () => {
    it('should parse a simple algebra worksheet correctly', () => {
      const fixturePath = path.join(__dirname, 'fixtures', 'test-algebra-simple.md');
      const result = parseMarkdownWorksheet(fixturePath);

      expect(result.title).toBe('Practice Sheet – Test Algebra');
      expect(result.problems).toHaveLength(6);
      expect(result.tips).toHaveLength(2);
    });

    it('should extract algebraic expressions correctly', () => {
      const fixturePath = path.join(__dirname, 'fixtures', 'test-algebra-simple.md');
      const result = parseMarkdownWorksheet(fixturePath);

      expect(result.problems[0]!.question).toBe('2a + 3a');
      expect(result.problems[1]!.question).toBe('4x + 2x');
      expect(result.problems[2]!.question).toBe('2a + 3b + 4a'); // Multi-term
    });

    it('should parse algebraic answers correctly', () => {
      const fixturePath = path.join(__dirname, 'fixtures', 'test-algebra-simple.md');
      const result = parseMarkdownWorksheet(fixturePath);

      expect(result.problems[0]!.answer).toBe('5a');
      expect(result.problems[1]!.answer).toBe('6x');
      expect(result.problems[2]!.answer).toBe('6a + 3b'); // Multi-term answer
      expect(result.problems[5]!.answer).toBe('7x² + 7x'); // With powers
    });

    it('should handle multi-term expressions (regression test for bug)', () => {
      const fixturePath = path.join(__dirname, 'fixtures', 'test-algebra-simple.md');
      const result = parseMarkdownWorksheet(fixturePath);

      // This was the problematic case: expressions with more than 2 terms
      const multiTermProblem = result.problems.find(p => p.question === '2a + 3b + 4a');
      expect(multiTermProblem).toBeDefined();
      expect(multiTermProblem?.answer).toBe('6a + 3b');

      const multiTermProblem2 = result.problems.find(p => p.question === '5x + 2y - 3x + 4y');
      expect(multiTermProblem2).toBeDefined();
      expect(multiTermProblem2?.answer).toBe('2x + 6y');
    });
  });
});
