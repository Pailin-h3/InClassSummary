import Vue from "vue";
import Vuex from "vuex";
import { scores } from "./modules/scores";

Vue.use(Vuex);

export const store = new Vuex.Store({
  modules: {
    scores,
  }
});