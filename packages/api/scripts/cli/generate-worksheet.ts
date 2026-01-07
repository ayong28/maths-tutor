#!/usr/bin/env npx tsx

import { Command } from 'commander';
import { ProblemType } from '../../generated/prisma';
import { selectProblems, getAvailableCounts, getAvailableTags } from '../generators/problem-selector';
import {
  SelectionCriteria,
  parseDifficultyMix,
  validateDifficultyMix,
} from '../types/worksheet.types';
import {
  createWorksheetPDF,
  savePDFToFile,
  validateFilePath,
  WorksheetData,
  Problem,
} from '../../generate-worksheet-pdf';
import { prisma } from '../db/prisma';

// Constants
const DEFAULT_COUNT = 30;
const MIN_COUNT = 1;
const MAX_COUNT = 100;
const DEFAULT_DIFFICULTY = 'easy:10,medium:10,hard:10';

// Map problem type to display title
const TYPE_TITLES: Record<ProblemType, string> = {
  FRACTION_ADDITION: 'Fraction Addition',
  FRACTION_SUBTRACTION: 'Fraction Subtraction',
  FRACTION_REDUCTION: 'Fraction Reduction',
  FRACTION_MULTIPLICATION: 'Fraction Multiplication',
  FRACTION_DIVISION: 'Fraction Division',
  ALGEBRA_COLLECTING_TERMS: 'Algebra – Collecting Like Terms',
  ALGEBRA_MULTIPLICATION: 'Algebra – Multiplication',
  ALGEBRA_SUBSTITUTION: 'Algebra – Substitution',
  ALGEBRA_WORD_PROBLEMS: 'Algebra – Word Problems',
  ALGEBRA_DISTRIBUTIVE_LAW: 'Algebra – Distributive Law',
  ALGEBRA_LINEAR_EQUATIONS_SIMPLE: 'Algebra – Simple Linear Equations',
  ALGEBRA_LINEAR_EQUATIONS_COMPLEX: 'Algebra – Complex Linear Equations',
  ALGEBRA_EXPANDING_BRACKETS: 'Algebra – Expanding Brackets',
  ALGEBRA_FACTORISING: 'Algebra – Factorising',
  COORDINATES_PLOTTING: 'Coordinates – Plotting Points',
  LINEAR_GRAPHING: 'Linear Graphing',
};

// Valid problem types (only ones with data)
const VALID_TYPES = [
  'FRACTION_ADDITION',
  'FRACTION_SUBTRACTION',
  'FRACTION_REDUCTION',
  'ALGEBRA_COLLECTING_TERMS',
  'ALGEBRA_MULTIPLICATION',
] as const;

/**
 * Helper to exit with cleanup
 */
async function exitWithError(message: string, code = 1): Promise<never> {
  console.error(`Error: ${message}`);
  await prisma.$disconnect();
  process.exit(code);
}

/**
 * Validate problem type
 */
function validateType(typeInput: string): ProblemType {
  const type = typeInput.toUpperCase();
  if (!VALID_TYPES.includes(type as typeof VALID_TYPES[number])) {
    throw new Error(
      `Invalid type: ${typeInput}\nValid types: ${VALID_TYPES.join(', ')}`
    );
  }
  return type as ProblemType;
}

/**
 * Validate count is a positive integer in range
 */
function validateCount(countInput: string): number {
  const count = parseInt(countInput, 10);
  if (isNaN(count) || count < MIN_COUNT || count > MAX_COUNT) {
    throw new Error(
      `Invalid count: ${countInput}. Must be between ${MIN_COUNT} and ${MAX_COUNT}.`
    );
  }
  return count;
}

/**
 * Parse and filter tags (removes empty strings)
 */
function parseTags(tagsInput: string | undefined): string[] | undefined {
  if (!tagsInput) return undefined;
  const tags = tagsInput
    .split(',')
    .map((t) => t.trim())
    .filter((t) => t.length > 0);
  return tags.length > 0 ? tags : undefined;
}

/**
 * Validate output path for security
 */
function validateOutputPath(outputPath: string): string {
  try {
    return validateFilePath(outputPath, '.pdf');
  } catch (error) {
    throw new Error(
      `Invalid output path: ${error instanceof Error ? error.message : error}`
    );
  }
}

/**
 * Safely convert string to NonEmptyString with validation
 */
function toNonEmptyString(value: string, fieldName: string): string {
  const trimmed = value.trim();
  if (trimmed.length === 0) {
    throw new Error(`${fieldName} cannot be empty`);
  }
  return trimmed;
}

const program = new Command();

program
  .name('generate-worksheet')
  .description('Generate maths worksheets from the problem database')
  .version('1.0.0');

/**
 * Main generate command
 */
program
  .command('generate')
  .description('Generate a worksheet PDF')
  .requiredOption('-t, --type <type>', `Problem type: ${VALID_TYPES.join(', ')}`)
  .option('-o, --output <path>', 'Output PDF path', 'worksheet.pdf')
  .option('-c, --count <number>', 'Total problems', String(DEFAULT_COUNT))
  .option(
    '-d, --difficulty <mix>',
    'Difficulty mix (e.g., "easy:10,medium:10,hard:10")',
    DEFAULT_DIFFICULTY
  )
  .option('--tags <tags>', 'Required tags (comma-separated)')
  .option('--exclude-tags <tags>', 'Excluded tags (comma-separated)')
  .option('-s, --seed <seed>', 'Seed for reproducible generation')
  .option('--title <title>', 'Custom worksheet title')
  .action(async (options) => {
    try {
      // Validate all inputs upfront
      const type = validateType(options.type);
      const totalCount = validateCount(options.count);
      const outputPath = validateOutputPath(options.output);
      const difficultyMix = parseDifficultyMix(options.difficulty);
      const requiredTags = parseTags(options.tags);
      const excludedTags = parseTags(options.excludeTags);

      // Validate difficulty mix totals to count
      validateDifficultyMix(difficultyMix, totalCount);

      // Build criteria
      const criteria: SelectionCriteria = {
        type,
        totalCount,
        difficultyMix,
        requiredTags,
        excludedTags,
        seed: options.seed,
      };

      console.log(`Selecting ${totalCount} ${type} problems...`);
      console.log(`  Difficulty: easy=${difficultyMix.easy}, medium=${difficultyMix.medium}, hard=${difficultyMix.hard}`);
      if (options.seed) console.log(`  Seed: ${options.seed}`);

      // Select problems
      const result = await selectProblems(criteria);

      console.log(`Selected ${result.problems.length} problems`);

      // Convert to WorksheetData format with validation
      const title = toNonEmptyString(
        options.title || `Practice Sheet – ${TYPE_TITLES[type]}`,
        'Title'
      );

      const problems: Problem[] = result.problems.map((p, idx) => {
        const question = toNonEmptyString(p.question, `Problem ${idx + 1} question`);
        return {
          question: question as Problem['question'],
          answer: p.answer,
        };
      });

      const worksheetData: WorksheetData = {
        title: title as WorksheetData['title'],
        problems,
        tips: [],
      };

      // Generate PDF
      console.log(`Generating PDF: ${outputPath}`);
      const doc = createWorksheetPDF(worksheetData);
      await savePDFToFile(doc, outputPath);

      console.log(`Done! Created ${outputPath}`);

      // Cleanup
      await prisma.$disconnect();
    } catch (error) {
      await exitWithError(error instanceof Error ? error.message : String(error));
    }
  });

/**
 * List available problem types and counts
 */
program
  .command('list')
  .description('List available problems by type and difficulty')
  .option('-t, --type <type>', 'Filter by problem type')
  .action(async (options) => {
    try {
      const type = options.type ? validateType(options.type) : undefined;
      const counts = await getAvailableCounts(type);

      console.log('\nAvailable problems:');
      console.log('─'.repeat(50));

      // Group by type
      const byType = new Map<ProblemType, { easy: number; medium: number; hard: number }>();
      for (const c of counts) {
        let entry = byType.get(c.type);
        if (!entry) {
          entry = { easy: 0, medium: 0, hard: 0 };
          byType.set(c.type, entry);
        }
        if (c.difficulty === 'EASY') entry.easy = c.count;
        if (c.difficulty === 'MEDIUM') entry.medium = c.count;
        if (c.difficulty === 'HARD') entry.hard = c.count;
      }

      for (const [problemType, difficulties] of byType) {
        const total = difficulties.easy + difficulties.medium + difficulties.hard;
        console.log(`\n${problemType} (${total} total)`);
        console.log(`  Easy:   ${difficulties.easy}`);
        console.log(`  Medium: ${difficulties.medium}`);
        console.log(`  Hard:   ${difficulties.hard}`);
      }

      await prisma.$disconnect();
    } catch (error) {
      await exitWithError(error instanceof Error ? error.message : String(error));
    }
  });

/**
 * List available tags for a type
 */
program
  .command('tags')
  .description('List available tags for a problem type')
  .requiredOption('-t, --type <type>', 'Problem type')
  .action(async (options) => {
    try {
      const type = validateType(options.type);
      const tags = await getAvailableTags(type);

      console.log(`\nTags for ${type}:`);
      console.log('─'.repeat(40));
      for (const tag of tags) {
        console.log(`  ${tag}`);
      }

      await prisma.$disconnect();
    } catch (error) {
      await exitWithError(error instanceof Error ? error.message : String(error));
    }
  });

// Parse and run
program.parse();
