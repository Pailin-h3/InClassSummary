import Vue from "vue";
import Vuex from "vuex";
import { people } from "./modules/people";

Vue.use(Vuex);

export const store = new Vuex.Store({
  modules: {
    people,
  }
});