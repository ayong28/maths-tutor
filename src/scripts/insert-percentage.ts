import { PrismaClient } from '../../generated/prisma';
import * as fs from 'fs';
import * as path from 'path';

const prisma = new PrismaClient();

interface JsonProblem {
  question: string;
  answer: string;
  type: 'PERCENTAGE_CONVERSION' | 'PERCENTAGE_OF_QUANTITY';
  difficulty: 'EASY' | 'MEDIUM' | 'HARD';
  tags: string[];
}

async function insertProblems() {
  try {
    console.log('Reading percentage problems from JSON file...\n');

    const jsonPath = path.join(__dirname, '../../temp/percentage-problems.json');
    const jsonData = fs.readFileSync(jsonPath, 'utf-8');
    const jsonProblems: JsonProblem[] = JSON.parse(jsonData);

    console.log(`Loaded ${jsonProblems.length} problems from JSON file`);
    console.log(`EASY: ${jsonProblems.filter(p => p.difficulty === 'EASY').length}`);
    console.log(`MEDIUM: ${jsonProblems.filter(p => p.difficulty === 'MEDIUM').length}`);
    console.log(`HARD: ${jsonProblems.filter(p => p.difficulty === 'HARD').length}`);

    // Show breakdown by type
    console.log('\n=== By Type ===');
    console.log(`PERCENTAGE_CONVERSION: ${jsonProblems.filter(p => p.type === 'PERCENTAGE_CONVERSION').length}`);
    console.log(`PERCENTAGE_OF_QUANTITY: ${jsonProblems.filter(p => p.type === 'PERCENTAGE_OF_QUANTITY').length}`);

    // Show some examples
    console.log('\n=== Examples ===');
    console.log('\nEASY (Fraction/Decimal to %):');
    jsonProblems.filter(p => p.difficulty === 'EASY').slice(0, 3).forEach(p => {
      console.log(`  ${p.question} → ${p.answer}`);
    });
    console.log('\nMEDIUM (% to fraction / % of quantity):');
    jsonProblems.filter(p => p.difficulty === 'MEDIUM').slice(0, 3).forEach(p => {
      console.log(`  ${p.question} → ${p.answer}`);
    });
    console.log('\nHARD (Advanced %):');
    jsonProblems.filter(p => p.difficulty === 'HARD').slice(0, 3).forEach(p => {
      console.log(`  ${p.question} → ${p.answer}`);
    });

    // Transform to database format
    const problems = jsonProblems.map(p => ({
      question: p.question,
      answer: p.answer,
      type: p.type,
      difficulty: p.difficulty,
      tags: p.tags,
      sourceWorksheet: null,
      sourceProblemNumber: null,
      hasVariables: false,
      hasFractions: false,
      hasMixedNumbers: false,
      denominators: [],
      requiresLCD: false,
    }));

    console.log('\n\nInserting into database...');

    const result = await prisma.problem.createMany({
      data: problems,
      skipDuplicates: true,
    });

    console.log(`\n✅ Successfully inserted ${result.count} problems!`);

    // Verify
    const totalPercentage = await prisma.problem.count({
      where: {
        OR: [
          { type: 'PERCENTAGE_CONVERSION' },
          { type: 'PERCENTAGE_OF_QUANTITY' },
        ],
      },
    });

    const conversion = await prisma.problem.count({
      where: { type: 'PERCENTAGE_CONVERSION' },
    });

    const ofQuantity = await prisma.problem.count({
      where: { type: 'PERCENTAGE_OF_QUANTITY' },
    });

    console.log(`\nTotal PERCENTAGE problems: ${totalPercentage}`);
    console.log(`Total PERCENTAGE_CONVERSION: ${conversion}`);
    console.log(`Total PERCENTAGE_OF_QUANTITY: ${ofQuantity}`);

    // Get total database count
    const totalProblems = await prisma.problem.count();
    console.log(`\n📊 Total problems in database: ${totalProblems}`);

  } catch (error) {
    console.error('Error:', error);
  } finally {
    await prisma.$disconnect();
  }
}

insertProblems();
