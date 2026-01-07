import { PrismaClient, Difficulty } from '../../generated/prisma';

const prisma = new PrismaClient();

// Helper function to calculate GCD
function gcd(a: number, b: number): number {
  return b === 0 ? a : gcd(b, a % b);
}

// Helper function to simplify a fraction
function simplifyFraction(numerator: number, denominator: number): { num: number; den: number } {
  const divisor = gcd(Math.abs(numerator), Math.abs(denominator));
  return {
    num: numerator / divisor,
    den: denominator / divisor,
  };
}

// Helper function to subtract fractions with unlike denominators
function subtractFractions(
  num1: number,
  den1: number,
  num2: number,
  den2: number
  // Find LCD (least common denominator)
  const lcd = (den1 * den2) / gcd(den1, den2);

  // Convert to common denominator
  const newNum1 = (num1 * lcd) / den1;
  const newNum2 = (num2 * lcd) / den2;

  // Subtract
  const resultNum = newNum1 - newNum2;

  // Simplify the result
  const simplified = simplifyFraction(resultNum, lcd);

  const question = `${num1}/${den1} - ${num2}/${den2}`;
  const answer =
    simplified.den === 1 ? `${simplified.num}` : `${simplified.num}/${simplified.den}`;

  return {
    question,
    answer,
  };
}

interface Problem {
  question: string;
  answer: string;
  type: 'FRACTION_SUBTRACTION';
  difficulty: Difficulty;
  tags: string[];
  sourceWorksheet: null;
  sourceProblemNumber: null;
  hasVariables: false;
}

async function generateProblems() {
  const problems: Problem[] = [];

  // Distribution:
  // EASY: 80 problems (40%)
  // MEDIUM: 80 problems (40%)
  // HARD: 40 problems (20%)

  // EASY problems - simple denominators, one is a multiple of the other
  const easyPairs = [
    [2, 4], [2, 6], [2, 8], [2, 10],
    [3, 6], [3, 9], [3, 12],
    [4, 8], [4, 12],
    [5, 10], [5, 15],
    [6, 12],
  ];

  console.log('Generating EASY problems...');
  for (let i = 0; i < 80; i++) {
    const [den1, den2] = easyPairs[i % easyPairs.length];

    // Ensure num1/den1 > num2/den2 for positive results
    // Pick numerators where the first fraction is larger
    const num1 = Math.floor(Math.random() * (den1 - 1)) + 2; // 2 to den1
    const maxNum2 = Math.floor((num1 * den2) / den1) - 1;
    const num2 = Math.max(1, Math.floor(Math.random() * maxNum2) + 1);

    const result = subtractFractions(num1, den1, num2, den2);

    problems.push({
      ...result,
      type: 'FRACTION_SUBTRACTION',
      difficulty: 'EASY',
      tags: ['unlike-denominators', 'set-8'],
      sourceWorksheet: null,
      sourceProblemNumber: null,
      hasVariables: false,
    });
  }

  // MEDIUM problems - more complex denominators, not simple multiples
  const mediumPairs = [
    [3, 4], [3, 5], [3, 7], [3, 8], [3, 10],
    [4, 5], [4, 6], [4, 7], [4, 9], [4, 10],
    [5, 6], [5, 7], [5, 8], [5, 9], [5, 12],
    [6, 7], [6, 8], [6, 9], [6, 10],
    [7, 8], [7, 9], [7, 10],
    [8, 9], [8, 10], [8, 12],
  ];

  console.log('Generating MEDIUM problems...');
  for (let i = 0; i < 80; i++) {
    const [den1, den2] = mediumPairs[i % mediumPairs.length];

    const num1 = Math.floor(Math.random() * (den1 - 1)) + 2;
    const maxNum2 = Math.floor((num1 * den2) / den1) - 1;
    const num2 = Math.max(1, Math.floor(Math.random() * maxNum2) + 1);

    const result = subtractFractions(num1, den1, num2, den2);

    problems.push({
      ...result,
      type: 'FRACTION_SUBTRACTION',
      difficulty: 'MEDIUM',
      tags: ['unlike-denominators', 'set-8'],
      sourceWorksheet: null,
      sourceProblemNumber: null,
      hasVariables: false,
    });
  }

  // HARD problems - larger denominators, prime numbers
  const hardPairs = [
    [7, 11], [7, 12], [7, 13],
    [9, 11], [9, 13],
    [10, 11], [10, 13],
    [11, 12], [11, 13], [11, 15],
    [12, 13], [12, 15],
    [13, 15],
  ];

  console.log('Generating HARD problems...');
  for (let i = 0; i < 40; i++) {
    const [den1, den2] = hardPairs[i % hardPairs.length];

    const num1 = Math.floor(Math.random() * (den1 - 1)) + 2;
    const maxNum2 = Math.floor((num1 * den2) / den1) - 1;
    const num2 = Math.max(1, Math.floor(Math.random() * maxNum2) + 1);

    const result = subtractFractions(num1, den1, num2, den2);

    problems.push({
      ...result,
      type: 'FRACTION_SUBTRACTION',
      difficulty: 'HARD',
      tags: ['unlike-denominators', 'set-8'],
      sourceWorksheet: null,
      sourceProblemNumber: null,
      hasVariables: false,
    });
  }

  console.log(`\nGenerated ${problems.length} problems`);
  console.log(`EASY: ${problems.filter(p => p.difficulty === 'EASY').length}`);
  console.log(`MEDIUM: ${problems.filter(p => p.difficulty === 'MEDIUM').length}`);
  console.log(`HARD: ${problems.filter(p => p.difficulty === 'HARD').length}`);

  // Show some examples
  console.log('\n=== Examples ===');
  console.log('\nEASY:');
  problems.filter(p => p.difficulty === 'EASY').slice(0, 3).forEach(p => {
    console.log(`  ${p.question} = ${p.answer}`);
  });
  console.log('\nMEDIUM:');
  problems.filter(p => p.difficulty === 'MEDIUM').slice(0, 3).forEach(p => {
    console.log(`  ${p.question} = ${p.answer}`);
  });
  console.log('\nHARD:');
  problems.filter(p => p.difficulty === 'HARD').slice(0, 3).forEach(p => {
    console.log(`  ${p.question} = ${p.answer}`);
  });

  return problems;
}

async function insertProblems() {
  try {
    console.log('Generating fraction subtraction problems with unlike denominators...\n');

    const problems = await generateProblems();

    console.log('\n\nInserting into database...');

    const result = await prisma.problem.createMany({
      data: problems,
      skipDuplicates: true,
    });

    console.log(`\n✅ Successfully inserted ${result.count} problems!`);

    // Verify
    const count = await prisma.problem.count({
      where: {
        type: 'FRACTION_SUBTRACTION',
        tags: { has: 'unlike-denominators' },
      },
    });


  } catch (error) {
    console.error('Error:', error);
  } finally {
    await prisma.$disconnect();
  }
}

insertProblems();
