<template>
  <div class="card-content">
    <b-field label="แสดงรายชื่อที่ Active" v-if="activePeople.length">
      <b-table :data="activePeople" :columns="columns"></b-table>
    </b-field>
  </div>
</template>
<script>
import { mapGetters } from "vuex";

export default {
  data() {
    return {
      columns: [
        { field: "title", label: "คำนำหน้า" },
        { field: "firstName", label: "ชื่อ" },
        { field: "lastName", label: "นามสกุล" },
        { field: "isActive", label: "Active" }
      ]
    };
  },
  computed: {
    ...mapGetters("people", ["activePeople"])
  }
};
</script>
