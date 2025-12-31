import { PrismaClient } from '../../generated/prisma';
import * as fs from 'fs';
import * as path from 'path';

const prisma = new PrismaClient();

interface JsonProblem {
  question: string;
  answer: string;
  difficulty: 'EASY' | 'MEDIUM' | 'HARD';
}

async function insertProblems() {
  try {
    console.log('Reading mixed number addition problems from JSON file...\n');

    const jsonPath = path.join(__dirname, '../../temp/mixed-number-addition-problems.json');
    const jsonData = fs.readFileSync(jsonPath, 'utf-8');
    const jsonProblems: JsonProblem[] = JSON.parse(jsonData);

    console.log(`Loaded ${jsonProblems.length} problems from JSON file`);
    console.log(`EASY: ${jsonProblems.filter(p => p.difficulty === 'EASY').length}`);
    console.log(`MEDIUM: ${jsonProblems.filter(p => p.difficulty === 'MEDIUM').length}`);
    console.log(`HARD: ${jsonProblems.filter(p => p.difficulty === 'HARD').length}`);

    // Show some examples
    console.log('\n=== Examples ===');
    console.log('\nEASY:');
    jsonProblems.filter(p => p.difficulty === 'EASY').slice(0, 3).forEach(p => {
      console.log(`  ${p.question} = ${p.answer}`);
    });
    console.log('\nMEDIUM:');
    jsonProblems.filter(p => p.difficulty === 'MEDIUM').slice(0, 3).forEach(p => {
      console.log(`  ${p.question} = ${p.answer}`);
    });

    // Transform to database format
    const problems = jsonProblems.map(p => ({
      question: p.question,
      answer: p.answer,
      type: 'FRACTION_ADDITION' as const,
      difficulty: p.difficulty,
      tags: ['unlike-denominators', 'mixed-numbers', 'set-10'],
      sourceWorksheet: null,
      sourceProblemNumber: null,
      hasVariables: false,
    }));

    console.log('\n\nInserting into database...');

    const result = await prisma.problem.createMany({
      data: problems,
      skipDuplicates: true,
    });

    console.log(`\n✅ Successfully inserted ${result.count} problems!`);

    // Verify
    const totalAddition = await prisma.problem.count({
      where: {
        type: 'FRACTION_ADDITION',
      },
    });

    const unlikeDenominators = await prisma.problem.count({
      where: {
        type: 'FRACTION_ADDITION',
        tags: { has: 'unlike-denominators' },
      },
    });

    const mixedNumbers = await prisma.problem.count({
      where: {
        type: 'FRACTION_ADDITION',
        tags: { has: 'mixed-numbers' },
      },
    });

    console.log(`\nTotal FRACTION_ADDITION: ${totalAddition}`);
    console.log(`Total with mixed-numbers: ${mixedNumbers}`);

  } catch (error) {
    console.error('Error:', error);
  } finally {
    await prisma.$disconnect();
  }
}

insertProblems();
