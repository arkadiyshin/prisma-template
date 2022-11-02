-- CreateTable
CREATE TABLE "CaseItem" (
    "id" SERIAL NOT NULL,
    "case_id" INTEGER NOT NULL,
    "room" INTEGER NOT NULL DEFAULT 0,
    "room_title" VARCHAR(20),
    "description" TEXT,
    "quantity" INTEGER NOT NULL DEFAULT 0,

    CONSTRAINT "CaseItem_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CasePhoto" (
    "id" SERIAL NOT NULL,
    "case_id" INTEGER NOT NULL,
    "room" INTEGER NOT NULL DEFAULT 0,
    "photo" BYTEA NOT NULL,

    CONSTRAINT "CasePhoto_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Appointment" (
    "id" SERIAL NOT NULL,
    "date" DATE NOT NULL,
    "time_from" TIME NOT NULL,
    "time_to" TIME NOT NULL,
    "case_id" INTEGER NOT NULL,

    CONSTRAINT "Appointment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CaseHistory" (
    "id" SERIAL NOT NULL,
    "time" TIMESTAMP(3) NOT NULL,
    "case_id" INTEGER NOT NULL,
    "case_state_id" INTEGER NOT NULL,
    "case_new_state_id" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL,
    "description" TEXT,
    "case_data" JSONB,

    CONSTRAINT "CaseHistory_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Transition" (
    "id" SERIAL NOT NULL,
    "state_id" INTEGER NOT NULL,
    "next_state_id" INTEGER NOT NULL,

    CONSTRAINT "Transition_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TransitionAccess" (
    "role" "Roles" NOT NULL,
    "transition_id" INTEGER NOT NULL,
    "transitionId" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "TransitionAccess_role_transition_id_key" ON "TransitionAccess"("role", "transition_id");

-- AddForeignKey
ALTER TABLE "CaseItem" ADD CONSTRAINT "CaseItem_case_id_fkey" FOREIGN KEY ("case_id") REFERENCES "Case"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CasePhoto" ADD CONSTRAINT "CasePhoto_case_id_fkey" FOREIGN KEY ("case_id") REFERENCES "Case"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Appointment" ADD CONSTRAINT "Appointment_case_id_fkey" FOREIGN KEY ("case_id") REFERENCES "Case"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CaseHistory" ADD CONSTRAINT "CaseHistory_case_id_fkey" FOREIGN KEY ("case_id") REFERENCES "Case"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CaseHistory" ADD CONSTRAINT "CaseHistory_case_state_id_fkey" FOREIGN KEY ("case_state_id") REFERENCES "CaseState"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CaseHistory" ADD CONSTRAINT "CaseHistory_case_new_state_id_fkey" FOREIGN KEY ("case_new_state_id") REFERENCES "CaseState"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CaseHistory" ADD CONSTRAINT "CaseHistory_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Transition" ADD CONSTRAINT "Transition_state_id_fkey" FOREIGN KEY ("state_id") REFERENCES "CaseState"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Transition" ADD CONSTRAINT "Transition_next_state_id_fkey" FOREIGN KEY ("next_state_id") REFERENCES "CaseState"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TransitionAccess" ADD CONSTRAINT "TransitionAccess_transitionId_fkey" FOREIGN KEY ("transitionId") REFERENCES "Transition"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
