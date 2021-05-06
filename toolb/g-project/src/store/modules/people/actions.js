export const actions = {
  getPeople() {
  },
  addPerson(context, person){
    context.commit("addPerson", person);
  },
  deletePerson(context, person){
    context.commit("deletePerson", person);
  }
};
  