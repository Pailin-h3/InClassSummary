export const actions = {
    getMessages() {
    },
    addMessage(context, message){
      context.commit("addMessage", message);
    },
    // deleteMessages(context, messages){
    //   context.commit("deletemessages", messages);
    // }
  };