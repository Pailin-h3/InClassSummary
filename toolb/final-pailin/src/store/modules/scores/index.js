import { getters } from "./getters";
import { actions } from "./actions";
import { mutations } from "./mutations";

const state = {
  scores: [],
  status: null,
};

const namespaced = true;

export const scores = {
  namespaced,
  state,
  getters,
  actions,
  mutations,
};