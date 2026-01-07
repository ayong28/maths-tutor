import { PrismaClient } from '../../generated/prisma';

const prisma = new PrismaClient();

async function checkFractionSubtraction() {
  try {
    // Get counts by difficulty and tags
    const problems = await prisma.problem.groupBy({
      by: ['difficulty', 'tags'],
      where: {
        type: 'FRACTION_SUBTRACTION',
      },
      _count: {
        id: true,
      },
    });

    console.log('\n=== FRACTION_SUBTRACTION Problems ===\n');

    problems.forEach((group) => {
      console.log(`${group.difficulty}: ${JSON.stringify(group.tags)} - ${group._count.id} problems`);
    });

    // Get total count
    const total = await prisma.problem.count({
      where: {
        type: 'FRACTION_SUBTRACTION',
      },
    });

    console.log(`\nTotal: ${total} problems\n`);

    // Get a few examples
    const examples = await prisma.problem.findMany({
      where: {
        type: 'FRACTION_SUBTRACTION',
      },
      take: 5,
      select: {
        question: true,
        answer: true,
        difficulty: true,
        tags: true,
      },
    });

    console.log('=== Examples ===\n');
    examples.forEach((p) => {
      console.log(`${p.question} = ${p.answer}`);
      console.log(`  Difficulty: ${p.difficulty}, Tags: ${JSON.stringify(p.tags)}, Denominators: ${p.denominators}\n`);
    });

  } catch (error) {
    console.error('Error:', error);
  } finally {
    await prisma.$disconnect();
  }
}

checkFractionSubtraction();
