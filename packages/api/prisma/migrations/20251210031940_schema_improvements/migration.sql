/*
  Warnings:

  - You are about to drop the column `category` on the `Problem` table. All the data in the column will be lost.
  - The `denominators` column on the `Problem` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - You are about to drop the column `difficultyMix` on the `WorksheetTemplate` table. All the data in the column will be lost.
  - Added the required column `updatedAt` to the `WorksheetTemplate` table without a default value. This is not possible if the table is not empty.

*/
-- AlterEnum
-- This migration adds more than one value to an enum.
-- With PostgreSQL versions 11 and earlier, this is not possible
-- in a single migration. This can be worked around by creating
-- multiple migrations, each migration adding only one value to
-- the enum.


ALTER TYPE "ProblemType" ADD VALUE 'ALGEBRA_SUBSTITUTION';
ALTER TYPE "ProblemType" ADD VALUE 'ALGEBRA_WORD_PROBLEMS';
ALTER TYPE "ProblemType" ADD VALUE 'ALGEBRA_DISTRIBUTIVE_LAW';
ALTER TYPE "ProblemType" ADD VALUE 'ALGEBRA_LINEAR_EQUATIONS_SIMPLE';
ALTER TYPE "ProblemType" ADD VALUE 'ALGEBRA_LINEAR_EQUATIONS_COMPLEX';
ALTER TYPE "ProblemType" ADD VALUE 'ALGEBRA_EXPANDING_BRACKETS';
ALTER TYPE "ProblemType" ADD VALUE 'ALGEBRA_FACTORISING';
ALTER TYPE "ProblemType" ADD VALUE 'COORDINATES_PLOTTING';
ALTER TYPE "ProblemType" ADD VALUE 'LINEAR_GRAPHING';

-- DropIndex
DROP INDEX "Problem_category_idx";

-- DropIndex
DROP INDEX "Problem_tags_idx";

-- AlterTable
ALTER TABLE "Problem" DROP COLUMN "category",
DROP COLUMN "denominators",
ADD COLUMN     "denominators" INTEGER[];

-- AlterTable
ALTER TABLE "WorksheetProblem" ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP;

-- AlterTable
ALTER TABLE "WorksheetTemplate" DROP COLUMN "difficultyMix",
ADD COLUMN     "easyCount" INTEGER NOT NULL DEFAULT 10,
ADD COLUMN     "hardCount" INTEGER NOT NULL DEFAULT 5,
ADD COLUMN     "mediumCount" INTEGER NOT NULL DEFAULT 15,
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL;

-- CreateIndex
CREATE INDEX "GeneratedWorksheet_templateId_idx" ON "GeneratedWorksheet"("templateId");

-- CreateIndex
CREATE INDEX "Problem_type_difficulty_hasFractions_idx" ON "Problem"("type", "difficulty", "hasFractions");

-- CreateIndex
CREATE INDEX "Problem_type_difficulty_hasVariables_idx" ON "Problem"("type", "difficulty", "hasVariables");

-- CreateIndex
CREATE INDEX "Problem_type_difficulty_requiresLCD_idx" ON "Problem"("type", "difficulty", "requiresLCD");

-- CreateIndex
CREATE INDEX "Problem_type_difficulty_hasMixedNumbers_idx" ON "Problem"("type", "difficulty", "hasMixedNumbers");

-- CreateIndex
CREATE INDEX "Problem_tags_idx" ON "Problem" USING GIN ("tags");

-- CreateIndex
CREATE INDEX "WorksheetProblem_worksheetId_idx" ON "WorksheetProblem"("worksheetId");

-- CreateIndex
CREATE INDEX "WorksheetProblem_problemId_idx" ON "WorksheetProblem"("problemId");
