import { PrismaClient } from '../../generated/prisma/index.js';

const prisma = new PrismaClient();

async function main() {
  console.log('🗑️  Deleting all COORDINATES_PLOTTING problems...\n');

  const result = await prisma.problem.deleteMany({
    where: { type: 'COORDINATES_PLOTTING' },
  });

  console.log(`✅ Deleted ${result.count} COORDINATES_PLOTTING problems`);

  const totalCount = await prisma.problem.count();
  console.log(`📈 Total problems remaining in database: ${totalCount}`);
}

main()
  .catch((e) => {
    console.error('❌ Error:', e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
