/*
  Warnings:

  - The `state` column on the `Users` table would be dropped and recreated. This will lead to data loss if there is data in the column.

*/
-- CreateEnum
CREATE TYPE "UserStates" AS ENUM ('active', 'inactive');

-- AlterTable
ALTER TABLE "Users" DROP COLUMN "state",
ADD COLUMN     "state" "UserStates";

-- CreateTable
CREATE TABLE "Cases" (
    "id" SERIAL NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "assigned_at" TIMESTAMP(3),
    "agreeded_at" TIMESTAMP(3),
    "client_first_name" TEXT,
    "client_email" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "floor" INTEGER NOT NULL,
    "elevator" INTEGER NOT NULL,

    CONSTRAINT "Cases_pkey" PRIMARY KEY ("id")
);
