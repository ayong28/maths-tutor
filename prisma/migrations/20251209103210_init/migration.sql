-- CreateEnum
CREATE TYPE "ProblemType" AS ENUM ('FRACTION_ADDITION', 'FRACTION_SUBTRACTION', 'FRACTION_REDUCTION', 'FRACTION_MULTIPLICATION', 'FRACTION_DIVISION', 'ALGEBRA_COLLECTING_TERMS', 'ALGEBRA_MULTIPLICATION');

-- CreateEnum
CREATE TYPE "Difficulty" AS ENUM ('EASY', 'MEDIUM', 'HARD');

-- CreateTable
CREATE TABLE "Problem" (
    "id" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "question" TEXT NOT NULL,
    "answer" TEXT NOT NULL,
    "type" "ProblemType" NOT NULL,
    "category" TEXT NOT NULL,
    "difficulty" "Difficulty" NOT NULL DEFAULT 'MEDIUM',
    "tags" TEXT[],
    "sourceWorksheet" TEXT,
    "sourceProblemNumber" INTEGER,
    "hasVariables" BOOLEAN NOT NULL DEFAULT false,
    "hasFractions" BOOLEAN NOT NULL DEFAULT false,
    "hasMixedNumbers" BOOLEAN NOT NULL DEFAULT false,
    "denominators" TEXT[],
    "requiresLCD" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "Problem_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WorksheetTemplate" (
    "id" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "name" TEXT NOT NULL,
    "displayTitle" TEXT NOT NULL,
    "problemType" "ProblemType" NOT NULL,
    "totalProblems" INTEGER NOT NULL DEFAULT 30,
    "difficultyMix" JSONB NOT NULL,
    "requiredTags" TEXT[],
    "excludedTags" TEXT[],
    "tips" TEXT[],

    CONSTRAINT "WorksheetTemplate_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "GeneratedWorksheet" (
    "id" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "title" TEXT NOT NULL,
    "templateId" TEXT,
    "seed" TEXT,
    "pdfPath" TEXT,

    CONSTRAINT "GeneratedWorksheet_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WorksheetProblem" (
    "id" TEXT NOT NULL,
    "worksheetId" TEXT NOT NULL,
    "problemId" TEXT NOT NULL,
    "position" INTEGER NOT NULL,

    CONSTRAINT "WorksheetProblem_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "Problem_type_difficulty_idx" ON "Problem"("type", "difficulty");

-- CreateIndex
CREATE INDEX "Problem_category_idx" ON "Problem"("category");

-- CreateIndex
CREATE INDEX "Problem_tags_idx" ON "Problem"("tags");

-- CreateIndex
CREATE UNIQUE INDEX "WorksheetTemplate_name_key" ON "WorksheetTemplate"("name");

-- CreateIndex
CREATE UNIQUE INDEX "WorksheetProblem_worksheetId_position_key" ON "WorksheetProblem"("worksheetId", "position");

-- AddForeignKey
ALTER TABLE "GeneratedWorksheet" ADD CONSTRAINT "GeneratedWorksheet_templateId_fkey" FOREIGN KEY ("templateId") REFERENCES "WorksheetTemplate"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WorksheetProblem" ADD CONSTRAINT "WorksheetProblem_worksheetId_fkey" FOREIGN KEY ("worksheetId") REFERENCES "GeneratedWorksheet"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WorksheetProblem" ADD CONSTRAINT "WorksheetProblem_problemId_fkey" FOREIGN KEY ("problemId") REFERENCES "Problem"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
