<template>
  <div id="map"></div>
</template>
<script>
  import 'leaflet/dist/leaflet.css'
  import * as L from 'leaflet'
  import { defineComponent, onBeforeMount, onMounted, onUpdated } from 'vue';
  export default defineComponent({
    name: 'CreateMap',
    props:{
      markers:{
        type: Array,
        required: false,
        default: []
      }
    },
    setup(props) {
      let map = null

      onUpdated(() => {
        map.remove()
        createMapLayer()
      })

      onMounted(() => {
        createMapLayer()
      })

      onBeforeMount(() => {
        if(map){
          map.remove()
        }
      })

      const createMapLayer = () => {
        map = L.map('map').setView([-1.484614, -83.685239], 7)
        L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
            attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
        }).addTo(map);

        if(props.markers.length){
          setMarkers()
        }
      }

      const setMarkers = () => {
        props.markers.map((marker) => {
          let color = null
          let radio = null
          if(marker.magnitud < 5.5){
            color = 'green'
            radio = 500
          }else if(marker.magnitud < 7 && marker.magnitud >= 5.5){
            color = 'yellow'
            radio = 1000
          }else if(marker.magnitud >= 7){
            color = 'red'
            radio = 1500
          }
          return L.circle([marker.latitud, marker.longitud], {
            color: color,
            fillColor: color,
            fillOpacity: 0.5,
            radius: radio
          }).addTo(map)
          .bindPopup(marker.fecha + " " + marker.hora + " Mg.: " + marker.magnitud + " Prof.: " + marker.profundidad + "km")
        })
      }
    }
  })
</script>