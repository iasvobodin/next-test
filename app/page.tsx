import prisma from '../lib/prisma'
import { photoSeries } from '../lib/photoseries'
import { photos } from '../lib/photos'



export default async function Home() {
  const user = await prisma.photoSeries.findMany({
    where: {
      type: 'ph',
    },
  })

  const listItems = photos.map(product =>
    <li key={product.Name}>
      <p>{JSON.stringify(product.Name)}</p>
    </li>
  );

  return (
    <main >
      <h1>Test</h1>
      <p>{JSON.stringify(user)}</p>
      <button>add some</button>
    </main>
  )
}



