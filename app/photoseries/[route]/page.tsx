import prisma from '@/lib/prisma'
import { getPhotos } from '@/utils/getPhoto'

export async function generateStaticParams() {
  const photoSeries = await prisma.photoSeries.findMany({
    where: {
      type: 'ph',
    },
  })

  return photoSeries.map((ph) => ({
    route: ph.route,
  }))
}

export default async function Page({ params }: { params: { route: string } }) {
  // const data = await getData()
  const { route } = params
  const item = await getPhotos(route)
  return (
    <main>
      <h1>{route}</h1>
      <p>{JSON.stringify(item.map(e => e.name))}</p>
    </main>

  )
}
