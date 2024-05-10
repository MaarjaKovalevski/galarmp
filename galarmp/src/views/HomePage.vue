<script setup>
import NavBar from '@/components/NavBar.vue';
import HomeInfo from '@/components/HomeInfo.vue';
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
    <!-- Hamburger menu for when the window is < 1024px -->
    <div id="slider" style="display: none;">
      <BurgerSlide></BurgerSlide>
    </div>
    <!-- The title of the page with a picture as a background -->
    <div class="title">
      <img src="backwide.webp" alt="background" style="width: 100%; height: 40.98%;">
      <div class="center"><h1>Raamatupidamine</h1></div>
    </div>
    <div class="mainView">
      <div class="section">
        <div class="tagline">
          <h2>Raamatupidamisteenus mikro- ja väikeettevõtetele</h2>
        </div>
        <div class="info">
          <!-- Introductory text from the database -->
            <HomeInfo></HomeInfo>
            <!-- Picture of the company owner -->
            <div class="pic">
              <img src="owner.webp" alt="picture of owner" class="picture">
            </div>
        </div>
      </div>
    </div>
  </main>
  <footer>
    <!-- Footer showing quick links to contact the company -->
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
      textSize2: '2rem',
    };
  },

  methods: {
    // What happens when the size of the window is < 1024px
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

h2 {font-size: v-bind('textSize2');}

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

.tagline {
  text-align: center;
  margin-bottom: 7em;
}

.section {margin-top: 3em;}

.info {
  display: flex;
  margin-top: 3em;
}

.picture {
  margin-left: 4em;
  width: 280px;
  height: 392px;
}

@media (max-width: 1024px) {
  .info {display: block;}

  .picture {
    margin: auto;
    margin-top: 2em;
  }

  .pic {text-align: center;}
}
</style>