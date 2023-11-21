import prisma from '@/lib/prisma'
import { getPhotos } from '@/utils/getPhoto'




const photoSrc = (width:string, name:string) =>`https://img.svobodinaphoto.ru/${width}_${name}.webp`



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
  const item = (await getPhotos(route)).map(e => (<img src={photoSrc("320", e.name)} alt="sv" />) )
  return (
    <main>
      <h1>{route}</h1>
<div>{item}</div>
      {/* <p>wow{JSON.stringify(item)}</p> */}
    </main>

  )
}
