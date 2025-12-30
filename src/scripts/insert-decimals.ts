import { PrismaClient } from '../../generated/prisma';
import * as fs from 'fs';
import * as path from 'path';

const prisma = new PrismaClient();

interface JsonProblem {
  question: string;
  answer: string;
  type: 'DECIMALS_ADDITION' | 'DECIMALS_SUBTRACTION' | 'DECIMALS_MULTIPLICATION' | 'DECIMALS_DIVISION';
  difficulty: 'EASY' | 'MEDIUM' | 'HARD';
  tags: string[];
}

async function insertProblems() {
  try {
    console.log('Reading decimal problems from JSON file...\n');

    const jsonPath = path.join(__dirname, '../../temp/decimals-problems.json');
    const jsonData = fs.readFileSync(jsonPath, 'utf-8');
    const jsonProblems: JsonProblem[] = JSON.parse(jsonData);

    console.log(`Loaded ${jsonProblems.length} problems from JSON file`);
    console.log(`EASY: ${jsonProblems.filter(p => p.difficulty === 'EASY').length}`);
    console.log(`MEDIUM: ${jsonProblems.filter(p => p.difficulty === 'MEDIUM').length}`);
    console.log(`HARD: ${jsonProblems.filter(p => p.difficulty === 'HARD').length}`);

    // Show breakdown by type
    console.log('\n=== By Type ===');
    console.log(`DECIMALS_ADDITION: ${jsonProblems.filter(p => p.type === 'DECIMALS_ADDITION').length}`);
    console.log(`DECIMALS_SUBTRACTION: ${jsonProblems.filter(p => p.type === 'DECIMALS_SUBTRACTION').length}`);
    console.log(`DECIMALS_MULTIPLICATION: ${jsonProblems.filter(p => p.type === 'DECIMALS_MULTIPLICATION').length}`);
    console.log(`DECIMALS_DIVISION: ${jsonProblems.filter(p => p.type === 'DECIMALS_DIVISION').length}`);

    // Show some examples
    console.log('\n=== Examples ===');
    console.log('\nEASY (Addition):');
    jsonProblems.filter(p => p.difficulty === 'EASY' && p.type === 'DECIMALS_ADDITION').slice(0, 3).forEach(p => {
      console.log(`  ${p.question} → ${p.answer}`);
    });
    console.log('\nMEDIUM (Multiplication):');
    jsonProblems.filter(p => p.difficulty === 'MEDIUM' && p.type === 'DECIMALS_MULTIPLICATION').slice(0, 3).forEach(p => {
      console.log(`  ${p.question} → ${p.answer}`);
    });
    console.log('\nHARD (Mixed operations):');
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
    const totalDecimals = await prisma.problem.count({
      where: {
        OR: [
          { type: 'DECIMALS_ADDITION' },
          { type: 'DECIMALS_SUBTRACTION' },
          { type: 'DECIMALS_MULTIPLICATION' },
          { type: 'DECIMALS_DIVISION' },
        ],
      },
    });

    const addition = await prisma.problem.count({
      where: { type: 'DECIMALS_ADDITION' },
    });

    const subtraction = await prisma.problem.count({
      where: { type: 'DECIMALS_SUBTRACTION' },
    });

    const multiplication = await prisma.problem.count({
      where: { type: 'DECIMALS_MULTIPLICATION' },
    });

    const division = await prisma.problem.count({
      where: { type: 'DECIMALS_DIVISION' },
    });

    console.log(`\nTotal DECIMAL problems: ${totalDecimals}`);
    console.log(`Total DECIMALS_ADDITION: ${addition}`);
    console.log(`Total DECIMALS_SUBTRACTION: ${subtraction}`);
    console.log(`Total DECIMALS_MULTIPLICATION: ${multiplication}`);
    console.log(`Total DECIMALS_DIVISION: ${division}`);

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
