-- AlterEnum
-- This migration adds more than one value to an enum.
-- With PostgreSQL versions 11 and earlier, this is not possible
-- in a single migration. This can be worked around by creating
-- multiple migrations, each migration adding only one value to
-- the enum.


ALTER TYPE "ProblemType" ADD VALUE 'DECIMALS_ADDITION';
ALTER TYPE "ProblemType" ADD VALUE 'DECIMALS_SUBTRACTION';
ALTER TYPE "ProblemType" ADD VALUE 'DECIMALS_MULTIPLICATION';
ALTER TYPE "ProblemType" ADD VALUE 'DECIMALS_DIVISION';
