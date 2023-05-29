<template>
    <div class="max-w-7xl mx-auto py-8 px-8">
        <div class="flex justify-center">
            <div class="flex space-x-8 items-center">
                <div class="text-4xl font-bold">
                    <div class="flex items-center underline">ASE <img src="../assets/seismometer.svg" alt="Logo" class="w-8 h-8"></div>
                    <div class="text-sm">Actividad Sísmica Ecuador</div>
                </div>
                <div class="flex space-x-3">
                    <router-link class="px-4 py-2 text-lg rounded-t-lg border-b-4 border-gray-800 hover:bg-gray-100 hover:shadow transition duration-300" to="/">Mapa</router-link>
                    <router-link class="px-4 py-2 text-lg rounded-t-lg border-b-4 border-gray-800 hover:bg-gray-100 hover:shadow transition duration-300" to="/api">API</router-link>
                    <router-link class="px-4 py-2 text-lg rounded-t-lg border-b-4 border-gray-800 hover:bg-gray-100 hover:shadow transition duration-300" to="/about">About</router-link>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    name: "Navbar"
}
</script>