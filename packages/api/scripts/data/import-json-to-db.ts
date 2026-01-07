/**
 * Migration Script: Import JSON problems to PostgreSQL Database
 *
 * Imports all problems from JSON files in temp/ folder into the database.
 * Run with: npx tsx scripts/import-json-to-db.ts
 */

import 'dotenv/config';
import * as fs from 'fs';
import * as path from 'path';
import { PrismaClient } from '../generated/prisma';

const prisma = new PrismaClient();

async function importJsonProblems() {
  console.log('Starting import of JSON problems to database...\n');

  const tempDir = path.join(__dirname, '..', 'temp');
  const files = fs.readdirSync(tempDir)
    .filter(f => f.endsWith('.json') && f.includes('-problems'))
    .sort();

  console.log(`Found ${files.length} JSON files\n`);

  let totalProblems = 0;
  let successCount = 0;
  let errorCount = 0;

  for (const file of files) {
    const filePath = path.join(tempDir, file);
    console.log(`Processing: ${file}`);

    try {
      const content = fs.readFileSync(filePath, 'utf-8');
      const problems = JSON.parse(content);

      if (!Array.isArray(problems)) {
        throw new Error('JSON file does not contain an array of problems');
      }

      // Clean problems to match schema (remove extra fields)
      const cleanedProblems = problems.map((p: any) => ({
        question: p.question,
        answer: p.answer,
        type: p.type,
        difficulty: p.difficulty,
        tags: p.tags || [],
        hasVariables: p.hasVariables || false,
        sourceWorksheet: p.sourceWorksheet,
        sourceProblemNumber: p.sourceProblemNumber,
      }));

      // Batch insert problems
      const result = await prisma.problem.createMany({
        data: cleanedProblems,
        skipDuplicates: true,
      });

      totalProblems += result.count;
      successCount += result.count;
      console.log(`  ✓ Inserted ${result.count} problems`);

    } catch (error) {
      errorCount++;
      console.error(`  ✗ Error processing ${file}:`, error);
    }
  }

  console.log('\n' + '='.repeat(50));
  console.log('Import Summary:');
  console.log('='.repeat(50));
  console.log(`Total files: ${files.length}`);
  console.log(`Total problems inserted: ${totalProblems}`);
  console.log(`Successful: ${successCount}`);
  console.log(`Errors: ${errorCount}`);

  // Verification queries
  console.log('\nVerification:');

  const countByType = await prisma.problem.groupBy({
    by: ['type'],
    _count: { id: true },
    orderBy: { type: 'asc' },
  });

  console.log('\nProblems by type:');
  for (const row of countByType) {
    console.log(`  ${row.type}: ${row._count.id}`);
  }

  const countByDifficulty = await prisma.problem.groupBy({
    by: ['difficulty'],
    _count: { id: true },
    orderBy: { difficulty: 'asc' },
  });

  console.log('\nProblems by difficulty:');
  for (const row of countByDifficulty) {
    console.log(`  ${row.difficulty}: ${row._count.id}`);
  }

  const totalCount = await prisma.problem.count();
  console.log(`\nTotal problems in database: ${totalCount}`);
}

// Run import
importJsonProblems()
  .catch((error) => {
    console.error('Import failed:', error);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
