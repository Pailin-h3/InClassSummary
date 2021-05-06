import Vue from "vue";
import VueRouter from "vue-router";

import firebase from "firebase/app";
import "firebase/auth";
// import { store } from "../store";

import Measy from "../components/game/Measy";
import Mnormal from "../components/game/Mnormal";
import Mhard from "../components/game/Mhard.vue";
import MainPage from "../components/game/MainPage.vue";
import LoginPage from "../components/LoginPage.vue";
import Home from "../components/Home.vue";

Vue.use(VueRouter);

const routeList = [
  {
    path: "/",
    component: Home
  },
  {
    path: "/login",
    component: LoginPage
  },
  {
    path: "/game",
    component: MainPage
  },
  {
    path: "/game/easy",
    component: Measy
  },
  {
    path: "/game/normal",
    component: Mnormal
  },
  {
    path: "/game/hard",
    component: Mhard
  }
];

export const router = new VueRouter({
  routes: routeList
});

router.beforeEach((to, from, next) => {
  firebase.auth().onAuthStateChanged(function(user) {
    if (!user) {
      this.$buefy.dialog.confirm({
        title: "Login First",
        confirmText: "OK",
      });
      next("/login");
    }
  });

  next();
});
