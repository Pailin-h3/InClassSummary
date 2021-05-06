import Vue from "vue";

export const mutations = {
  setMassage(state, names) {
      Vue.set(state, "names", names);
  },
  addMessage(state, name) {
    let names = state.names;
    names.push(name);
    Vue.set(state, "names", names);
  }
};