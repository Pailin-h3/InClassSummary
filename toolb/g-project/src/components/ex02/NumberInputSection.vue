<template>
  <div class="card-content">
    <b-field>
      <b-numberinput @input="fireChanges" v-model="number" min="0" max="100"></b-numberinput>
    </b-field>
  </div>
</template>
<script>
import { EventBus } from "../../plugins/event-bus.js";

export default {
  data() {
    return {
      number: 0
    };
  },
  methods: {
    fireChanges() {
      EventBus.$emit("user-change-number", this.number);
    }
  }
};
</script>
