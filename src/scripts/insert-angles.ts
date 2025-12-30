import { PrismaClient } from '../../generated/prisma/index.js';
import { readFileSync } from 'fs';
import { fileURLToPath } from 'url';
import { dirname, join } from 'path';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

interface JsonProblem {
  question: string;
  answer: string;
  type: 'ANGLES';
  difficulty: 'EASY' | 'MEDIUM' | 'HARD';
  tags: string[];
}

const prisma = new PrismaClient();

async function main() {
  console.log('📐 Starting angles problems insertion...\n');

  // Read JSON file
  const jsonPath = join(__dirname, '../../temp/angles-problems.json');
  const jsonData = readFileSync(jsonPath, 'utf-8');
  const jsonProblems: JsonProblem[] = JSON.parse(jsonData);

  console.log(`Found ${jsonProblems.length} problems in JSON file`);

  // Check if any variables, fractions, or decimals in problems
  const detectVariables = (question: string, answer: string): boolean => {
    // Look for algebraic variables (x, a, b, etc.)
    const variablePattern = /\bx\b|[a-z]/i;
    return variablePattern.test(question) || variablePattern.test(answer);
  };

  const detectFractions = (question: string, answer: string): boolean => {
    const fractionPattern = /\d+\/\d+/;
    return fractionPattern.test(question) || fractionPattern.test(answer);
  };

  const detectDecimals = (question: string, answer: string): boolean => {
    const decimalPattern = /\d+\.\d+/;
    return decimalPattern.test(question) || decimalPattern.test(answer);
  };

  // Transform to Prisma format
  const problems = jsonProblems.map(p => ({
    question: p.question,
    answer: p.answer,
    type: p.type,
    difficulty: p.difficulty,
    tags: p.tags,
    sourceWorksheet: null,
    sourceProblemNumber: null,
    hasVariables: detectVariables(p.question, p.answer),
    hasFractions: detectFractions(p.question, p.answer),
    hasMixedNumbers: false,
    denominators: [],
    requiresLCD: false,
  }));

  // Count by difficulty
  const easyCount = problems.filter(p => p.difficulty === 'EASY').length;
  const mediumCount = problems.filter(p => p.difficulty === 'MEDIUM').length;
  const hardCount = problems.filter(p => p.difficulty === 'HARD').length;

  console.log('\n📊 Difficulty breakdown:');
  console.log(`  EASY: ${easyCount}`);
  console.log(`  MEDIUM: ${mediumCount}`);
  console.log(`  HARD: ${hardCount}`);

  // Count special properties
  const withVariables = problems.filter(p => p.hasVariables).length;
  const withFractions = problems.filter(p => p.hasFractions).length;
  const withDecimals = problems.filter(p => detectDecimals(p.question, p.answer)).length;

  console.log(`\n🔤 Problems with variables: ${withVariables}`);
  console.log(`📐 Problems with fractions: ${withFractions}`);
  console.log(`🔢 Problems with decimals: ${withDecimals}`);

  // Count by tag categories
  const complementary = problems.filter(p => p.tags.includes('complementary')).length;
  const supplementary = problems.filter(p => p.tags.includes('supplementary')).length;
  const triangleSum = problems.filter(p => p.tags.includes('triangle')).length;
  const parallelLines = problems.filter(p => p.tags.includes('parallel-lines')).length;
  const quadrilateral = problems.filter(p => p.tags.includes('quadrilateral') || p.tags.includes('parallelogram') || p.tags.includes('rhombus') || p.tags.includes('trapezium') || p.tags.includes('kite')).length;
  const algebraProblems = problems.filter(p => p.tags.includes('algebra')).length;

  console.log('\n🎯 Problem types:');
  console.log(`  Complementary angles: ${complementary}`);
  console.log(`  Supplementary angles: ${supplementary}`);
  console.log(`  Triangle problems: ${triangleSum}`);
  console.log(`  Parallel lines: ${parallelLines}`);
  console.log(`  Quadrilaterals: ${quadrilateral}`);
  console.log(`  Algebra problems: ${algebraProblems}`);

  // Insert into database
  console.log('\n💾 Inserting problems into database...');
  const result = await prisma.problem.createMany({
    data: problems,
    skipDuplicates: true,
  });

  console.log(`\n✅ Inserted ${result.count} problems`);

  // Verify total count
  const totalCount = await prisma.problem.count();
  console.log(`\n📈 Total problems in database: ${totalCount}`);

  // Verify ANGLES count
  const anglesCount = await prisma.problem.count({
    where: { type: 'ANGLES' },
  });
  console.log(`📐 ANGLES problems: ${anglesCount}`);
}

main()
  .catch((e) => {
    console.error('❌ Error:', e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
