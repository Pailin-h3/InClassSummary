<template>
  <div class="card-content">
    <nav-bar></nav-bar>
    <b-field label="Username" expanded>
      <b-input v-model="form.username" maxlength="30" expanded></b-input>
    </b-field>
    <b-field label="Password" expanded>
      <b-input type="password" v-model="form.password" maxlength="16" password-reveal></b-input>
    </b-field>
    <b-field v-if="$v.form.$dirty && $v.form.$invalid">
      <b-message type="is-danger" has-icon v-if="!$v.form.username.required">กรุณาใส่ชื่อผู้ใช้</b-message>
      <b-message type="is-danger" has-icon v-if="!$v.form.username.email">ชื่อผู้ใช้ต้องเป็นอีเมล</b-message>
      <b-message type="is-danger" has-icon v-if="!$v.form.password.required">กรุณาใส่รหัสผ่าน</b-message>
      <b-message
        type="is-danger"
        has-icon
        v-if="!$v.form.password.minLength"
      >รหัสผ่านต้องอยู่ระหว่าง 8-16 ตัวอักษร</b-message>
    </b-field>
    <b-field class="buttons" grouped>
      <b-button type="is-primary" @click="touch">Login</b-button>
      <b-button type="is-primary" @click="reset">Reset</b-button>
    </b-field>
    <p>Dirty : {{ $v.form.$dirty }}</p>
    <p>Invalid : {{ $v.form.$invalid }}</p>
    <p>Require username: {{ $v.form.username.required }}</p>
    <p>User name between 8-30: {{ $v.form.username.email }}</p>
    <p>Require password: {{ $v.form.password.required }}</p>
    <p>Password between 4-16: {{ $v.form.password.minLength }}</p>
    <p>Login result : {{ this.latestMessage }}</p>
  </div>
</template>
<script>
import NavBar from "./NavBar.vue";

import { required, minLength, email } from "vuelidate/lib/validators";
import firebase from "firebase/app";
import "firebase/auth";
// import { mapGetters } from "vuex";

export default {
  components: {
    NavBar
  },
  data() {
    return {
      form: {
        username: "",
        password: ""
      },
      loginResult: {}
    };
  },
  validations: {
    form: {
      username: {
        required,
        email
      },
      password: {
        required,
        minLength: minLength(8)
      }
    }
  },
  methods: {
    touch() {
      this.$v.form.$touch();
      if (this.$v.form.$invalid) {
        return;
      }
      firebase
        .auth()
        .signInWithEmailAndPassword(this.form.username, this.form.password)
        .then(data => {
          this.loginResult = data.user;
          //   this.$store.dispatch("messages/addMessage","Logged In");
          this.$store.dispatch("names/addName", this.form.username);
          this.$router.push("/");
        })

        .catch(error => {
          this.loginResult = error;
        });
    },
    reset() {
      this.$v.form.$reset();
      firebase
        .auth()
        .signOut()
        .then(data => {
          this.loginResult = data;
          this.$buefy.dialog.alert({
            type: "is-primary",
            title: "logout",
            message: "logged out",
            confirmText: "close",
            onConfirm: this.goToBottom
          });
          //   this.$store.dispatch("messages/addMessage","Logged Out");
        })
        .catch(error => {
          this.loginResult = error;
        });
    }
    // computed: {
    //   ...mapGetters("messages", ["latestMessage"])
    // }
  }
};
</script>
