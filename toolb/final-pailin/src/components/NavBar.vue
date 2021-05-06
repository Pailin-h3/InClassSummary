<template>
  <div class="card-content">
    <b-navbar>
      <template slot="start">
        <b-navbar-item tag="router-link" :to="{ path: '/' }">Home</b-navbar-item>
        <b-navbar-item tag="router-link" :to="{ path: '/login' }">Login</b-navbar-item>
        <b-navbar-dropdown label="Mine Game">
          <b-navbar-item tag="router-link" :to="{ path: '/game' }">Game</b-navbar-item>
          <b-navbar-item tag="router-link" :to="{ path: '/game/easy' }">easy</b-navbar-item>
          <b-navbar-item tag="router-link" :to="{ path: '/game/normal' }">normal</b-navbar-item>
          <b-navbar-item tag="router-link" :to="{ path: '/game/hard' }">hard</b-navbar-item>
        </b-navbar-dropdown>
      </template>
      <template slot="end">
            <b-button type="is-primary" @click="reset">Log out</b-button>
        </template>
    </b-navbar>
    <p class="is-right">user name: {{this.latestName}}</p>
  </div>
</template>

<script>
import { mapGetters } from "vuex";
import firebase from "firebase/app";
import "firebase/auth";
export default {
  computed: {
    ...mapGetters("names", ["latestName"])
  },
  methods: {
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
  },
}
</script>