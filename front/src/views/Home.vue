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
                    </div>
                </div>
            </div>
            <div class="grid grid-cols-12">
                <div class="md:col-span-12 sm:col-span-12 col-span-12">
                    <div v-if="flag">
                        <CreateMap class="w-full h-screen" :markers="markers"/>
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
        date_inicial: "2016-01-01",
        date_final: "2023-05-21"
    }
  },
  created(){
    this.getSismos()
    this.magnitud()
  },
  methods: {
    getSismos(){
        axios.post("http://192.168.100.202:3000/api/sismos/", { date_inicial: this.date_inicial, date_final: this.date_final }, this.config)
        .then(response => {
            let datos = response.data.rows
            if(datos.length){
                this.markers = datos
                this.flag = true
            }
        })
    },
    magnitud(){
        axios.get("http://192.168.100.202:3000/api/sismos/latest/", this.config)
        .then(response => {
            let datos = response.data.rows
            if(datos.length){
                console.log(datos)
            }
        })
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