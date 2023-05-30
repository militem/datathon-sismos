<template>
    <div>
        <div class="container mx-auto">
            <div class="grid grid-cols-12">
                <div class="md:col-span-12 sm:col-span-12 col-span-12">
                    <div class="mb-2 flex justify-center">
                        <div class="mr-1">
                            <label for="desde" class="block">Desde</label>
                            <input v-model="date_inicial" id="desde" type="date" class="p-2 bg-gray-200 border border-gray-900 rounded-lg">
                        </div>
                        <div class="mx-1">
                            <label for="hasta" class="block">Hasta</label>
                            <input v-model="date_final" id="hasta" type="date" class="p-2 bg-gray-200 border border-gray-900 rounded-lg">
                        </div>
                    </div>
                </div>
            </div>
            <div class="grid grid-cols-12">
                <div class="md:col-span-12 sm:col-span-12 col-span-12">
                    <div class="mb-2 flex justify-center">
                        <div class="flex items-end mr-1">
                            <button @click="getSismos()" class="flex focus:outline-none text-white focus:ring-4 focus:ring-green-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2 bg-green-600 hover:bg-green-700 focus:ring-green-800"><img src="../assets/search-svgrepo-com.svg" alt="Buscar" class="w-5 h-5 mr-2"> Consultar</button>
                        </div>
                        <div class="flex items-end">
                            <JsonCSV :data="markers" :name="'data_'+date_inicial+'_'+date_final+'.csv'" class="flex cursor-pointer focus:outline-none text-black focus:ring-4 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2 bg-gray-300 hover:bg-gray-700 focus:ring-gray-800"><img src="../assets/csv-file-format-extension-svgrepo-com.svg" alt="Buscar" class="w-5 h-5 mr-2"> Descargar</JsonCSV>
                        </div>
                        <div class="flex items-end mr-1">
                            <button @click="getStats()" class="flex focus:outline-none text-white focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2 bg-blue-600 hover:bg-blue-700 focus:ring-blue-800" :disabled="flag_buttons"><img src="../assets/stats-svgrepo-com.svg" alt="Buscar" class="w-5 h-5 mr-2"> Estadísticas</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="grid grid-cols-12">
                <div class="md:col-span-12 sm:col-span-12 col-span-12">
                    <div v-if="flag">
                        <CreateMap class="w-full h-screen z-10" :markers="markers"/>
                    </div>
                </div> 
            </div>  
            <div class="grid grid-cols-12">
                <div class="md:col-span-12 sm:col-span-12 col-span-12">
                    <div class="flex items-center mt-4 justify-center">
                        <div id="circle1"  class="mr-4"></div>
                        Sismos de magnitud superior a 7
                    </div>
                    <div class="flex items-center mt-4 justify-center">
                        <div id="circle2" class="mr-4 ml-1"></div>
                        Sismos de magnitud entre 5.5 y 7
                    </div>
                    <div class="flex items-center mt-4 justify-center">
                        <div id="circle3" class="mr-4 ml-3"></div>
                        Sismos de magnitud inferior a 5.5
                    </div>
                </div>
            </div>
        </div>
        <div v-if="display_modal_stats" class="fixed mt-40 top-0 w-full overflow-x-hidden overflow-y-auto md:inset-0 z-40 shadow-lg shadow-gray-500/100">
            <div class="relative mx-auto w-full max-w-md md:h-auto">
            <!-- Modal content -->
                <div class="relative rounded shadow bg-gray-800">
                    <button @click="display_modal_stats = !display_modal_stats" type="button" class="absolute top-3 right-2.5 text-gray-400 bg-transparent hover:bg-gray-100 hover:text-gray-700 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center hover:bg-gray-800 hover:text-white">
                        <svg aria-hidden="true" class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>
                        <span class="sr-only">Close modal</span>
                    </button>
                    <div class="px-6 py-6 lg:px-8">
                        <h3 class="mb-4 text-xl font-medium text-white text-center">
                            <span class="font-bold text-3xl">Estadísticas</span><br>
                            {{ date_inicial }} | {{ date_final }}
                        </h3>
                        <div class="space-y-6">
                            <table class="text-white w-full text-sm text-left">
                                <tbody>
                                    <tr class="border-b">
                                        <th>Número de sismos</th>
                                        <td>{{ n_sismos }}</td>
                                    </tr>
                                    <tr class="border-b">
                                        <th class="flex items-center"><div id="circle1"  class="mr-4 my-2"></div>Magnitud Alta</th>
                                        <td>{{ n_alta_sismos }}</td>
                                    </tr>
                                    <tr class="border-b">
                                        <th class="flex items-center"><div id="circle2"  class="mr-4 my-2"></div>Magnitud Media</th>
                                        <td>{{ n_media_sismos }}</td>
                                    </tr>
                                    <tr class="border-b">
                                        <th class="flex items-center"><div id="circle3"  class="mr-4 my-2"></div>Magnitud Baja</th>
                                        <td>{{ n_baja_sismos }}</td>
                                    </tr>
                                    <tr class="border-b">
                                        <th>Magnitud media</th>
                                        <td>{{ mean_magnitud }}(Mw)</td>
                                    </tr>
                                    <tr class="border-b">
                                        <th>Produndidad media</th>
                                        <td>{{ mean_profundidad }}(km)</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
import CreateMap from '../components/CreateMap.vue'
import JsonCSV from 'vue-json-csv'
import axios from 'axios'
export default{
  name: 'App',
  components: {
    CreateMap,
    JsonCSV
  },
  data(){
    return{
        markers: [],
        fields: ['fecha','hora','latitud','longitud','profundidad','magnitud'],
        config: {
            headers: {
                "Content-Type": "application/json"
            }
        },
        flag: false,
        flag_buttons: true,
        date_inicial: "2016-01-01",
        date_final: "2023-05-21",
        display_modal_stats: false,
        n_sismos: 0,
        n_alta_sismos: 0,
        n_media_sismos: 0,
        n_baja_sismos: 0,
        mean_magnitud: 0,
        mean_profundidad: 0
    }
  },
  created(){
    this.getSismos()
  },
  methods: {
    getSismos(){
        this.flag_buttons = true
        axios.post("http://68.183.216.245:3000/api/sismos/", { date_inicial: this.date_inicial, date_final: this.date_final }, this.config)
        .then(response => {
            let datos = response.data.rows
            if(datos.length){
                this.markers = datos
                this.flag = true
                this.flag_buttons = false
            }
        })
    },
    getStats(){
        this.n_sismos = 0
        this.mean_magnitud = 0
        this.mean_profundidad = 0
        this.n_alta_sismos = 0
        this.n_media_sismos = 0
        this.n_baja_sismos = 0
        this.display_modal_stats = true
        this.n_sismos = this.markers.length
        let sum_m = 0
        let sum_p = 0
        this.markers.map((marker) => {
            if(marker.magnitud < 5.5){
                this.n_baja_sismos += 1
            }else if(marker.magnitud < 7 && marker.magnitud >= 5.5){
                this.n_media_sismos += 1
            }else if(marker.magnitud >= 7){
                this.n_alta_sismos += 1
            }
            sum_m += marker.magnitud
            sum_p += marker.profundidad
        })
        this.mean_magnitud = (sum_m / this.n_sismos).toFixed(2)
        this.mean_profundidad = (sum_p / this.n_sismos).toFixed(2)
        sum_m = 0
        sum_p = 0
    }
  }
}
</script>
<style scoped>
#circle1 {
    background: #FC3C3C;
    border-radius: 50%;
    border: 3px solid red;
    width: 50px;
    height: 50px;
}
#circle2 {
    background: #D4E96F;
    border-radius: 50%;
    border: 3px solid yellow;
    width: 35px;
    height: 35px;
}
#circle3 {
    background: #54A96F;
    border-radius: 50%;
    border: 3px solid green;
    width: 20px;
    height: 20px;
}
</style>