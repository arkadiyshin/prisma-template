/*
  Warnings:

  - You are about to drop the column `transitionId` on the `TransitionAccess` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "TransitionAccess" DROP CONSTRAINT "TransitionAccess_transitionId_fkey";

-- AlterTable
ALTER TABLE "TransitionAccess" DROP COLUMN "transitionId";

-- AddForeignKey
ALTER TABLE "TransitionAccess" ADD CONSTRAINT "TransitionAccess_transition_id_fkey" FOREIGN KEY ("transition_id") REFERENCES "Transition"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
