import Vue from "vue";
const state = {
  scores: [],
  status: null,
};

const namespaced = true;

const actions = {
  getScore(context) {
    //TODO get people from API
    context.commit("setScore", null);
  },
  addScore(context, Score){
    context.commit("addScore", Score);
  }
};


const mutations = {
  setScores(state, Scores) {
      Vue.set(state, "scores", Scores);
  },
  addScore(state, score) {
    let scores = state.scores;
    scores.push(score);
    Vue.set(state, "scores", scores);
  }
};

const getters = {
  activePeople: state => {
    return state.scores;
  }
};


export const scores = {
  namespaced,
  state,
  getters,
  actions,
  mutations,
};