/*
  Warnings:

  - You are about to drop the `Cases` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Users` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE "Cases";

-- DropTable
DROP TABLE "Users";

-- CreateTable
CREATE TABLE "User" (
    "id" SERIAL NOT NULL,
    "email" VARCHAR(100) NOT NULL,
    "username" VARCHAR(100),
    "hash_password" VARCHAR(255),
    "role" "Roles",
    "state" "UserStates",
    "token" VARCHAR(255),
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "confirmed_at" TIMESTAMP(3),

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Case" (
    "id" SERIAL NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "assigned_at" TIMESTAMP(3),
    "agreeded_at" TIMESTAMP(3),
    "client_first_name" VARCHAR(100),
    "client_email" VARCHAR(100) NOT NULL,
    "address" VARCHAR(255) NOT NULL,
    "floor" INTEGER NOT NULL DEFAULT 0,
    "elevator" INTEGER NOT NULL DEFAULT 0,
    "squaremeters" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "quantity" INTEGER NOT NULL DEFAULT 0,
    "way_to_property" TEXT NOT NULL,
    "type_of_property_id" INTEGER,
    "state_id" INTEGER,
    "manager_id" INTEGER,
    "inspector_id" INTEGER,

    CONSTRAINT "Case_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TypeOfProperty" (
    "id" SERIAL NOT NULL,
    "title" VARCHAR(20) NOT NULL,

    CONSTRAINT "TypeOfProperty_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CaseState" (
    "id" SERIAL NOT NULL,
    "title" VARCHAR(20) NOT NULL,

    CONSTRAINT "CaseState_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "User_username_key" ON "User"("username");

-- AddForeignKey
ALTER TABLE "Case" ADD CONSTRAINT "Case_type_of_property_id_fkey" FOREIGN KEY ("type_of_property_id") REFERENCES "TypeOfProperty"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Case" ADD CONSTRAINT "Case_state_id_fkey" FOREIGN KEY ("state_id") REFERENCES "CaseState"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Case" ADD CONSTRAINT "Case_manager_id_fkey" FOREIGN KEY ("manager_id") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Case" ADD CONSTRAINT "Case_inspector_id_fkey" FOREIGN KEY ("inspector_id") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;
