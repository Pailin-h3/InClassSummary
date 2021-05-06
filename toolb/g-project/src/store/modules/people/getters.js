export const getters = {
    activePeople: state => {
      return state.people.filter(people => people.isActive);
    }
  };
  