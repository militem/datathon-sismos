<template>
    <div>
        <div class="container mx-auto">
            <div class="grid grid-cold-12">
                <div class="md:col-span-12 sm:col-span-12 col-span-12">
                    <div class="text-justify">
                        <div class="text-xl font-bold mb-2">Propuesta Datathon</div>
                        La propuesta es generar una interfaz web que contenga un mapa interactivo donde se puedan visualizar los sismos que han ocurrido a lo largo de la historia del Ecuador, de esta forma poder delimitar zonas de alto riesgo e intentar de proveer una predicción de fallas geológicas. El enfoque de la propuesta se enfoca en dar una respuesta al problema que se viene dando por la zona en la que se encuentra ubicada el país que es el Cinturón de Fuego del Pacífico teniendo en cuenta que es un factor primordial e importante por el que se pueden producirse fallas geológicas en los Andes. Es así que, a través de una predicción de posibles sucesos, se puede evitar pérdidas humanas y materiales. Países como México cuentan con sistemas de alerta temprana que han ayudado a salvar millones de vida las cuales hubieran perecido si no se hubiera realizado estos sistemas contra sismos, este ejemplo se puede tomar como punto de partida e inspiración. Teniendo en cuenta lo anterior, al delimitar zonas de alto riesgo también es posible evitar la construcción de edificaciones que no sean sismos resistentes o en zonas que no están preparadas. Para trabajar con los datos, se busca unificar todos los datasets de sismos que existen, obtenidos en parte de agencias como NOAA y USGS de Estados Unidos, otros, del Instituto Geofísico de la Escuela Politécnica. Conociendo que cada agencia cuenta con sus propios sensores y presenta datos de diferente manera, se buscará unificar los mismos en un solo dataset.
                        <br>
                        Organizaciones de donde se recopilaron los datos: IGEPN (Ecuador), USGS (Estados Unidos), IGP (Perú) y NOAA (Estados Unidos).
                        <div class="flex justify-center space-x-10 mt-2">
                            <a href="https://www.igepn.edu.ec/" target="_blank"><img src="../assets/LOGO-INSTITUTO-GEOFISICO.png" alt="IGEPN" class="w-30 h-20"></a>
                            <a href="https://www.usgs.gov/" target="_blank"><img src="../assets/2560px-USGS_logo_green.svg.png" alt="USGS" class="w-30 h-20"></a>
                            <a href="https://ultimosismo.igp.gob.pe/" target="_blank"><img src="../assets/logo_igp_sharecontent.png" alt="IGP" class="w-20 h-20"></a>
                            <a href="https://www.ngdc.noaa.gov/ngdc.html" target="_blank"><img src="../assets/NOAA_logo.svg.png" alt="NOAA" class="w-20 h-20"></a>
                        </div>
                        <div class="mt-2">
                            El código completo de la Aplicación web, API y tratamiento de los datos con R se encuentra en GitHub.
                            <a class="text-red-500 hover:text-blue-800 hover:underline" href="https://github.com/militem/datathon-sismos" target="_blank">https://github.com/militem/datathon-sismos</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="grid grid-cols-12">
                <div class="md:col-span-12 sm:col-span-12 col-span-12">
                    <div class="text-xl font-bold my-2">Estadísticas</div>
                    Para obtener un dataset se unificó todos los datasets de las agencias. Están recopilados en Github:
                    <ul class="mt-2 list-disc list-inside">
                        <li>IGEPN <a class="text-red-500 hover:text-blue-800 hover:underline" href="https://github.com/militem/datathon-sismos/blob/65aea442feb7211ca6d639ec4c90f7fccfaff3d2/datasets/CatalogoHomogenizado.txt" target="_blank">[Data1]</a>
                            <a class="text-red-500 hover:text-blue-800 hover:underline" href="https://github.com/militem/datathon-sismos/blob/65aea442feb7211ca6d639ec4c90f7fccfaff3d2/datasets/cat_2010_2011.txt" target="_blank">[Data2]</a>
                            <a class="text-red-500 hover:text-blue-800 hover:underline" href="https://github.com/militem/datathon-sismos/blob/65aea442feb7211ca6d639ec4c90f7fccfaff3d2/datasets/cat_origen_2012_feb2023.txt" target="_blank">[Data3]</a>
                        </li>
                        <li>USGS <a class="text-red-500 hover:text-blue-800 hover:underline" href="https://github.com/militem/datathon-sismos/blob/65aea442feb7211ca6d639ec4c90f7fccfaff3d2/datasets/query_usgs_1900_2023.csv" target="_blank">[Data1]</a></li>
                        <li>IGP <a class="text-red-500 hover:text-blue-800 hover:underline" href="https://github.com/militem/datathon-sismos/blob/65aea442feb7211ca6d639ec4c90f7fccfaff3d2/datasets/IGP_datos_sismicos.xlsx" target="_blank">[Data1]</a></li>
                        <li>NOAA <a class="text-red-500 hover:text-blue-800 hover:underline" href="https://github.com/militem/datathon-sismos/blob/65aea442feb7211ca6d639ec4c90f7fccfaff3d2/datasets/earthquakes-2023-05-26_20-56-44_-0500_noaa.tsv" target="_blank">[Data1]</a></li>
                        <li>Dataset unificado <a class="text-red-500 hover:text-blue-800 hover:underline" href="https://github.com/militem/datathon-sismos/blob/65aea442feb7211ca6d639ec4c90f7fccfaff3d2/datasets/data_sismos.csv" target="_blank">[Data1]</a></li>
                    </ul>
                </div>
            </div>
            <div class="grid grid-cols-12">
                <div class="md:col-span-6 sm:col-span-12 col-span-12">
                    <div class="flex justify-center">
                        <img src="../assets/Rplot.png" alt="" class="w-2/3">
                    </div>
                </div>
                <div class="md:col-span-6 sm:col-span-12 col-span-12">
                    <div class="flex justify-center">
                        <img src="../assets/Rplot01.png" alt="" class="w-2/3">
                    </div>
                </div>
            </div>
            <div class="grid grid-cols-12">
                <div class="md:col-span-6 sm:col-span-12 col-span-12">
                    <div class="flex justify-center">
                        <img src="../assets/Rplot02.png" alt="" class="w-2/3">
                    </div>
                </div>
                <div class="md:col-span-6 sm:col-span-12 col-span-12">
                    <div class="flex justify-center">
                        <img src="../assets/Rplot03.png" alt="" class="w-2/3">
                    </div>
                </div>
            </div>
            <div class="grid grid-cols-12">
                <div class="md:col-span-12 sm:col-span-12 col-span-12">
                    <div class="text-xl font-bold my-2">Mapa general</div>
                    <img src="../assets/mapa-historico.png" alt="Mapa general" class="w-full">
                </div>
            </div>
        </div>
    </div>
</template>