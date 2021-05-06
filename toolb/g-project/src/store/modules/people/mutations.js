import Vue from "vue";

export const mutations = {
  setPeople(state, people) {
      Vue.set(state, "people", people);
  },
  addPerson(state, person) {
    let people = state.people;
    people.push(person);
    Vue.set(state, "people", people);
  },
  deletePerson(state, person) {
    let people = state.people;
    people.splice(
      people.findIndex(
        item => {
          return item.title == person.title
            && item.firstName == person.firstName
            && item.lastName == person.lastName;
        }), 1);
    Vue.set(state, "people", people);
  }
};