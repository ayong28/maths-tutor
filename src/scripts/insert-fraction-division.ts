import { PrismaClient } from '../../generated/prisma';
import * as fs from 'fs';
import * as path from 'path';

const prisma = new PrismaClient();

interface JsonProblem {
  question: string;
  answer: string;
  type: 'FRACTION_DIVISION';
  difficulty: 'EASY' | 'MEDIUM' | 'HARD';
  tags: string[];
}

async function insertProblems() {
  try {
    console.log('Reading fraction division problems from JSON file...\n');

    const jsonPath = path.join(__dirname, '../../temp/fraction-division-problems.json');
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
    console.log('\nHARD (Mixed Numbers):');
    jsonProblems.filter(p => p.difficulty === 'HARD').slice(0, 3).forEach(p => {
      console.log(`  ${p.question} = ${p.answer}`);
    });

    // Transform to database format
    const problems = jsonProblems.map(p => {
      const hasMixedNumbers = p.tags.includes('mixed-numbers');

      return {
        question: p.question,
        answer: p.answer,
        type: 'FRACTION_DIVISION' as const,
        difficulty: p.difficulty,
        tags: p.tags,
        sourceWorksheet: null,
        sourceProblemNumber: null,
        hasVariables: false,
      };
    });

    console.log('\n\nInserting into database...');

    const result = await prisma.problem.createMany({
      data: problems,
      skipDuplicates: true,
    });

    console.log(`\n✅ Successfully inserted ${result.count} problems!`);

    // Verify
    const totalDivision = await prisma.problem.count({
      where: {
        type: 'FRACTION_DIVISION',
      },
    });

    const properFractions = await prisma.problem.count({
      where: {
        type: 'FRACTION_DIVISION',
        tags: { has: 'proper-fractions' },
      },
    });

    const mixedNumbers = await prisma.problem.count({
      where: {
        type: 'FRACTION_DIVISION',
        tags: { has: 'mixed-numbers' },
      },
    });

    const needsSimplification = await prisma.problem.count({
      where: {
        type: 'FRACTION_DIVISION',
        tags: { has: 'simplification-needed' },
      },
    });

    console.log(`\nTotal FRACTION_DIVISION: ${totalDivision}`);
    console.log(`Total proper-fractions: ${properFractions}`);
    console.log(`Total mixed-numbers: ${mixedNumbers}`);
    console.log(`Total needs simplification: ${needsSimplification}`);

  } catch (error) {
    console.error('Error:', error);
  } finally {
    await prisma.$disconnect();
  }
}

insertProblems();
