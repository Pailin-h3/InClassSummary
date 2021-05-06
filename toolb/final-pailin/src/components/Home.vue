<template>
  <div class="card-content">
    <section class="hero is-light">
      <div class="hero-body">
        <div class="container">
          <nav-bar></nav-bar>
          <h1 class="title">Welcome to Pailin's site</h1>
          <h2 class="subtitle">By Jinjuta Limwattana</h2>
        </div>
      </div>
    </section>
    <div class="tile is-ancestor">
      <div class="tile is-4 is-vertical is-parent">
        <div class="tile is-child box">
          <div class="card-image">
            <figure class="image">
              <img src="https://www.simhengheng.com/wp-content/uploads/2018/05/profile.jpg" alt="Placeholder image" />
            </figure>
          </div>
        </div>
        <div class="tile is-child box">
          <p class="title">Jinjuta Limwattana</p>
          <p>or Pailin.</p>
          <p>This site is for final IS322 1/2562 Thanks to Mr.Winai Nadee as teacher</p>
        </div>
      </div>
      <div class="tile is-parent">
        <div class="tile is-child box">
          <p class="title">Hi {{this.latestName}} </p>
          <p class="subtitle">Let me introduce myself</p>
          <p>Name : Pailin</p>
          <p>From Mukdahan Thailand studying at Thammasat for now</p>
          <p>I often play sports such as Basketball, Boxing, Karate, etc acually it's everything I can try here.</p>
          <p>Moreover I study in economics and like to coding with algorithm cuz it looks cool (maybe I'm wrong now).</p>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import NavBar from "./NavBar.vue";
import { mapGetters } from "vuex";
export default {
  components: {
    NavBar
  },
  computed: {
    ...mapGetters("names", ["latestName"])
  },
};
</script>