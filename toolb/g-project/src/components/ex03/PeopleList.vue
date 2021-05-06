<template>
  <div class="card-content">
    <b-field label="แสดงรายชื่อทั้งหมด" v-if="people.length">
            <b-table @dblclick="deletePerson" :data="people" :columns="columns"
        :selected.sync="selected"
        focusable></b-table>
    </b-field>
  </div>
</template>
<script>
import { mapState } from "vuex";

export default {
  data() {
    return {
      selected: {},
      columns: [
        { field: "title", label: "คำนำหน้า" },
        { field: "firstName", label: "ชื่อ" },
        { field: "lastName", label: "นามสกุล" },
        { field: "isActive", label: "Active" }
      ]
    };
  },
  computed: {
    ...mapState("people", ["people"])
  },
  methods: {
    deletePerson() {
      this.$store.dispatch("people/deletePerson", this.selected );
    }
  }
};
</script>
