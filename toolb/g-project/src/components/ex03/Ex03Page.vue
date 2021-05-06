<template>
  <div class="card-content">
    <nav-bar></nav-bar>
    <person-form class="card"></person-form>
    <people-list class="card"></people-list>
    <active-people-list class="card"></active-people-list>
  </div>
</template>
<script>
import NavBar from "../NavBar.vue";

import PersonForm from "./PersonForm.vue";
import PeopleList from "./PeopleList.vue";
import ActivePeopleList from "./ActivePeopleList.vue";

export default {
  components: {
    NavBar,
    PersonForm,
    PeopleList,
    ActivePeopleList
  }
}
</script>
<style>
body {
  background-color: antiquewhite
}
</style>