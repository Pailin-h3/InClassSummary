<template>
  <div class="card-content">
    <b-field grouped>
      <b-field label="คำนำหน้า">
        <b-select @input="fireChanges" v-model="profile.title" placeholder="คำนำหน้า" rounded>
          <option>นาย</option>
          <option>นาง</option>
          <option>นางสาว</option>
        </b-select>
      </b-field>
      <b-field label="ชื่อ" expanded>
        <b-input @input="fireChanges" v-model="profile.firstName" placeholder="ชื่อ" rounded></b-input>
      </b-field>
      <b-field label="นามสกุล" expanded>
        <b-input @input="fireChanges" v-model="profile.lastName" placeholder="นามสกุล" rounded></b-input>
      </b-field>
    </b-field>
  </div>
</template>
<script>
export default {
  props: ["value"],
  data() {
    return {
      profile: {
        title: this.value.title,
        firstName: this.value.firstName,
        lastName: this.value.lastName
      }
    };
  },
  methods: {
    fireChanges() {
      this.$emit("input", {
        title: this.profile.title,
        firstName: this.profile.firstName,
        lastName: this.profile.lastName
      });
    }
  },
};
</script>