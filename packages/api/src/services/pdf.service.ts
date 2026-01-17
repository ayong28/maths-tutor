import PDFDocument from 'pdfkit';

/**
 * PDF Generation Service
 * Generates math worksheet PDFs with proper fraction/expression rendering
 */

export interface PDFProblem {
  question: string;
  answer: string;
}

export interface PDFGenerateOptions {
  title: string;
  problems: PDFProblem[];
  includeAnswerKey?: boolean;
}

/**
 * Regular expressions for expression parsing
 */
const REGEX = {
  ALGEBRAIC: /[a-zA-Z]/,
  WHITESPACE_SPLIT: /\s+/,
} as const;

/**
 * Configuration constants for PDF layout and drawing
 */
const CONFIG = {
  FRACTION: {
    LINE_PADDING: 4,
    NUMERATOR_VERTICAL_OFFSET: 0.8,
    LINE_Y_OFFSET: 2,
    DENOMINATOR_Y_OFFSET: 4,
  },
  MIXED_NUMBER_SPACING: 3,
  OPERATOR_SPACING: 5,
  LABEL_SPACING: 5,
  PDF: {
    MARGIN: 50,
    LEFT_COLUMN_X: 70,
    RIGHT_COLUMN_X: 320,
    START_Y: 120,
    PAGE_HEIGHT: 792, // Letter size height in points
    MIN_VERTICAL_SPACING: 28,
    MAX_VERTICAL_SPACING: 45,
    TITLE_FONT_SIZE: 16,
    PROBLEM_FONT_SIZE: 12,
  },
} as const;

/**
 * Calculate dynamic layout based on problem count
 */
function calculateLayout(problemCount: number): { problemsPerColumn: number; verticalSpacing: number } {
  const { START_Y, PAGE_HEIGHT, MARGIN, MIN_VERTICAL_SPACING, MAX_VERTICAL_SPACING } = CONFIG.PDF;

  // Split problems evenly between two columns
  const problemsPerColumn = Math.ceil(problemCount / 2);

  // Calculate available height for problems
  const availableHeight = PAGE_HEIGHT - MARGIN - START_Y;

  // Calculate spacing, clamped between min and max
  let verticalSpacing = availableHeight / problemsPerColumn;
  verticalSpacing = Math.max(MIN_VERTICAL_SPACING, Math.min(MAX_VERTICAL_SPACING, verticalSpacing));

  return { problemsPerColumn, verticalSpacing };
}

/**
 * Draws a fraction with proper vertical notation (numerator / denominator)
 */
function drawFraction(
  doc: PDFKit.PDFDocument,
  x: number,
  y: number,
  numerator: string,
  denominator: string,
  fontSize: number
): number {
  const numWidth = doc.widthOfString(numerator);
  const denomWidth = doc.widthOfString(denominator);
  const maxWidth = Math.max(numWidth, denomWidth);
  const lineLength = maxWidth + CONFIG.FRACTION.LINE_PADDING;

  // Draw numerator (centered above the line)
  const numX = x + (maxWidth - numWidth) / 2;
  doc.text(numerator, numX, y - fontSize * CONFIG.FRACTION.NUMERATOR_VERTICAL_OFFSET, { lineBreak: false });

  // Draw fraction line
  doc.moveTo(x, y + CONFIG.FRACTION.LINE_Y_OFFSET)
    .lineTo(x + lineLength, y + CONFIG.FRACTION.LINE_Y_OFFSET)
    .stroke();

  // Draw denominator (centered below the line)
  const denomX = x + (maxWidth - denomWidth) / 2;
  doc.text(denominator, denomX, y + CONFIG.FRACTION.DENOMINATOR_Y_OFFSET, { lineBreak: false });

  return lineLength;
}

/**
 * Draws a number: whole, fraction, or mixed number
 */
function drawNumber(
  doc: PDFKit.PDFDocument,
  x: number,
  y: number,
  numberStr: string,
  fontSize: number
): number {
  const trimmed = numberStr.trim();
  const parts = trimmed.split(REGEX.WHITESPACE_SPLIT).filter(Boolean);

  // Algebraic text (contains letters) - render as plain text
  if (REGEX.ALGEBRAIC.test(trimmed)) {
    doc.text(trimmed, x, y, { lineBreak: false });
    return doc.widthOfString(trimmed);
  }

  const firstPart = parts[0];
  if (!firstPart) {
    return 0;
  }

  if (parts.length === 1 && !firstPart.includes('/')) {
    // Whole number
    doc.text(firstPart, x, y, { lineBreak: false });
    return doc.widthOfString(firstPart);
  } else if (parts.length === 1 && firstPart.includes('/')) {
    // Simple fraction
    const fractionParts = firstPart.split('/');
    const num = fractionParts[0] || '';
    const denom = fractionParts[1] || '';
    return drawFraction(doc, x, y, num, denom, fontSize);
  } else {
    // Mixed number (e.g., "1 1/2")
    const secondPart = parts[1];
    if (!secondPart) {
      return 0;
    }

    const fractionParts = secondPart.split('/');
    const num = fractionParts[0] || '';
    const denom = fractionParts[1] || '';

    doc.text(firstPart, x, y, { lineBreak: false });
    const wholeWidth = doc.widthOfString(firstPart);
    const fracWidth = drawFraction(doc, x + wholeWidth + CONFIG.MIXED_NUMBER_SPACING, y, num, denom, fontSize);

    return wholeWidth + CONFIG.MIXED_NUMBER_SPACING + fracWidth;
  }
}

/**
 * Draws a mathematical expression (e.g., "1/8 + 3/8" or "2a + 3b")
 */
function drawExpression(
  doc: PDFKit.PDFDocument,
  x: number,
  y: number,
  expression: string,
  fontSize: number
): number {
  let currentX = x;

  // Algebraic expression - render as plain text
  if (REGEX.ALGEBRAIC.test(expression)) {
    doc.text(expression, currentX, y, { lineBreak: false });
    return doc.widthOfString(expression);
  }

  // Check for addition/subtraction operations
  if (expression.includes(' + ') || expression.includes(' - ')) {
    const operator = expression.includes(' + ') ? ' + ' : ' - ';
    const parts = expression.split(operator);

    // Simple binary operation (fraction + fraction)
    if (parts.length === 2 && parts[0] && parts[1]) {
      // Draw first number
      const firstWidth = drawNumber(doc, currentX, y, parts[0].trim(), fontSize);
      currentX += firstWidth + CONFIG.OPERATOR_SPACING;

      // Draw operator
      doc.text(operator.trim(), currentX, y, { lineBreak: false });
      currentX += doc.widthOfString(operator.trim()) + CONFIG.OPERATOR_SPACING;

      // Draw second number
      const secondWidth = drawNumber(doc, currentX, y, parts[1].trim(), fontSize);
      currentX += secondWidth;

      return currentX - x;
    } else {
      // Multiple operators - render as plain text
      doc.text(expression, currentX, y, { lineBreak: false });
      return doc.widthOfString(expression);
    }
  } else {
    // Simple number/fraction
    return drawNumber(doc, currentX, y, expression, fontSize);
  }
}

/**
 * Creates a PDF document with worksheet content
 */
function createWorksheetDocument(options: PDFGenerateOptions): PDFKit.PDFDocument {
  const { title, problems, includeAnswerKey = true } = options;

  if (!title || !problems || problems.length === 0) {
    throw new Error('Invalid worksheet data: must have title and at least one problem');
  }

  const doc = new PDFDocument({ margin: CONFIG.PDF.MARGIN });

  const { LEFT_COLUMN_X, RIGHT_COLUMN_X, START_Y, TITLE_FONT_SIZE, PROBLEM_FONT_SIZE } = CONFIG.PDF;

  // Calculate dynamic layout based on problem count
  const { problemsPerColumn, verticalSpacing } = calculateLayout(problems.length);

  // Title Page
  doc.fontSize(TITLE_FONT_SIZE).text(title, { align: 'center', underline: true });
  doc.moveDown(2);

  // Layout problems in two columns (evenly distributed)
  for (let i = 0; i < problems.length; i++) {
    const problem = problems[i];
    if (!problem) continue;

    // Distribute evenly: first half in left column, second half in right
    const columnIndex = i < problemsPerColumn ? 0 : 1;
    const rowIndex = i < problemsPerColumn ? i : i - problemsPerColumn;

    const x = columnIndex === 0 ? LEFT_COLUMN_X : RIGHT_COLUMN_X;
    const y = START_Y + (rowIndex * verticalSpacing);

    doc.fontSize(PROBLEM_FONT_SIZE);

    // Draw problem number
    doc.text(`${i + 1}.`, x, y, { lineBreak: false });
    const numLabelWidth = doc.widthOfString(`${i + 1}. `);

    // Draw the expression
    const exprX = x + numLabelWidth + CONFIG.LABEL_SPACING;
    const exprWidth = drawExpression(doc, exprX, y, problem.question, PROBLEM_FONT_SIZE);

    // Draw equals sign and space for answer
    doc.text(' = _______', exprX + exprWidth + CONFIG.LABEL_SPACING, y, { lineBreak: false });
  }

  // Answer Key Page
  if (includeAnswerKey) {
    doc.addPage();
    doc.fontSize(TITLE_FONT_SIZE).text('Answer Key', { align: 'center', underline: true });
    doc.moveDown(2);

    for (let i = 0; i < problems.length; i++) {
      const problem = problems[i];
      if (!problem) continue;

      // Same layout as problems page
      const columnIndex = i < problemsPerColumn ? 0 : 1;
      const rowIndex = i < problemsPerColumn ? i : i - problemsPerColumn;

      const x = columnIndex === 0 ? LEFT_COLUMN_X : RIGHT_COLUMN_X;
      const y = START_Y + (rowIndex * verticalSpacing);

      doc.fontSize(PROBLEM_FONT_SIZE);

      // Draw problem number
      doc.text(`${i + 1}.`, x, y, { lineBreak: false });
      const numLabelWidth = doc.widthOfString(`${i + 1}. `);

      // Draw original expression
      const exprX = x + numLabelWidth + CONFIG.LABEL_SPACING;
      const exprWidth = drawExpression(doc, exprX, y, problem.question, PROBLEM_FONT_SIZE);

      // Draw equals sign
      doc.text(' = ', exprX + exprWidth + CONFIG.LABEL_SPACING, y, { lineBreak: false });
      const equalsWidth = doc.widthOfString(' = ');

      // Draw answer
      const answerX = exprX + exprWidth + CONFIG.LABEL_SPACING + equalsWidth;
      drawNumber(doc, answerX, y, problem.answer, PROBLEM_FONT_SIZE);
    }
  }

  return doc;
}

/**
 * Generates a PDF worksheet and returns it as a Buffer
 */
export function generateWorksheetPDF(options: PDFGenerateOptions): Promise<Buffer> {
  return new Promise((resolve, reject) => {
    try {
      const doc = createWorksheetDocument(options);
      const chunks: Buffer[] = [];

      doc.on('data', (chunk: Buffer) => chunks.push(chunk));
      doc.on('end', () => resolve(Buffer.concat(chunks)));
      doc.on('error', (error: Error) => reject(new Error(`PDF generation failed: ${error.message}`)));

      doc.end();
    } catch (error) {
      reject(new Error(`PDF generation failed: ${error instanceof Error ? error.message : 'Unknown error'}`));
    }
  });
}
