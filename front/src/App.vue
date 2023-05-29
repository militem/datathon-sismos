<template>
  <div class="letra">
    <Navbar/>
    <router-view />
    <Footer class="footer"/>
  </div>
</template>

<script>
import Footer from './components/Footer.vue';
import Navbar from './components/Navbar.vue';
export default {
  name: "App",
  components:{
    Navbar,
    Footer
  }
};
</script>

<style>
  @import url('https://fonts.googleapis.com/css2?family=Sora&display=swap');
  .letra{
    font-family: 'Sora', sans-serif;
  }
  #app{
    padding-bottom: 8rem;
  }
  html {
  min-height: 100%;
  position: relative;
  }
  body {
    margin: 0;
    margin-bottom: 20px;
  }
  .footer {
    position: absolute;
    bottom: 0;
    width: 100%;
  }
</style>