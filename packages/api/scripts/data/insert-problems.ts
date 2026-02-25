/**
 * Generic script to insert math problems into the database
 *
 * Usage: npx tsx scripts/data/insert-problems.ts <json-file-path>
 * Example: npx tsx scripts/data/insert-problems.ts math-data/integers-multiplication-set1.json
 */

import { PrismaClient } from '../../generated/prisma';
import { readFileSync } from 'fs';
import { resolve } from 'path';
import { randomUUID } from 'crypto';

const prisma = new PrismaClient();

interface JsonProblem {
  question: string;
  answer: string;
  type: string;
  difficulty: 'EASY' | 'MEDIUM' | 'HARD';
  tags: string[];
}

async function insertProblems(filePath: string) {
  console.log(`\n📂 Reading problems from: ${filePath}\n`);

  const absolutePath = resolve(process.cwd(), filePath);
  const jsonData = readFileSync(absolutePath, 'utf-8');
  const jsonProblems: JsonProblem[] = JSON.parse(jsonData);

  console.log(`Found ${jsonProblems.length} problems\n`);

  // Count by difficulty
  const easyCount = jsonProblems.filter(p => p.difficulty === 'EASY').length;
  const mediumCount = jsonProblems.filter(p => p.difficulty === 'MEDIUM').length;
  const hardCount = jsonProblems.filter(p => p.difficulty === 'HARD').length;

  console.log('📊 Difficulty breakdown:');
  console.log(`  EASY: ${easyCount}`);
  console.log(`  MEDIUM: ${mediumCount}`);
  console.log(`  HARD: ${hardCount}`);

  // Count by type
  const typeGroups = jsonProblems.reduce((acc, p) => {
    acc[p.type] = (acc[p.type] || 0) + 1;
    return acc;
  }, {} as Record<string, number>);

  console.log('\n🏷️  Type breakdown:');
  for (const [type, count] of Object.entries(typeGroups)) {
    console.log(`  ${type}: ${count}`);
  }

  // Show sample problems
  console.log('\n📝 Sample problems:');
  jsonProblems.slice(0, 3).forEach((p, i) => {
    console.log(`  ${i + 1}. ${p.question} = ${p.answer} [${p.difficulty}]`);
  });

  // Transform to database format with generated IDs and timestamps
  const now = new Date();
  const problems = jsonProblems.map(p => ({
    id: randomUUID(),
    question: p.question,
    answer: p.answer,
    type: p.type as any,
    difficulty: p.difficulty as any,
    tags: p.tags,
    updatedAt: now,
  }));

  console.log('\n💾 Inserting into database...');

  const result = await prisma.problem.createMany({
    data: problems,
    skipDuplicates: true,
  });

  console.log(`\n✅ Successfully inserted ${result.count} problems!`);

  // Verify counts for the types we just inserted
  for (const type of Object.keys(typeGroups)) {
    const count = await prisma.problem.count({
      where: { type: type as any },
    });
    console.log(`  ${type} in DB: ${count}`);
  }

  // Total count
  const totalProblems = await prisma.problem.count();
  console.log(`\n📈 Total problems in database: ${totalProblems}`);
}

// Main
const args = process.argv.slice(2);
if (args.length === 0) {
  console.error('❌ Usage: npx tsx scripts/data/insert-problems.ts <json-file-path>');
  console.error('   Example: npx tsx scripts/data/insert-problems.ts math-data/integers-multiplication-set1.json');
  process.exit(1);
}

insertProblems(args[0]!)
  .catch((error) => {
    console.error('❌ Error:', error);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
