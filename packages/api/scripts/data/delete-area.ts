import { PrismaClient } from '../../generated/prisma/index.js';

const prisma = new PrismaClient();

async function main() {
  console.log('🗑️  Deleting all AREA problems...\n');

  const result = await prisma.problem.deleteMany({
    where: {
      type: 'AREA',
    },
  });

  console.log(`✅ Deleted ${result.count} AREA problems`);

  const totalCount = await prisma.problem.count();
  console.log(`\n📈 Total problems remaining in database: ${totalCount}`);
}

main()
  .catch((e) => {
    console.error('❌ Error:', e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
