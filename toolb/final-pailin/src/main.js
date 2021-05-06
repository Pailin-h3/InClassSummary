import Vue from 'vue'
import App from './App.vue'

import { store } from "./store";
import { router } from "./router";

import "./plugins/buefy-vue";
import "./plugins/vuelidate";
import "./plugins/firebase";

Vue.config.productionTip = false

new Vue({
  render: h => h(App),
  store,
  router
}).$mount('#app')
