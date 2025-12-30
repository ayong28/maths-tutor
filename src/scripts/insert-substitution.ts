import { PrismaClient } from '../../generated/prisma';
import * as fs from 'fs';
import * as path from 'path';

const prisma = new PrismaClient();

interface JsonProblem {
  question: string;
  answer: string;
  type: 'ALGEBRA_SUBSTITUTION';
  difficulty: 'EASY' | 'MEDIUM' | 'HARD';
  tags: string[];
}

async function insertProblems() {
  try {
    console.log('Reading substitution problems from JSON file...\n');

    const jsonPath = path.join(__dirname, '../../temp/substitution-problems.json');
    const jsonData = fs.readFileSync(jsonPath, 'utf-8');
    const jsonProblems: JsonProblem[] = JSON.parse(jsonData);

    console.log(`Loaded ${jsonProblems.length} problems from JSON file`);
    console.log(`EASY: ${jsonProblems.filter(p => p.difficulty === 'EASY').length}`);
    console.log(`MEDIUM: ${jsonProblems.filter(p => p.difficulty === 'MEDIUM').length}`);
    console.log(`HARD: ${jsonProblems.filter(p => p.difficulty === 'HARD').length}`);

    // Show some examples
    console.log('\n=== Examples ===');
    console.log('\nEASY (Single variable):');
    jsonProblems.filter(p => p.difficulty === 'EASY').slice(0, 3).forEach(p => {
      console.log(`  ${p.question} → ${p.answer}`);
    });
    console.log('\nMEDIUM (Negatives / Two variables):');
    jsonProblems.filter(p => p.difficulty === 'MEDIUM').slice(0, 3).forEach(p => {
      console.log(`  ${p.question} → ${p.answer}`);
    });
    console.log('\nHARD (Formulas):');
    jsonProblems.filter(p => p.difficulty === 'HARD').slice(0, 3).forEach(p => {
      console.log(`  ${p.question} → ${p.answer}`);
    });

    // Transform to database format
    const problems = jsonProblems.map(p => ({
      question: p.question,
      answer: p.answer,
      type: 'ALGEBRA_SUBSTITUTION' as const,
      difficulty: p.difficulty,
      tags: p.tags,
      sourceWorksheet: null,
      sourceProblemNumber: null,
      hasVariables: true,
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
    const totalSubstitution = await prisma.problem.count({
      where: {
        type: 'ALGEBRA_SUBSTITUTION',
      },
    });

    const singleVariable = await prisma.problem.count({
      where: {
        type: 'ALGEBRA_SUBSTITUTION',
        tags: { has: 'single-variable' },
      },
    });

    const twoVariables = await prisma.problem.count({
      where: {
        type: 'ALGEBRA_SUBSTITUTION',
        tags: { has: 'two-variables' },
      },
    });

    const formulas = await prisma.problem.count({
      where: {
        type: 'ALGEBRA_SUBSTITUTION',
        tags: { has: 'formula' },
      },
    });

    console.log(`\nTotal ALGEBRA_SUBSTITUTION: ${totalSubstitution}`);
    console.log(`Total single-variable: ${singleVariable}`);
    console.log(`Total two-variables: ${twoVariables}`);
    console.log(`Total formulas: ${formulas}`);

  } catch (error) {
    console.error('Error:', error);
  } finally {
    await prisma.$disconnect();
  }
}

insertProblems();
