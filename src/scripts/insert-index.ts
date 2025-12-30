import { PrismaClient } from '../../generated/prisma/index.js';
import { readFileSync } from 'fs';
import { fileURLToPath } from 'url';
import { dirname, join } from 'path';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

interface JsonProblem {
  question: string;
  answer: string;
  type: 'INDEX_POWERS' | 'INDEX_SQUARE_ROOTS' | 'INDEX_LAWS';
  difficulty: 'EASY' | 'MEDIUM' | 'HARD';
  tags: string[];
}

const prisma = new PrismaClient();

async function main() {
  console.log('📚 Starting index notation problems insertion...\n');

  // Read JSON file
  const jsonPath = join(__dirname, '../../temp/index-problems.json');
  const jsonData = readFileSync(jsonPath, 'utf-8');
  const jsonProblems: JsonProblem[] = JSON.parse(jsonData);

  console.log(`Found ${jsonProblems.length} problems in JSON file`);

  // Check if any variables in problems
  const detectVariables = (question: string, answer: string): boolean => {
    const variablePattern = /[a-z]/i;
    return variablePattern.test(question) || variablePattern.test(answer);
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
    hasFractions: false,
    hasMixedNumbers: false,
    denominators: [],
    requiresLCD: false,
  }));

  // Count by type
  const indexPowersCount = problems.filter(p => p.type === 'INDEX_POWERS').length;
  const indexSquareRootsCount = problems.filter(p => p.type === 'INDEX_SQUARE_ROOTS').length;
  const indexLawsCount = problems.filter(p => p.type === 'INDEX_LAWS').length;

  console.log('\n📊 Problem breakdown:');
  console.log(`  INDEX_POWERS: ${indexPowersCount}`);
  console.log(`  INDEX_SQUARE_ROOTS: ${indexSquareRootsCount}`);
  console.log(`  INDEX_LAWS: ${indexLawsCount}`);

  // Count by difficulty
  const easyCount = problems.filter(p => p.difficulty === 'EASY').length;
  const mediumCount = problems.filter(p => p.difficulty === 'MEDIUM').length;
  const hardCount = problems.filter(p => p.difficulty === 'HARD').length;

  console.log('\n📊 Difficulty breakdown:');
  console.log(`  EASY: ${easyCount}`);
  console.log(`  MEDIUM: ${mediumCount}`);
  console.log(`  HARD: ${hardCount}`);

  // Count problems with variables
  const withVariables = problems.filter(p => p.hasVariables).length;
  console.log(`\n🔤 Problems with variables: ${withVariables}`);

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
}

main()
  .catch((e) => {
    console.error('❌ Error:', e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
