import Vue from "vue";
import VueRouter from "vue-router";

import Ex01Page from "../components/ex01/Ex01Page.vue";
import Ex02Page from "../components/ex02/Ex02Page.vue";
import Ex03Page from "../components/ex03/Ex03Page.vue";
import Ex04Page from "../components/ex04/Ex04Page.vue";
import LoginPage from "../components/LoginPage.vue";

import firebase from "firebase/app";
import "firebase/auth";


Vue.use(VueRouter);

const routeList = [
  {
    path: "/",
    component: LoginPage,
  },
  {
    path: "/ex01",
    component: Ex01Page,
  },
  {
    path: "/ex02",
    component: Ex02Page,
  },
  {
    path: "/ex03",
    component: Ex03Page,
  },
  {
    path: "/ex04",
    component: Ex04Page,
  }
];

export const router = new VueRouter({
  routes: routeList,
});

router.beforeEach((to, from, next) => {
  firebase.auth().onAuthStateChanged(function(user) {
    if (!user) {
      next("/");
    }
  });

  next();
});