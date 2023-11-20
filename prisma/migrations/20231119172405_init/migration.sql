-- CreateTable
CREATE TABLE "PhotoSeries" (
    "id" SERIAL NOT NULL,
    "type" TEXT NOT NULL,
    "group" TEXT,
    "route" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT NOT NULL,

    CONSTRAINT "PhotoSeries_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Photo" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "aspect" DOUBLE PRECISION NOT NULL,
    "colors" TEXT[],
    "Keywords" TEXT[],
    "Rating" INTEGER NOT NULL,
    "seriesRoute" TEXT,

    CONSTRAINT "Photo_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Props" (
    "id" SERIAL NOT NULL,
    "ShSp" TEXT NOT NULL,
    "Ap" TEXT NOT NULL,
    "Fl" TEXT NOT NULL,
    "photoName" TEXT NOT NULL,

    CONSTRAINT "Props_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Cover" (
    "id" SERIAL NOT NULL,
    "photoName" TEXT NOT NULL,
    "seriesRoute" TEXT NOT NULL,

    CONSTRAINT "Cover_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "PhotoSeries_route_key" ON "PhotoSeries"("route");

-- CreateIndex
CREATE UNIQUE INDEX "Photo_name_key" ON "Photo"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Props_photoName_key" ON "Props"("photoName");

-- CreateIndex
CREATE UNIQUE INDEX "Cover_photoName_key" ON "Cover"("photoName");

-- CreateIndex
CREATE UNIQUE INDEX "Cover_seriesRoute_key" ON "Cover"("seriesRoute");

-- AddForeignKey
ALTER TABLE "Photo" ADD CONSTRAINT "Photo_seriesRoute_fkey" FOREIGN KEY ("seriesRoute") REFERENCES "PhotoSeries"("route") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Props" ADD CONSTRAINT "Props_photoName_fkey" FOREIGN KEY ("photoName") REFERENCES "Photo"("name") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Cover" ADD CONSTRAINT "Cover_photoName_fkey" FOREIGN KEY ("photoName") REFERENCES "Photo"("name") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Cover" ADD CONSTRAINT "Cover_seriesRoute_fkey" FOREIGN KEY ("seriesRoute") REFERENCES "PhotoSeries"("route") ON DELETE RESTRICT ON UPDATE CASCADE;
