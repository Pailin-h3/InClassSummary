<template>
  <div class="card-content">
    <b-field grouped>
      <b-field label="คำนำหน้า">
        <b-select v-model="person.title" placeholder="คำนำหน้า" rounded>
          <option>นาย</option>
          <option>นาง</option>
          <option>นางสาว</option>
        </b-select>
      </b-field>
      <b-field label="ชื่อ" expanded>
        <b-input v-model="person.firstName" placeholder="ชื่อ" rounded></b-input>
      </b-field>
      <b-field label="นามสกุล" expanded>
        <b-input v-model="person.lastName" placeholder="นามสกุล" rounded></b-input>
      </b-field>
    </b-field>
    <b-field class="buttons" grouped>
      <b-field>
        <b-checkbox v-model="person.isActive">Active</b-checkbox>
      </b-field>
      <b-field>
        <b-button @click="savePerson" type="is-primary">Save</b-button>
      </b-field>
    </b-field>
  </div>
</template>
<script>
export default {
  data() {
    return {
      person: {
        title: "",
        firstName: "",
        lastName: "",
        isActive: false,
      }
    };
  },
  methods: {
    savePerson() {
      this.$store.dispatch("people/addPerson", {
        title: this.person.title,
        firstName: this.person.firstName,
        lastName: this.person.lastName,
        isActive: this.person.isActive,
      });
    }
  }
};
</script>
