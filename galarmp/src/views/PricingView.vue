<script setup>
import NavBar from '@/components/NavBar.vue';
import BaseTable from '@/components/BaseTable.vue';
import OtherTable from '@/components/OtherTable.vue';
import BurgerSlide from '@/components/BurgerSlide.vue';
import FooterBar from '@/components/FooterBar.vue';
</script>

<template>
  <header>
    <!-- Navigation bar -->
      <div id="headerer" style="display: block;">
          <NavBar></NavBar>
      </div>
  </header>
  <main>
    <!-- Burger menu -->
      <div id="slider" style="display: none;">
          <BurgerSlide></BurgerSlide>
      </div>
      <div class="title">
          <img src="backwide.webp" alt="background" style="width: 100%; height: 40.98%;">
          <div class="center"><h1>Hinnakiri</h1></div>
      </div>
      <div class="mainView">
        <!-- Base table -->
          <h2>Baashinnad</h2>
          <div class="basePricingTable">
              <BaseTable></BaseTable>
          </div>
          <!-- Other services table -->
          <h2>Teenuste hinnad</h2>
          <div class="basePricingTable">
              <OtherTable></OtherTable>
          </div>
      </div>
  </main>
  <footer>
    <!-- Footer with quick links -->
    <div class="footerer">
      <FooterBar></FooterBar>
    </div>
  </footer>
</template>

<script>
export default {
  data() {
    return {
      windowWidth: window.innerWidth,
      textSize: '4rem',
      textSize2: '2rem'
    };
  },

  methods: {
    // What happens when the window is < 1024px
    onResize() {
      if (window.innerWidth < 1024) {
        let element1 = document.getElementById('slider');
        let element2 = document.getElementById('headerer');
        element1.style.display = "block";
        element2.style.display = "none";
        this.textSize = (window.innerWidth/250).toString() + 'rem';
        this.textSize2 = (window.innerWidth/300).toString() + 'rem';
      } else {
        let element2 = document.getElementById('slider');
        let element1 = document.getElementById('headerer');
        element1.style.display = "block";
        element2.style.display = "none";
        this.textSize = '4rem';
      }
    }
  },
  
  mounted() {
    this.onResize()
    this.$nextTick(() => {
      window.addEventListener('resize', this.onResize);
    })
  },

  beforeUnmount() { 
    window.removeEventListener('resize', this.onResize); 
  }
}
</script>

<style scoped>
header {
    position: sticky;
    top: 0;
    z-index: 1000;
}

h1 {
    font-weight: 500;
    font-size: v-bind('textSize');
    position: relative;
    color: #0d1b2a;
}

h2 {
    margin-top: 1.5em;
    margin-bottom: 0.5em;
}

.footerer {width: 100%;}

.mainView {
  max-width: 75%;
  margin: auto;
}

.title {
  position: relative;
  text-align: center;
  padding-bottom: 4em;
}

.center {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}

.services {
    text-align: left;
    max-width: 75%;
    margin: auto;
}

#smallHeading {padding-top: 1em;}
</style>