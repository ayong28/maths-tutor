import PDFDocument from 'pdfkit';
import fs from 'fs';
import path from 'path';

// Branded types for better type safety
export type PositiveNumber = number & { readonly __brand: 'PositiveNumber' };
export type Coordinate = number & { readonly __brand: 'Coordinate' };
export type NonEmptyString = string & { readonly __brand: 'NonEmptyString' };

/**
 * Creates a PositiveNumber brand - ensures number is positive
 */
function asPositiveNumber(n: number): PositiveNumber {
  if (!Number.isFinite(n) || n <= 0) {
    throw new Error(`Expected positive number, got ${n}`);
  }
  return n as PositiveNumber;
}

/**
 * Creates a NonEmptyString brand - ensures string is not empty
 */
function asNonEmptyString(s: string): NonEmptyString {
  if (typeof s !== 'string' || s.trim().length === 0) {
    throw new Error(`Expected non-empty string, got "${s}"`);
  }
  return s as NonEmptyString;
}

export interface Problem {
  question: NonEmptyString;
  answer: string;
}

export interface WorksheetData {
  title: NonEmptyString;
  problems: Problem[];
  tips: string[];
}

/**
 * Regular expressions compiled once for reuse
 */
const REGEX = {
  NUMERIC_ONLY: /^\d+$/,
  ANSWER_LINE: /(\d+)\.\s*(.+)/,
  ALGEBRAIC: /[a-zA-Z]/,
  WHITESPACE_SPLIT: /\s+/,
} as const;

/**
 * Configuration constants for PDF layout and drawing
 */
const CONFIG = {
  // Fraction drawing configuration
  FRACTION: {
    LINE_PADDING: 4,
    NUMERATOR_VERTICAL_OFFSET: 0.8,
    LINE_Y_OFFSET: 2,
    DENOMINATOR_Y_OFFSET: 4,
  },
  // Mixed number spacing
  MIXED_NUMBER_SPACING: 3,
  // Expression rendering spacing
  OPERATOR_SPACING: 5,
  // Label spacing (between problem number and expression)
  LABEL_SPACING: 5,
  // PDF page layout
  PDF: {
    MARGIN: 50,
    LEFT_COLUMN_X: 70,
    RIGHT_COLUMN_X: 320,
    PROBLEMS_PER_COLUMN: 15,
    START_Y: 120,
    VERTICAL_SPACING: 35,
    TITLE_FONT_SIZE: 16,
    PROBLEM_FONT_SIZE: 12,
    TIPS_FONT_SIZE: 11,
    TIPS_INDENT: 50,
  },
} as const;

/**
 * Validates a file path to prevent path traversal attacks
 * Ensures the file is within the current working directory and has the expected extension
 */
export function validateFilePath(filePath: string, expectedExtension: string): string {
  if (!filePath || typeof filePath !== 'string') {
    throw new Error('File path is required and must be a string');
  }

  if (!expectedExtension || typeof expectedExtension !== 'string') {
    throw new Error('Expected extension is required and must be a string');
  }

  // Resolve to absolute path
  const resolved = path.resolve(filePath);
  const cwd = process.cwd();

  // Prevent path traversal outside working directory
  if (!resolved.startsWith(cwd)) {
    throw new Error('Access denied: File must be within project directory');
  }

  // Validate extension
  if (!resolved.endsWith(expectedExtension)) {
    throw new Error(`Invalid file: Expected ${expectedExtension} file`);
  }

  return resolved;
}

/**
 * Parses a markdown file and extracts worksheet data
 */
export function parseMarkdownWorksheet(filePath: string): WorksheetData {
  // Validate input
  if (!filePath || typeof filePath !== 'string') {
    throw new Error('File path is required and must be a string');
  }

  // Check file exists
  if (!fs.existsSync(filePath)) {
    throw new Error(`Markdown file not found: ${filePath}`);
  }

  // Read file with error handling
  let content: string;
  try {
    content = fs.readFileSync(filePath, 'utf-8');
  } catch (error) {
    throw new Error(`Failed to read file ${filePath}: ${error instanceof Error ? error.message : 'Unknown error'}`);
  }

  // Validate content
  if (!content.trim()) {
    throw new Error(`Markdown file is empty: ${filePath}`);
  }

  const lines = content.split('\n');

  let title = '';
  const leftColumnProblems: Problem[] = [];
  const rightColumnProblems: Problem[] = [];
  const answersMap = new Map<number, string>();
  const tips: string[] = [];
  let inAnswerSection = false;
  let inTipsSection = false;

  // Single pass through all lines
  for (let i = 0; i < lines.length; i++) {
    const line = lines[i]!.trim();

    // Extract title
    if (line.startsWith('###') && !title) {
      const rawTitle = line.replace('###', '').trim();
      title = asNonEmptyString(rawTitle);
      continue;
    }

    // Check section transitions
    if (line.startsWith('### Answer Key')) {
      inAnswerSection = true;
      inTipsSection = false;
      continue;
    }

    if (line.startsWith('**Tip')) {
      inTipsSection = true;
      inAnswerSection = false;
      continue;
    }

    // Handle different sections
    if (!inAnswerSection && !inTipsSection) {
      // Problem parsing section
      if (line.startsWith('|') && !line.includes('---') && !line.includes('Fraction') && !line.includes('Expression')) {
        const cells = line.split('|').map(cell => cell.trim()).filter(cell => cell);

        // Extract left column problem (index 1)
        if (cells.length >= 2 && cells[1] && !REGEX.NUMERIC_ONLY.test(cells[1]!)) {
          const problemNum = leftColumnProblems.length + 1;
          validateExpression(cells[1]!, problemNum);
          leftColumnProblems.push({ question: asNonEmptyString(cells[1]!), answer: '' });
        }

        // Extract right column problem (index 3)
        if (cells.length >= 4 && cells[3] && !REGEX.NUMERIC_ONLY.test(cells[3]!)) {
          const problemNum = 16 + rightColumnProblems.length;
          validateExpression(cells[3]!, problemNum);
          rightColumnProblems.push({ question: asNonEmptyString(cells[3]!), answer: '' });
        }
      }
    } else if (inAnswerSection && !inTipsSection) {
      // Answer key parsing
      if (line && !line.startsWith('###') && !line.startsWith('**')) {
        const match = REGEX.ANSWER_LINE.exec(line);
        if (match && match[1] && match[2]) {
          const problemNum = parseInt(match[1]);
          const answer = match[2].trim();

          // Validate answer for division by zero in fractions
          const fractionMatch = answer.match(/(\d+)\s*\/\s*(\d+)/);
          if (fractionMatch && fractionMatch[1] && fractionMatch[2]) {
            validateFraction(fractionMatch[1], fractionMatch[2], problemNum);
          }

          answersMap.set(problemNum, answer);
        }
      }
    } else if (inTipsSection) {
      // Tips parsing
      if (line.startsWith('-')) {
        tips.push(line.replace('-', '').trim());
      }
    }
  }

  // Combine problems and assign answers
  const problems = [...leftColumnProblems, ...rightColumnProblems];
  problems.forEach((problem, index) => {
    const answer = answersMap.get(index + 1);
    if (answer) {
      problem.answer = answer;
    }
  });

  // Validate parsed results
  if (!title) {
    throw new Error(`No title found in markdown file. Expected a line starting with "###"`);
  }

  if (problems.length === 0) {
    throw new Error(`No problems found in markdown file. Expected a table with problem rows.`);
  }

  // Validate problem-answer alignment
  validateProblemAnswerAlignment(problems);

  // Return with type assertion - title is guaranteed to be NonEmptyString by validation above
  return { title: title as NonEmptyString, problems, tips };
}

/**
 * Validates a fraction to check for division by zero
 */
export function validateFraction(numerator: string, denominator: string, problemNum: number): void {
  if (denominator.trim() === '0') {
    throw new Error(`Problem #${problemNum}: Division by zero in fraction ${numerator}/${denominator}`);
  }
}

/**
 * Validates an expression for common malformations
 */
export function validateExpression(expression: string, problemNum: number): void {
  const trimmed = expression.trim();

  // Check for empty expression
  if (!trimmed) {
    throw new Error(`Problem #${problemNum}: Empty expression`);
  }

  // Check for leading/trailing operators
  if (trimmed.match(/^[\+\-\*/]/)) {
    throw new Error(`Problem #${problemNum}: Expression starts with operator: "${expression}"`);
  }

  if (trimmed.match(/[\+\-\*/]$/)) {
    throw new Error(`Problem #${problemNum}: Expression ends with operator: "${expression}"`);
  }

  // Check for consecutive operators (but allow negative numbers like "5 - -3")
  if (trimmed.match(/[\+\*/][\+\-\*/]/)) {
    throw new Error(`Problem #${problemNum}: Consecutive operators found in: "${expression}"`);
  }

  // Check for unmatched parentheses
  const openParens = (trimmed.match(/\(/g) || []).length;
  const closeParens = (trimmed.match(/\)/g) || []).length;
  if (openParens !== closeParens) {
    throw new Error(
      `Problem #${problemNum}: Unmatched parentheses in "${expression}" ` +
      `(${openParens} open, ${closeParens} close)`
    );
  }
}

/**
 * Validates alignment between problems and answers
 * Throws error if critical misalignment, warns about individual missing answers
 */
export function validateProblemAnswerAlignment(problems: Problem[]): void {
  const totalProblems = problems.length;
  const answeredProblems = problems.filter(p => p.answer.trim().length > 0).length;

  // Critical issue: less than 50% of problems have answers
  if (answeredProblems < totalProblems * 0.5) {
    throw new Error(
      `Critical: Only ${answeredProblems} out of ${totalProblems} problems have answers. ` +
      `Expected at least ${Math.ceil(totalProblems * 0.5)} answers.`
    );
  }

  // Warning: individual missing answers
  if (answeredProblems < totalProblems) {
    const missingAnswers = problems
      .map((p, idx) => ({ problem: p, index: idx }))
      .filter(({ problem }) => !problem.answer.trim());

    const indices = missingAnswers.map(({ index }) => index + 1).join(', ');
    console.warn(
      `⚠️  Warning: ${missingAnswers.length} problem(s) missing answers: #${indices}. ` +
      `PDF will be generated but these problems won't have answer key entries.`
    );
  }
}

export function gcd(a: number, b: number): number {
  a = Math.abs(a);
  b = Math.abs(b);
  while (b) {
    const t = b;
    b = a % b;
    a = t;
  }
  return a;
}

// Helper function to draw a fraction with proper notation
export function drawFraction(doc: PDFKit.PDFDocument, x: number, y: number, numerator: string, denominator: string, fontSize: number): number {
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

// Helper function to draw mixed number or whole number
export function drawNumber(doc: PDFKit.PDFDocument, x: number, y: number, numberStr: string, fontSize: number): number {
  const trimmed = numberStr.trim();
  // Split on any whitespace and remove empty parts (handles multiple spaces, tabs, etc.)
  const parts = trimmed.split(REGEX.WHITESPACE_SPLIT).filter(Boolean);

  // Check if this is algebraic text (contains letters)
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
    // Mixed number
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
 * Draws a mathematical expression (e.g., "1/8 + 3/8" or "10/14" or "2a + 3b + 4a")
 */
export function drawExpression(doc: PDFKit.PDFDocument, x: number, y: number, expression: string, fontSize: number): number {
  let currentX = x;

  // If it's an algebraic expression (contains letters), just render as plain text
  if (REGEX.ALGEBRAIC.test(expression)) {
    doc.text(expression, currentX, y, { lineBreak: false });
    return doc.widthOfString(expression);
  }

  // Check if it's a fraction operation (contains +, -, *, /)
  if (expression.includes(' + ') || expression.includes(' - ')) {
    const operator = expression.includes(' + ') ? ' + ' : ' - ';
    const parts = expression.split(operator);

    // For simple binary operations (fraction + fraction)
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
      // Multiple operators - just render as plain text
      doc.text(expression, currentX, y, { lineBreak: false });
      return doc.widthOfString(expression);
    }
  } else {
    // Simple number/fraction
    return drawNumber(doc, currentX, y, expression, fontSize);
  }
}

/**
 * Creates a PDF document with worksheet content (pure creation, no I/O)
 */
export function createWorksheetPDF(worksheetData: WorksheetData): PDFKit.PDFDocument {
  // Validate inputs
  if (!worksheetData) {
    throw new Error('Worksheet data is required');
  }

  if (!worksheetData.title || !worksheetData.problems || worksheetData.problems.length === 0) {
    throw new Error('Invalid worksheet data: must have title and at least one problem');
  }

  const doc = new PDFDocument({ margin: CONFIG.PDF.MARGIN });

  try {

    // Title Page
    doc.fontSize(CONFIG.PDF.TITLE_FONT_SIZE).text(worksheetData.title, { align: 'center', underline: true });
    doc.moveDown(2);

    // Layout problems in two columns
    const leftColumnX = CONFIG.PDF.LEFT_COLUMN_X;
    const rightColumnX = CONFIG.PDF.RIGHT_COLUMN_X;
    const problemsPerColumn = CONFIG.PDF.PROBLEMS_PER_COLUMN;
    const fontSize = CONFIG.PDF.PROBLEM_FONT_SIZE;
    const verticalSpacing = CONFIG.PDF.VERTICAL_SPACING;

    for (let i = 0; i < worksheetData.problems.length; i++) {
      const problem = worksheetData.problems[i];
      if (!problem) continue;

      const columnIndex = Math.floor(i / problemsPerColumn);
      const rowIndex = i % problemsPerColumn;

      const x = columnIndex === 0 ? leftColumnX : rightColumnX;
      const y = CONFIG.PDF.START_Y + (rowIndex * verticalSpacing);

      doc.fontSize(fontSize);

      // Draw problem number
      doc.text(`${i + 1}.`, x, y, { lineBreak: false });
      const numLabelWidth = doc.widthOfString(`${i + 1}. `);

      // Draw the expression
      const exprX = x + numLabelWidth + CONFIG.LABEL_SPACING;
      const exprWidth = drawExpression(doc, exprX, y, problem.question, fontSize);

      // Draw equals sign and space for answer
      doc.text(' = _______', exprX + exprWidth + CONFIG.LABEL_SPACING, y, { lineBreak: false });
    }

    // Answer Key Page
    doc.addPage();
    doc.fontSize(CONFIG.PDF.TITLE_FONT_SIZE).text('Answer Key', { align: 'center', underline: true });
    doc.moveDown(2);

    // Layout answers in two columns
    for (let i = 0; i < worksheetData.problems.length; i++) {
      const problem = worksheetData.problems[i];
      if (!problem) continue;

      const columnIndex = Math.floor(i / problemsPerColumn);
      const rowIndex = i % problemsPerColumn;

      const x = columnIndex === 0 ? leftColumnX : rightColumnX;
      const y = CONFIG.PDF.START_Y + (rowIndex * verticalSpacing);

      doc.fontSize(fontSize);

      // Draw problem number
      doc.text(`${i + 1}.`, x, y, { lineBreak: false });
      const numLabelWidth = doc.widthOfString(`${i + 1}. `);

      // Draw original expression
      const exprX = x + numLabelWidth + CONFIG.LABEL_SPACING;
      const exprWidth = drawExpression(doc, exprX, y, problem.question, fontSize);

      // Draw equals sign
      doc.text(' = ', exprX + exprWidth + CONFIG.LABEL_SPACING, y, { lineBreak: false });
      const equalsWidth = doc.widthOfString(' = ');

      // Draw answer
      const answerX = exprX + exprWidth + CONFIG.LABEL_SPACING + equalsWidth;
      drawNumber(doc, answerX, y, problem.answer, fontSize);
    }

    // Add tips page if available
    if (worksheetData.tips.length > 0) {
      doc.addPage();
      doc.fontSize(CONFIG.PDF.TITLE_FONT_SIZE).text('Tips for Practice', { align: 'center', underline: true });
      doc.moveDown(2);

      doc.fontSize(CONFIG.PDF.TIPS_FONT_SIZE);
      worksheetData.tips.forEach(tip => {
        doc.text(`• ${tip}`, { indent: CONFIG.PDF.TIPS_INDENT });
        doc.moveDown(1);
      });
    }

    return doc;
  } catch (error) {
    throw new Error(`Failed to create PDF: ${error instanceof Error ? error.message : 'Unknown error'}`);
  }
}

/**
 * Saves a PDF document to a file (I/O operation)
 */
export function savePDFToFile(doc: PDFKit.PDFDocument, outputPath: string): Promise<void> {
  return new Promise((resolve, reject) => {
    // Validate output path
    if (!outputPath || typeof outputPath !== 'string') {
      reject(new Error('Output path is required and must be a string'));
      return;
    }

    if (!outputPath.endsWith('.pdf')) {
      reject(new Error('Output path must end with .pdf extension'));
      return;
    }

    try {
      const stream = fs.createWriteStream(outputPath);

      // Handle stream errors
      stream.on('error', (error) => {
        reject(new Error(`Failed to write PDF to ${outputPath}: ${error.message}`));
      });

      doc.on('error', (error) => {
        reject(new Error(`PDF document error: ${error.message}`));
      });

      doc.pipe(stream);

      // Resolve when stream finishes
      stream.on('finish', resolve);

      // End the document
      doc.end();
    } catch (error) {
      reject(new Error(`Failed to save PDF: ${error instanceof Error ? error.message : 'Unknown error'}`));
    }
  });
}

/**
 * Generates a PDF worksheet from markdown data and saves to file
 */
export async function generateWorksheetPDF(worksheetData: WorksheetData, outputPath: string): Promise<void> {
  const doc = createWorksheetPDF(worksheetData);
  await savePDFToFile(doc, outputPath);
}

// Main execution - only run if this file is executed directly (not imported)
if (require.main === module) {
  (async () => {
    try {
      const args = process.argv.slice(2);
      // Default to worksheets folder if no path specified
      const inputFile = args[0] || 'worksheets/fraction-addition-01.md';
      const outputFileArg = args[1] || inputFile.replace('.md', '.pdf');

      // Validate file paths to prevent path traversal attacks
      const markdownFile = validateFilePath(inputFile, '.md');
      const outputFile = validateFilePath(outputFileArg, '.pdf');

      const worksheetData = parseMarkdownWorksheet(markdownFile);
      await generateWorksheetPDF(worksheetData, outputFile);

      console.log(`PDF created successfully: ${outputFile}`);
    } catch (error) {
      console.error(`Error: ${error instanceof Error ? error.message : 'Unknown error'}`);
      process.exit(1);
    }
  })();
}
