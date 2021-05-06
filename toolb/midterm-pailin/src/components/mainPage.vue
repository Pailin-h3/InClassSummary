<template>
  <div>
    <div class="card">
      <div class="card-content">
        <id-card></id-card>
      </div>
    </div>
    <div class="card">
        <div class="card-content">
            <job></job>
            <personal-info></personal-info>
            <adress></adress>
            <family></family>
            <study-his></study-his>
            <skills></skills>
            <job-his></job-his>
        </div>
    </div>
  </div>
</template>

<script>
import adress from "./adress.vue";
import job from "./job.vue";
import family from "./family.vue";
import idCard from "./idCard.vue";
import jobHis from "./jobHis.vue";
import personalInfo from "./personalInfo.vue";
import skills from "./skills.vue";
import studyHis from "./studyHis";

export default {
  name: "app",
  components: {
    adress,
    job,
    family,
    idCard,
    jobHis,
    personalInfo,
    skills,
    studyHis
  }
};
</script>

<style>
</style>