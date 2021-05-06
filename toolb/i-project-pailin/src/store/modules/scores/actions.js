export const actions = {
    getScore(context) {
      //TODO get people from API
      context.commit("setScore", null);
    },
    addScore(context, Score){
      context.commit("addScore", Score);
    }
  };