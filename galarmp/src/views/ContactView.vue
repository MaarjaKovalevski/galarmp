<script setup>
import NavBar from '@/components/NavBar.vue';
import BurgerSlide from '@/components/BurgerSlide.vue';
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
            <div class="center"><h1>Kontakt</h1></div>
        </div>
        <div class="mainView">
            <!-- Info about the company -->
            <div class="companyInfo">
                <div class="companyContact">
                    Galina Kovalevskaja<br>
                    Telefon: <a href="tel:+3725140807">+372 514 0807</a><br>
                    E-post: <a href="mailto:galarmp@gmail.com">galarmp@gmail.com</a><br>
                    LinkedIn: <a href="https://www.linkedin.com/company/galarmp/">linkedin.com/company/galarmp</a><br><br>
                    Gala RMP OÜ<br>
                    Reg-nr: 1463 7267<br>
                    Aadress: Sipasoo tee 15-4, Habaja, Kose vald, 75002, Harjumaa
                </div>
                <!-- Map code taken from: https://embed-googlemap.com/ -->
                <div class="mapouter">
                    <div class="gmap_canvas">
                        <iframe class="gmap_iframe" 
                            width="100%" 
                            frameborder="0" 
                            scrolling="no" 
                            marginheight="0" 
                            marginwidth="0" 
                            src="https://maps.google.com/maps?width=600&amp;height=400&amp;hl=en&amp;q=Sipasoo tee 15-4, Habaja&amp;t=&amp;z=16&amp;ie=UTF8&amp;iwloc=B&amp;output=embed">
                        </iframe>
                    </div>
                </div>
            </div>
        </div>
    </main>
    
    <!-- Form for future development -->
    <!-- <div class="form">
        <h2>Võta ühendust</h2>
        <form id="messageForm">
            <div class="info">
                <div class="labels">
                    <div class="singleLabel">
                        <label for="email">E-post:</label><br>
                    </div>
                    <div class="singleLabel">
                        <label for="phone">Telefon:</label>
                    </div>
                </div>
                <div class="inputs">
                    <input type="email" id="email" name="email" placeholder="näide@mail.ee"><br>
                    <input type="phone" id="phone" name="phone" placeholder="+372 1234 5678"><br>
                </div>
            </div>
            <label for="message">Sõnum:</label><br>
            <input type="message" id="message" name="message" size="10">
            <textarea name="message" form="messageForm" class="message"></textarea>
            <div class="buttons">
                <input type="button" value="Saada" class="submitButton">
            </div>
        </form>
    </div> -->
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

a {
    background: none;
    color: #32455A;
}

/* label {
    padding-right: 1em;
    font-size: 1.2em;
}

h2 {
    margin-bottom: 1em;
}

input {
    border-radius: 1em;
    width: 20em;
    height: 2em;
    padding: 5%;
    margin-bottom: 1em;
    margin-top: 0.1em;
}

textarea {
    padding: 1em;
} */

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


.companyContact {
    margin-bottom: 1em;
}

/* .info {
    display: flex;
}

.singleLabel {
    margin-bottom: 1em;
}

.message {
    border-radius: 0.7em;
    min-width: 53em;
    min-height: 20em;
    max-width: 100%;
    max-height: 50em;
} */

/* .submitButton {
    padding: 0%;
    width: 10em;
    height: 3em;
    border-radius: 2em;
}

.submitButton:hover {
    cursor: pointer;
    background-color: grey;
} */
/* 
#message {
    width: 80%;
    height: 30em;
    border-radius: 1em;
} */

.mapouter{
    position:relative;
    text-align:right;
    width:100%;
    height:400px;
    margin-bottom: 5em;
}
.gmap_canvas {
    overflow:hidden;
    background:none!important;
    width:100%;
    height:400px;
}
.gmap_iframe {
    height:400px!important;
}

</style>