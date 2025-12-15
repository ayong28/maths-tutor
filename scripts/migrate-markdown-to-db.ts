/**
 * Migration Script: Markdown Worksheets → PostgreSQL Database
 *
 * Migrates all problems from markdown worksheet files into the database.
 * Run with: npx tsx scripts/migrate-markdown-to-db.ts
 */

import 'dotenv/config';
import * as fs from 'fs';
import * as path from 'path';
import { PrismaClient, ProblemType, Difficulty } from '../generated/prisma';
import { parseMarkdownWorksheet } from '../generate-worksheet-pdf';

const prisma = new PrismaClient();

// ============================================================================
// Helper Functions
// ============================================================================

/**
 * Detect problem type from filename
 */
function detectProblemType(filename: string): ProblemType {
  const name = path.basename(filename).toLowerCase();

  if (name.includes('fraction-addition')) return 'FRACTION_ADDITION';
  if (name.includes('fraction-subtraction')) return 'FRACTION_SUBTRACTION';
  if (name.includes('fraction-reduction')) return 'FRACTION_REDUCTION';
  if (name.includes('fraction-multiplication')) return 'FRACTION_MULTIPLICATION';
  if (name.includes('fraction-division')) return 'FRACTION_DIVISION';
  if (name.includes('algebra-collecting-terms')) return 'ALGEBRA_COLLECTING_TERMS';
  if (name.includes('algebra-multiplication')) return 'ALGEBRA_MULTIPLICATION';
  if (name.includes('algebra-substitution')) return 'ALGEBRA_SUBSTITUTION';
  if (name.includes('algebra-word')) return 'ALGEBRA_WORD_PROBLEMS';
  if (name.includes('algebra-distributive')) return 'ALGEBRA_DISTRIBUTIVE_LAW';
  if (name.includes('algebra-linear-simple')) return 'ALGEBRA_LINEAR_EQUATIONS_SIMPLE';
  if (name.includes('algebra-linear-complex')) return 'ALGEBRA_LINEAR_EQUATIONS_COMPLEX';
  if (name.includes('algebra-expanding')) return 'ALGEBRA_EXPANDING_BRACKETS';
  if (name.includes('algebra-factorising')) return 'ALGEBRA_FACTORISING';
  if (name.includes('coordinates')) return 'COORDINATES_PLOTTING';
  if (name.includes('linear-graph')) return 'LINEAR_GRAPHING';

  throw new Error(`Unknown problem type for file: ${filename}`);
}

/**
 * Infer difficulty from problem position (1-indexed)
 */
function inferDifficulty(position: number): Difficulty {
  if (position <= 10) return 'EASY';
  if (position <= 20) return 'MEDIUM';
  return 'HARD';
}

/**
 * Extract denominators from a fraction expression
 * Returns array of integers found as denominators
 */
function extractDenominators(question: string): number[] {
  const denominators: number[] = [];

  // Match patterns like "3/8", "1/12", etc.
  const fractionPattern = /(\d+)\s*\/\s*(\d+)/g;
  let match;

  while ((match = fractionPattern.exec(question)) !== null) {
    const denominator = parseInt(match[2]!, 10);
    if (!denominators.includes(denominator)) {
      denominators.push(denominator);
    }
  }

  return denominators.sort((a, b) => a - b);
}

/**
 * Check if expression contains variables (algebraic)
 */
function hasVariables(expression: string): boolean {
  return /[a-zA-Z]/.test(expression);
}

/**
 * Check if expression contains fractions
 */
function hasFractions(expression: string): boolean {
  return /\d+\s*\/\s*\d+/.test(expression);
}

/**
 * Check if expression contains mixed numbers (e.g., "1 3/4")
 */
function hasMixedNumbers(expression: string): boolean {
  return /\d+\s+\d+\s*\/\s*\d+/.test(expression);
}

/**
 * Check if problem requires finding LCD (unlike denominators)
 */
function requiresLCD(question: string): boolean {
  const denominators = extractDenominators(question);
  // If there are 2+ different denominators, LCD is needed
  return denominators.length >= 2 && new Set(denominators).size > 1;
}

/**
 * Generate tags based on problem characteristics
 */
function generateTags(
  question: string,
  answer: string,
  problemType: ProblemType,
  filename: string
): string[] {
  const tags: string[] = [];

  // Fraction-specific tags
  if (problemType.startsWith('FRACTION_')) {
    const denoms = extractDenominators(question);

    // Check if all denominators are single-digit
    if (denoms.length > 0 && denoms.every(d => d < 10)) {
      tags.push('single-digit-denominators');
    }

    // Check for like vs unlike denominators
    if (denoms.length >= 2) {
      const uniqueDenoms = new Set(denoms);
      if (uniqueDenoms.size === 1) {
        tags.push('like-denominators');
      } else {
        tags.push('unlike-denominators');
      }
    }

    // Check for mixed numbers
    if (hasMixedNumbers(question)) {
      tags.push('mixed-numbers-in-question');
    }
    if (hasMixedNumbers(answer)) {
      tags.push('mixed-numbers-in-answer');
    }

    // Check if answer needs reduction
    if (problemType === 'FRACTION_REDUCTION') {
      tags.push('requires-reduction');
    }

    // Addition with carrying / subtraction with borrowing
    if (problemType === 'FRACTION_ADDITION' && hasMixedNumbers(answer) && !hasMixedNumbers(question)) {
      tags.push('results-in-mixed-number');
    }
    if (problemType === 'FRACTION_SUBTRACTION' && hasMixedNumbers(question)) {
      tags.push('may-require-borrowing');
    }
  }

  // Algebra-specific tags
  if (problemType.startsWith('ALGEBRA_')) {
    // Check for powers/exponents
    if (/[²³⁴]|\^2|\^3|\^4|\*\*2|\*\*3/.test(question) || /x²|a²|b²/.test(question)) {
      tags.push('has-powers');
    }

    // Check for multiple variables
    const variables = question.match(/[a-zA-Z]/g);
    if (variables) {
      const uniqueVars = new Set(variables.filter(v => v !== 'x' || variables.filter(c => c === 'x').length > 0));
      if (uniqueVars.size > 1) {
        tags.push('multiple-variables');
      }
    }

    // Check for products (ab, xy, etc.)
    if (/[a-zA-Z]{2}/.test(question.replace(/\s/g, ''))) {
      tags.push('product-terms');
    }
  }

  // Set number from filename (e.g., "fraction-addition-04" -> "set-4")
  const setMatch = filename.match(/-(\d+)\.md$/);
  if (setMatch) {
    tags.push(`set-${parseInt(setMatch[1]!, 10)}`);
  }

  return tags;
}

// ============================================================================
// Main Migration Function
// ============================================================================

async function migrateWorksheets() {
  console.log('Starting migration of markdown worksheets to database...\n');

  const worksheetsDir = path.join(__dirname, '..', 'worksheets');
  const files = fs.readdirSync(worksheetsDir)
    .filter(f => f.endsWith('.md'))
    .sort();

  console.log(`Found ${files.length} worksheet files\n`);

  let totalProblems = 0;
  let successCount = 0;
  let errorCount = 0;

  for (const file of files) {
    const filePath = path.join(worksheetsDir, file);
    console.log(`Processing: ${file}`);

    try {
      // Parse the worksheet
      const worksheet = parseMarkdownWorksheet(filePath);
      const problemType = detectProblemType(file);

      // Prepare problems for batch insert
      const problemsToCreate = worksheet.problems.map((problem, index) => {
        const position = index + 1; // 1-indexed
        const question = problem.question;
        const answer = problem.answer;

        return {
          question,
          answer,
          type: problemType,
          difficulty: inferDifficulty(position),
          tags: generateTags(question, answer, problemType, file),
          sourceWorksheet: file,
          sourceProblemNumber: position,
          hasVariables: hasVariables(question),
          hasFractions: hasFractions(question),
          hasMixedNumbers: hasMixedNumbers(question),
          denominators: extractDenominators(question),
          requiresLCD: requiresLCD(question),
        };
      });

      // Batch insert problems
      const result = await prisma.problem.createMany({
        data: problemsToCreate,
      });

      totalProblems += result.count;
      successCount += result.count;
      console.log(`  ✓ Inserted ${result.count} problems (${problemType})`);

    } catch (error) {
      errorCount++;
      console.error(`  ✗ Error processing ${file}:`, error);
    }
  }

  console.log('\n' + '='.repeat(50));
  console.log('Migration Summary:');
  console.log('='.repeat(50));
  console.log(`Total worksheets: ${files.length}`);
  console.log(`Total problems inserted: ${totalProblems}`);
  console.log(`Successful: ${successCount}`);
  console.log(`Errors: ${errorCount}`);

  // Verification queries
  console.log('\nVerification:');

  const countByType = await prisma.problem.groupBy({
    by: ['type'],
    _count: { id: true },
    orderBy: { type: 'asc' },
  });

  console.log('\nProblems by type:');
  for (const row of countByType) {
    console.log(`  ${row.type}: ${row._count.id}`);
  }

  const countByDifficulty = await prisma.problem.groupBy({
    by: ['difficulty'],
    _count: { id: true },
    orderBy: { difficulty: 'asc' },
  });

  console.log('\nProblems by difficulty:');
  for (const row of countByDifficulty) {
    console.log(`  ${row.difficulty}: ${row._count.id}`);
  }

  // Sample problems
  console.log('\nSample problems:');
  const samples = await prisma.problem.findMany({
    take: 3,
    orderBy: { createdAt: 'desc' },
    select: {
      question: true,
      answer: true,
      type: true,
      difficulty: true,
      tags: true,
      denominators: true,
    },
  });

  for (const sample of samples) {
    console.log(`  Q: ${sample.question} = ${sample.answer}`);
    console.log(`     Type: ${sample.type}, Difficulty: ${sample.difficulty}`);
    console.log(`     Tags: ${sample.tags.join(', ')}`);
    console.log(`     Denominators: ${sample.denominators.join(', ') || 'N/A'}`);
    console.log();
  }
}

// ============================================================================
// Run Migration
// ============================================================================

migrateWorksheets()
  .catch((error) => {
    console.error('Migration failed:', error);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
