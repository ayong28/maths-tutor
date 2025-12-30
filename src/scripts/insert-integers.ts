import { PrismaClient } from '../../generated/prisma';
import * as fs from 'fs';
import * as path from 'path';

const prisma = new PrismaClient();

interface JsonProblem {
  question: string;
  answer: string;
  type: 'INTEGERS_ADDITION' | 'INTEGERS_SUBTRACTION' | 'INTEGERS_MULTIPLICATION' | 'INTEGERS_DIVISION';
  difficulty: 'EASY' | 'MEDIUM' | 'HARD';
  tags: string[];
}

async function insertProblems() {
  try {
    console.log('Reading integer problems from JSON file...\n');

    const jsonPath = path.join(__dirname, '../../temp/integers-problems.json');
    const jsonData = fs.readFileSync(jsonPath, 'utf-8');
    const jsonProblems: JsonProblem[] = JSON.parse(jsonData);

    console.log(`Loaded ${jsonProblems.length} problems from JSON file`);
    console.log(`EASY: ${jsonProblems.filter(p => p.difficulty === 'EASY').length}`);
    console.log(`MEDIUM: ${jsonProblems.filter(p => p.difficulty === 'MEDIUM').length}`);
    console.log(`HARD: ${jsonProblems.filter(p => p.difficulty === 'HARD').length}`);

    // Show breakdown by type
    console.log('\n=== By Type ===');
    console.log(`INTEGERS_ADDITION: ${jsonProblems.filter(p => p.type === 'INTEGERS_ADDITION').length}`);
    console.log(`INTEGERS_SUBTRACTION: ${jsonProblems.filter(p => p.type === 'INTEGERS_SUBTRACTION').length}`);
    console.log(`INTEGERS_MULTIPLICATION: ${jsonProblems.filter(p => p.type === 'INTEGERS_MULTIPLICATION').length}`);
    console.log(`INTEGERS_DIVISION: ${jsonProblems.filter(p => p.type === 'INTEGERS_DIVISION').length}`);

    // Show some examples
    console.log('\n=== Examples ===');
    console.log('\nEASY (Addition):');
    jsonProblems.filter(p => p.difficulty === 'EASY' && p.type === 'INTEGERS_ADDITION').slice(0, 3).forEach(p => {
      console.log(`  ${p.question} → ${p.answer}`);
    });
    console.log('\nMEDIUM (Multiplication):');
    jsonProblems.filter(p => p.difficulty === 'MEDIUM' && p.type === 'INTEGERS_MULTIPLICATION').slice(0, 3).forEach(p => {
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
    const totalIntegers = await prisma.problem.count({
      where: {
        OR: [
          { type: 'INTEGERS_ADDITION' },
          { type: 'INTEGERS_SUBTRACTION' },
          { type: 'INTEGERS_MULTIPLICATION' },
          { type: 'INTEGERS_DIVISION' },
        ],
      },
    });

    const addition = await prisma.problem.count({
      where: { type: 'INTEGERS_ADDITION' },
    });

    const subtraction = await prisma.problem.count({
      where: { type: 'INTEGERS_SUBTRACTION' },
    });

    const multiplication = await prisma.problem.count({
      where: { type: 'INTEGERS_MULTIPLICATION' },
    });

    const division = await prisma.problem.count({
      where: { type: 'INTEGERS_DIVISION' },
    });

    console.log(`\nTotal INTEGER problems: ${totalIntegers}`);
    console.log(`Total INTEGERS_ADDITION: ${addition}`);
    console.log(`Total INTEGERS_SUBTRACTION: ${subtraction}`);
    console.log(`Total INTEGERS_MULTIPLICATION: ${multiplication}`);
    console.log(`Total INTEGERS_DIVISION: ${division}`);

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
