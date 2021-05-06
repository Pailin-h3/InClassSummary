<template>
  <div class="card-content">
    <nav-bar></nav-bar>
    <display-section class="card"></display-section>
    <number-input-section class="card"></number-input-section>
  </div>
</template>
<script>
import NavBar from "../NavBar.vue";

import DisplaySection from './DisplaySection.vue';
import NumberInputSection from './NumberInputSection.vue';

export default {
  components: {
    NavBar,
    DisplaySection,
    NumberInputSection,
  }
}
</script>