import { PrismaClient } from '../../generated/prisma/index.js';

const prisma = new PrismaClient();

async function main() {
  console.log('🗑️  Deleting all LINEAR_GRAPHING problems...\n');

  const result = await prisma.problem.deleteMany({
    where: { type: 'LINEAR_GRAPHING' },
  });

  console.log(`✅ Deleted ${result.count} LINEAR_GRAPHING problems`);

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
