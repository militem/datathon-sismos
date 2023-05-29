<template>
    <div>
        <div class="container mx-auto">
            <div class="grid grid-cols-12 gap-4">
                <div class="md:col-span-3 sm:col-span-12 col-span-12">
                    <div class="bg-gray-100 p-2">
                        <div class="font-bold pb-2">Documentación</div><hr>
                        <div class="hover:bg-gray-300 p-2 cursor-pointer" @click="show_introduccion">
                            Introducción
                        </div><hr>
                        <div class="font-bold py-2">Peticiones</div><hr>
                        <div class="hover:bg-gray-300 p-2 cursor-pointer" @click="show_peticion">
                            Fechas
                        </div><hr>
                        <div class="hover:bg-gray-300 p-2 cursor-pointer" @click="show_magnitud">
                            Magnitud
                        </div><hr>
                        <div class="hover:bg-gray-300 p-2 cursor-pointer" @click="show_profundidad">
                            Profundidad
                        </div><hr>
                    </div>
                </div>
                <div class="md:col-span-9 sm:col-span-12 col-span-12" v-if="flag_intro">
                    <div>
                        La API de Actividad Sísmica Ecuador proporciona acceso a información sobre sismos registrados en el territorio ecuatoriano. Esta API permite a los desarrolladores obtener datos sobre los sismos, así como buscar sismos específicos utilizando varios parámetros de consulta.
                        Los registros almacenados van desde 1901-01-07 hasta 2023-05-21.
                    </div>
                    <div class="font-bold mt-2 text-lg">URL Base</div>
                    <div class="mt-2">La URL base para acceder a la API de Actividad Sísmica Ecuador es:</div>
                    <div class="bg-gray-100 mt-2 p-2 text-gray-700 text-sm">
                        POST &emsp; {{url}}/api/sismos/
                    </div>
                    <div class="font-bold mt-2 text-lg">Ejemplo básico de consulta</div>
                    <div class="mt-2">
                        Este recurso devuelve una lista de los 10 sismos más recientes registrados en Ecuador. Los últimos registrados con fecha 21 de mayo de 2023.
                    </div>
                    <div class="bg-gray-100 mt-2 p-2 text-gray-700 text-sm">
                        GET &emsp; {{url}}/api/sismos/latest/
                    </div>
                    <div class="rounded-md mt-2 bg-gray-900">
                        <div class="w-full bg-gray-800 rounded-t-md text-white p-2">
                            Ejemplo AXIOS JS
                        </div>
                        <div class="text-white text-sm py-2 px-4 flex justify-between">
                            <div>
                                axios.get("{{url}}/api/sismos/latest/", config:{headers: {"Content-Type": "application/json"}}) <br>
                                .then(response => { <br>
                                    &emsp;let datos = response.data.rows <br>
                                    &emsp;if(datos.length){ <br>
                                    &emsp;&emsp;console.log(datos) <br>
                                    &emsp;} <br>
                                })
                            </div>
                        </div>
                    </div>
                    <div class="rounded-md mt-2 bg-gray-900">
                        <div class="w-full bg-gray-800 rounded-t-md text-white p-2">
                            Ejemplo Python
                        </div>
                        <div class="text-white text-sm py-2 px-4 flex justify-between">
                            <div>
                                import requests <br>
                                res = requests.get("{{url}}/api/sismos/latest/") <br>
                                print(res.json())
                            </div>
                        </div>
                    </div>
                    <div class="font-bold mt-2 text-lg">Códigos de Estado</div>
                    <div class="mt-2">La API utiliza los siguientes códigos de estado HTTP:</div>
                    <ul class="mt-2 list-disc list-inside">
                        <li><span class="font-bold">200 OK:</span> La solicitud se completó correctamente.</li>
                        <li><span class="font-bold">400 Bad Request:</span> La solicitud contiene parámetros inválidos.</li>
                        <li><span class="font-bold">404 Not Found:</span> No se encontraron resultados que coincidan con la consulta.</li>
                        <li><span class="font-bold">500 Internal Server Error:</span> Se produjo un error interno en el servidor.</li>
                    </ul>
                    <div class="font-bold mt-2 text-lg">Consideraciones Adicionales</div>
                    <ul class="mt-2 list-disc list-inside">
                        <li>La información proporcionada por la API se basa en datos oficiales recopilados y unificados de IGEPN (Ecuador), USGS (Estados Unidos), IGP (Perú) y NOAA (Estados Unidos).</li>
                        <li>Los valores de magnitud son proporcionados en la escala de magnitud de momento (Mw).</li>
                        <li>Los valores de profundidad son proporcionados en kilometros (km).</li>
                    </ul>
                </div>
                <div class="md:col-span-9 sm:col-span-12 col-span-12" v-if="flag_fechas">
                    <div class="font-bold text-lg">Filtrar sismos</div>
                    <div class="bg-gray-100 mt-2 p-2 text-gray-700 text-sm">
                        POST &emsp; {{url}}/api/sismos/
                    </div>
                    <div class="mt-2">
                        Este recurso permite filtrar los sismos por una fecha inicial y una fecha final. 
                    </div>
                    <div class="mt-2">
                        <div class="font-bold">Parámetros de consulta</div>
                        <div>date_inicial - <span class="text-gray-500">date</span> - <span class="text-red-500">Required</span></div>          
                        <div>Especifica la fecha inicial de los sismos a buscar en formato YYYY-mm-dd (2016-01-01).</div>
                        <div>date_final - <span class="text-gray-500">date</span> - <span class="text-red-500">Required</span></div>
                        <div>Especifica la fecha final de los sismos a buscar en formato YYYY-mm-dd (2023-05-21).</div>
                    </div>
                    <div class="rounded-md bg-gray-900 mt-2">
                        <div class="w-full bg-gray-800 rounded-t-md text-white p-2">
                            AXIOS JS
                        </div>
                        <div class="text-white text-sm py-2 px-4 flex justify-between">
                            <div>
                                axios.post("{{url}}/api/sismos/", { date_inicial: '2016-01-01', date_final: '2023-05-21' }, config:{headers: {"Content-Type": "application/json"}}) <br>
                                .then(response => { <br>
                                    &emsp;let datos = response.data.rows <br>
                                    &emsp;if(datos.length){ <br>
                                    &emsp;&emsp;console.log(datos) <br>
                                    &emsp;} <br>
                                })
                            </div>
                        </div>
                    </div>
                    <div class="rounded-md bg-gray-900 mt-2">
                        <div class="w-full bg-gray-800 rounded-t-md text-white p-2">
                            Python
                        </div>
                        <div class="text-white text-sm py-2 px-4 flex justify-between">
                            <div>
                                import requests <br>
                                res = requests.post("{{url}}/api/sismos/", json={'date_inicial': '2016-01-01', 'date_final': '2023-05-21'}) <br>
                                print(res.json())
                            </div>
                        </div>
                    </div>
                    <div class="font-bold mt-2 text-lg">Por fecha especifica</div>
                    <div class="bg-gray-100 mt-2 p-2 text-gray-700 text-sm">
                        POST &emsp; {{url}}/api/sismos/bydate/
                    </div>
                    <div class="mt-2">
                        Este recurso permite buscar los sismos de una fecha especifica.
                    </div>
                    <div class="mt-2">
                        <div class="font-bold">Parámetros de consulta</div>
                        <div>date - <span class="text-gray-500">date</span> - <span class="text-red-500">Required</span></div>          
                        <div>Especifica la fecha de los sismos a buscar en formato YYYY-mm-dd (2016-01-01).</div>
                    </div>
                    <div class="rounded-md bg-gray-900 mt-2">
                        <div class="w-full bg-gray-800 rounded-t-md text-white p-2">
                            AXIOS JS
                        </div>
                        <div class="text-white text-sm py-2 px-4 flex justify-between">
                            <div>
                                axios.post("{{url}}/api/sismos/bydate/", { date: '2016-01-01'}, config:{headers: {"Content-Type": "application/json"}}) <br>
                                .then(response => { <br>
                                    &emsp;let datos = response.data.rows <br>
                                    &emsp;if(datos.length){ <br>
                                    &emsp;&emsp;console.log(datos) <br>
                                    &emsp;} <br>
                                })
                            </div>
                        </div>
                    </div>
                    <div class="rounded-md bg-gray-900 mt-2">
                        <div class="w-full bg-gray-800 rounded-t-md text-white p-2">
                            Python
                        </div>
                        <div class="text-white text-sm py-2 px-4 flex justify-between">
                            <div>
                                import requests <br>
                                res = requests.post("{{url}}/api/sismos/bydate/", json={'date': '2016-01-01'}) <br>
                                print(res.json())
                            </div>
                        </div>
                    </div>
                </div>
                <div class="md:col-span-9 sm:col-span-12 col-span-12" v-if="flag_magnitud">
                    <div class="font-bold text-lg">Filtrar magnitud</div>
                    <div class="bg-gray-100 mt-2 p-2 text-gray-700 text-sm">
                        POST &emsp; {{url}}/api/sismos/magnitud/
                    </div>
                    <div class="mt-2">
                        Este recurso permite filtrar los sismos por una magnitud inferior y una magnitud superior. 
                    </div>
                    <div class="mt-2">
                        <div class="font-bold">Parámetros de consulta</div>
                        <div>magnitud_inicial - <span class="text-gray-500">number</span> - <span class="text-red-500">Required</span></div>
                        <div>Rango inferior de magnitud en (Mw).</div>
                        <div>magnitud_final - <span class="text-gray-500">number</span> - <span class="text-red-500">Required</span></div>
                        <div>Rango superior de magnitud en (Mw).</div>
                    </div>
                    <div class="rounded-md bg-gray-900 mt-2">
                        <div class="w-full bg-gray-800 rounded-t-md text-white p-2">
                            AXIOS JS
                        </div>
                        <div class="text-white text-sm py-2 px-4 flex justify-between">
                            <div>
                                axios.post("{{url}}/api/sismos/magnitud/", { magnitud_inicial: 6, magnitud_final: 7}, config:{headers: {"Content-Type": "application/json"}}) <br>
                                .then(response => { <br>
                                    &emsp;let datos = response.data.rows <br>
                                    &emsp;if(datos.length){ <br>
                                    &emsp;&emsp;console.log(datos) <br>
                                    &emsp;} <br>
                                })
                            </div>
                        </div>
                    </div>
                    <div class="rounded-md bg-gray-900 mt-2">
                        <div class="w-full bg-gray-800 rounded-t-md text-white p-2">
                            Python
                        </div>
                        <div class="text-white text-sm py-2 px-4 flex justify-between">
                            <div>
                                import requests <br>
                                res = requests.post("{{url}}/api/sismos/magnitud/", json={"magnitud_inicial":"3","magnitud_final":"7"}) <br>
                                print(res.json())
                            </div>
                        </div>
                    </div>
                </div>
                <div class="md:col-span-9 sm:col-span-12 col-span-12" v-if="flag_profundidad">
                    <div class="font-bold text-lg">Filtrar profundidad</div>
                    <div class="bg-gray-100 mt-2 p-2 text-gray-700 text-sm">
                        POST &emsp; {{url}}/api/sismos/profundidad/
                    </div>
                    <div class="mt-2">
                        Este recurso permite filtrar los sismos por una profundidad mínima y una profundidad máxima. 
                    </div>
                    <div class="mt-2">
                        <div class="font-bold">Parámetros de consulta</div>
                        <div>profundidad_inicial - <span class="text-gray-500">number</span> - <span class="text-red-500">Required</span></div>
                        <div>Rango mínimo de profundidad en kilómetros (km).</div>
                        <div>profundidad_final - <span class="text-gray-500">number</span> - <span class="text-red-500">Required</span></div>
                        <div>Rango máxima de profundidad en kilómetros (km).</div>
                    </div>
                    <div class="rounded-md bg-gray-900 mt-2">
                        <div class="w-full bg-gray-800 rounded-t-md text-white p-2">
                            AXIOS JS
                        </div>
                        <div class="text-white text-sm py-2 px-4 flex justify-between">
                            <div>
                                axios.post("{{url}}/api/sismos/profundidad/", { profundidad_inicial: 50, profundidad_final: 100}, config:{headers: {"Content-Type": "application/json"}}) <br>
                                .then(response => { <br>
                                    &emsp;let datos = response.data.rows <br>
                                    &emsp;if(datos.length){ <br>
                                    &emsp;&emsp;console.log(datos) <br>
                                    &emsp;} <br>
                                })
                            </div>
                        </div>
                    </div>
                    <div class="rounded-md bg-gray-900 mt-2">
                        <div class="w-full bg-gray-800 rounded-t-md text-white p-2">
                            Python
                        </div>
                        <div class="text-white text-sm py-2 px-4 flex justify-between">
                            <div>
                                import requests <br>
                                res = requests.post("{{url}}/api/sismos/profundidad/", json={"profundidad_inicial":"50","profundidad_final":"100"}) <br>
                                print(res.json())
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
export default{
    data(){
        return{
            flag_intro: true,
            flag_fechas: false,
            flag_magnitud: false,
            flag_profundidad: false,
            url: 'http://192.168.100.202:3000'
        }
    },
    methods:{
        show_introduccion(){
            this.flag_intro = true
            this.flag_fechas = false
            this.flag_magnitud = false
            this.flag_profundidad = false
        },
        show_peticion(){
            this.flag_intro = false
            this.flag_fechas = true
            this.flag_magnitud = false
            this.flag_profundidad = false
        },
        show_magnitud(){
            this.flag_intro = false
            this.flag_fechas = false
            this.flag_magnitud = true
            this.flag_profundidad = false
        },
        show_profundidad(){
            this.flag_intro = false
            this.flag_fechas = false
            this.flag_magnitud = false
            this.flag_profundidad = true
        }
    }
}
</script>