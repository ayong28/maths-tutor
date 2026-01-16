-- DropIndex
DROP INDEX IF EXISTS "Problem_type_difficulty_hasVariables_idx";

-- AlterTable
ALTER TABLE "Problem" DROP COLUMN IF EXISTS "hasVariables";
ALTER TABLE "Problem" DROP COLUMN IF EXISTS "sourceProblemNumber";
ALTER TABLE "Problem" DROP COLUMN IF EXISTS "sourceWorksheet";
