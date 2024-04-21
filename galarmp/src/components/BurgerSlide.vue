<!-- 
    This code is taken from
    https://www.npmjs.com/package/vue3-burger-menu
 -->
<template>
    <Slide right class="slide">
      <a id="home" href="#/">
        <span>Avaleht</span>
      </a>
      <a id="home" href="#/teenused">
        <span>Teenused</span>
      </a>
      <a id="home" href="#/hinnakiri">
        <span>Hinnakiri</span>
      </a>
      <a id="home" href="#/kontakt">
        <span>Kontakt</span>
      </a>
    </Slide>
</template>

<script>
import { Slide } from 'vue3-burger-menu'
export default {
  components: {
    Slide
  }
}
</script>

<style>
.slide {
  z-index: 100000;
  position: relative;
  right: 0;
  float: right;
}

.bm-burger-button {
  position: fixed;
  width: 36px;
  height: 30px;
  left: 90%;
  top: 36px;
  cursor: pointer;
  float: right;
}

.bm-burger-bars {background-color: #32455A;}

.line-style {
  position: absolute;
  height: 20%;
  left: 0;
  right: 0;
}

.cross-style {
  position: absolute;
  top: 12px;
  right: 2px;
  cursor: pointer;
}

.bm-cross {background: #ededed;}

.bm-cross-button {
  height: 24px;
  width: 24px;
}

.bm-menu {
  height: 100%; /* 100% Full-height */
  width: 0; /* 0 width - change this with JavaScript */
  position: fixed; /* Stay in place */
  z-index: 1000; /* Stay on top */
  top: 0;
  left: 0;
  background-color: #32455A; /* Black*/
  overflow-x: hidden; /* Disable horizontal scroll */
  padding-top: 60px; /* Place content 60px from the top */
  transition: 0.5s; /*0.5 second transition effect to slide in the sidenav*/
}

.bm-overlay {background: rgba(0, 0, 0, 0);}

.bm-item-list {
  color: #ededed;
  margin-left: 10%;
  font-size: 20px;
}

.bm-item-list > * {
  display: flex;
  text-decoration: none;
  padding: 0.7em;
}

.bm-item-list > * > span {
  margin-left: 10px;
  font-weight: 700;
  color: white;
}
</style>