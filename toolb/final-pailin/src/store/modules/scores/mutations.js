import Vue from "vue";

export const mutations = {
  setScores(state, Scores) {
      Vue.set(state, "scores", Scores);
  },
  addscore(state, score) {
    let scores = state.scores;
    scores.push(score);
    Vue.set(state, "scores", scores);
  }
};