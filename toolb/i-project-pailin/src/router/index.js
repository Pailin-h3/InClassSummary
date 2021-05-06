import Vue from "vue";
import VueRouter from "vue-router";


// import { store } from "../store";

import Minesweeper from "../components/game/Minesweeper.vue";
import Measy from "../components/game/Measy";
import Mnormal from "../components/game/Mnormal";
import Mhard from "../components/game/Mhard.vue";
import MainPage from "../components/MainPage.vue";

Vue.use(VueRouter);

const routeList = [
  {
    path: "/",
    component: MainPage,
  },
  {
    path: "/test",
    component: Minesweeper,
  },
  {
    path: "/easy",
    component: Measy,
  },
  {
    path: "/normal",
    component: Mnormal,
  },
  {
    path: "/hard",
    component: Mhard,
  }
];

export const router = new VueRouter({
  routes: routeList,
});
