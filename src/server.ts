import { PrismaClient } from '@prisma/client'

const prisma = new PrismaClient({
    log: [{ level: 'query', emit: 'event' }, { level: 'info', emit: 'event' }],
})

//console.dir(prisma);

async function main() {
    // ... you will write your Prisma Client queries here
    const allUsers = await prisma.transition.findMany({
        where: {
            id: 1,
        },
        select: {
            State: {
                select: {
                    id: true,
                    title: false
                }
            }
        },
        

    }
    )
    console.log(allUsers)

}

main()
    .then(async () => {
        await prisma.$disconnect()
    })
    .catch(async (e) => {
        console.error(e)
        await prisma.$disconnect()
        process.exit(1)
    })