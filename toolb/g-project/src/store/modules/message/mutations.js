import Vue from "vue";

export const mutations = {
  setMessages(state, messages) {
      Vue.set(state, "messages", messages);
  },
  addMessage(state, message) {
    let messages = state.messages;
    messages.push(message);
    Vue.set(state, "messages", messages);
  },
//   deleteMessages(state, messages) {
//     let messages = state.messages;
//     messages.splice(
//       messages.findIndex(
//         item => {
//           return item.id == messages.id
//         }), 1);
//     Vue.set(state, "messages", messages);
//   }
};