<template>
  <nav>
    <header>
      <div class="navbar">
        <!-- Clickable logo navigates to homepage -->
        <div class="logo">
          <div class="button">
            <router-link to="/">Gala RMP</router-link>
          </div>
        </div>
        <!-- Menu to navigate to specific pages -->
        <div class="menu">
          <div class="button">
            <router-link to="/">Avaleht</router-link>
          </div>
          <div class="button">
            <router-link to="/teenused">Teenused</router-link>
          </div>
          <div class="button">
            <router-link to="/hinnakiri">Hinnakiri</router-link>
          </div>
          <div class="button">
            <router-link to="/kontakt">Kontakt</router-link>
          </div>
        </div>
      </div>
    </header>
  </nav>
</template>

<style scoped>
.navbar {
  overflow: hidden;
  background-color: #32455A;
  padding: 1em;
  font-size: 1.2em;
  width: 100%;
}

.button {
  display: flex;
  place-items: center;
}

.logo {float: left;}

.menu {
  display: flex;
  float: right;
}

.navbar a {
  display: inline-block;
  text-align: center;
}
</style>