-- DropIndex
DROP INDEX "Problem_type_difficulty_hasFractions_idx";

-- DropIndex
DROP INDEX "Problem_type_difficulty_hasMixedNumbers_idx";

-- DropIndex
DROP INDEX "Problem_type_difficulty_requiresLCD_idx";

-- AlterTable
ALTER TABLE "Problem" DROP COLUMN "denominators",
DROP COLUMN "hasFractions",
DROP COLUMN "hasMixedNumbers",
DROP COLUMN "requiresLCD";
