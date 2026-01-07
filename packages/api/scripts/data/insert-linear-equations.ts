import { PrismaClient } from '../../generated/prisma';
import * as fs from 'fs';
import * as path from 'path';

const prisma = new PrismaClient();

interface JsonProblem {
  question: string;
  answer: string;
  type: 'ALGEBRA_LINEAR_EQUATIONS_SIMPLE';
  difficulty: 'EASY' | 'MEDIUM' | 'HARD';
  tags: string[];
}

async function insertProblems() {
  try {
    console.log('Reading linear equations problems from JSON file...\n');

    const jsonPath = path.join(__dirname, '../../temp/linear-equations-problems.json');
    const jsonData = fs.readFileSync(jsonPath, 'utf-8');
    const jsonProblems: JsonProblem[] = JSON.parse(jsonData);

    console.log(`Loaded ${jsonProblems.length} problems from JSON file`);
    console.log(`EASY: ${jsonProblems.filter(p => p.difficulty === 'EASY').length}`);
    console.log(`MEDIUM: ${jsonProblems.filter(p => p.difficulty === 'MEDIUM').length}`);
    console.log(`HARD: ${jsonProblems.filter(p => p.difficulty === 'HARD').length}`);

    // Show some examples
    console.log('\n=== Examples ===');
    console.log('\nEASY (One-step):');
    jsonProblems.filter(p => p.difficulty === 'EASY').slice(0, 3).forEach(p => {
      console.log(`  ${p.question} → ${p.answer}`);
    });
    console.log('\nMEDIUM (Two-step):');
    jsonProblems.filter(p => p.difficulty === 'MEDIUM').slice(0, 3).forEach(p => {
      console.log(`  ${p.question} → ${p.answer}`);
    });
    console.log('\nHARD (With brackets):');
    jsonProblems.filter(p => p.difficulty === 'HARD').slice(0, 3).forEach(p => {
      console.log(`  ${p.question} → ${p.answer}`);
    });

    // Transform to database format
    const problems = jsonProblems.map(p => ({
      question: p.question,
      answer: p.answer,
      type: 'ALGEBRA_LINEAR_EQUATIONS_SIMPLE' as const,
      difficulty: p.difficulty,
      tags: p.tags,
      sourceWorksheet: null,
      sourceProblemNumber: null,
      hasVariables: true,
    }));

    console.log('\n\nInserting into database...');

    const result = await prisma.problem.createMany({
      data: problems,
      skipDuplicates: true,
    });

    console.log(`\n✅ Successfully inserted ${result.count} problems!`);

    // Verify
    const totalLinearEq = await prisma.problem.count({
      where: {
        type: 'ALGEBRA_LINEAR_EQUATIONS_SIMPLE',
      },
    });

    const oneStep = await prisma.problem.count({
      where: {
        type: 'ALGEBRA_LINEAR_EQUATIONS_SIMPLE',
        tags: { has: 'one-step' },
      },
    });

    const twoStep = await prisma.problem.count({
      where: {
        type: 'ALGEBRA_LINEAR_EQUATIONS_SIMPLE',
        tags: { has: 'two-step' },
      },
    });

    const withBrackets = await prisma.problem.count({
      where: {
        type: 'ALGEBRA_LINEAR_EQUATIONS_SIMPLE',
        tags: { has: 'with-brackets' },
      },
    });

    console.log(`\nTotal ALGEBRA_LINEAR_EQUATIONS_SIMPLE: ${totalLinearEq}`);
    console.log(`Total one-step: ${oneStep}`);
    console.log(`Total two-step: ${twoStep}`);
    console.log(`Total with-brackets: ${withBrackets}`);

  } catch (error) {
    console.error('Error:', error);
  } finally {
    await prisma.$disconnect();
  }
}

insertProblems();
