import { PrismaClient } from '../../generated/prisma/index.js';
import { readFileSync } from 'fs';
import { fileURLToPath } from 'url';
import { dirname, join } from 'path';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

interface JsonProblem {
  question: string;
  answer: string;
  type: 'LINEAR_GRAPHING';
  difficulty: 'EASY' | 'MEDIUM' | 'HARD';
  tags: string[];
}

const prisma = new PrismaClient();

async function main() {
  console.log('📈 Starting linear graphing problems insertion...\n');

  // Read JSON file
  const jsonPath = join(__dirname, '../../temp/linear-graphing-problems.json');
  const jsonData = readFileSync(jsonPath, 'utf-8');
  const jsonProblems: JsonProblem[] = JSON.parse(jsonData);

  console.log(`Found ${jsonProblems.length} problems in JSON file`);

  // Check if any variables, fractions, or decimals in problems
  const detectVariables = (question: string, answer: string): boolean => {
    // Look for algebraic variables (x, y, m, c, etc.)
    const variablePattern = /[a-z]/i;
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
  const gradientProblems = problems.filter(p => p.tags.some(t => t.includes('gradient'))).length;
  const interceptProblems = problems.filter(p => p.tags.some(t => t.includes('intercept'))).length;
  const realWorldProblems = problems.filter(p => p.tags.includes('real-world')).length;
  const equationProblems = problems.filter(p => p.tags.some(t => t.includes('equation'))).length;

  console.log('\n🎯 Problem types:');
  console.log(`  Gradient: ${gradientProblems}`);
  console.log(`  Intercepts: ${interceptProblems}`);
  console.log(`  Real-world applications: ${realWorldProblems}`);
  console.log(`  Writing/finding equations: ${equationProblems}`);

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

  // Verify LINEAR_GRAPHING count
  const linearCount = await prisma.problem.count({
    where: { type: 'LINEAR_GRAPHING' },
  });
  console.log(`📊 LINEAR_GRAPHING problems: ${linearCount}`);
}

main()
  .catch((e) => {
    console.error('❌ Error:', e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
