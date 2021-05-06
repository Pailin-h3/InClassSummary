import { getters } from "./getters";
import { actions } from "./actions";
import { mutations } from "./mutations";

const state = {
    names: [],
  status: null,
};

const namespaced = true;

export const names = {
  namespaced,
  state,
  getters,
  actions,
  mutations,
};
