import { cache } from 'react'
import prisma from '@/lib/prisma'

export const revalidate = 3600 // revalidate the data at most every hour

export const getPhotos = cache(async (photoSeries: string) => {
    const photos = await prisma.photo.findMany({
        where: {
            seriesRoute: `${photoSeries}`,
        },
    })

    return photos
})