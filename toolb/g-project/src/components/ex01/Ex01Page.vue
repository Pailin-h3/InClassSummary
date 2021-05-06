<template>
  <div class="card-content">
    <nav-bar></nav-bar>
    <name-section
      class="card"
      v-model="fullName">
    </name-section>
    <p> {{ fullName }} </p>
  </div>
</template>
<script>
import NavBar from "../NavBar.vue";
import NameSection from './NameSection.vue';

export default {
  components: {
    NavBar,
    NameSection,
  },
  data() {
    return {
      fullName: {
        title: '',
        firstName: '',
        lastName: '',
      }
    };
  }
}
</script>