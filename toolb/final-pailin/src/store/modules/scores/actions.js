export const actions = {
    getScore(context) {
      //TODO get people from API
      context.commit("setScores", null);
    },
    addScore(context, Score){
      context.commit("addScore", Score);
    }
  };