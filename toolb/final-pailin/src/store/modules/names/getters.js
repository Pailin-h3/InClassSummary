export const getters = {
    latestName: state => {
      if (state.names.length>0){
          return state.names[state.names.length-1]
      }
      return "No User"
    }
  };