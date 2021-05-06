<template>
    <div class="card-content">
        <b-field label="ประวัติการแพ้ยา :">
            <b-radio
                @input="fireChanges"
                v-model="allergic"
                name="name"
                value="false"
            >ไม่เคยแพ้</b-radio>
            <b-radio
                @input="fireChanges"
                v-model="allergic"
                name="name"
                value="true"
            >เคยแพ้</b-radio>
        </b-field>
    </div>
</template>

<script>
export default {
    props: ["value"],
    data() {
        return {
            allergic: this.value.allergic
        };
    },
    methods: {
        fireChanges() {
            this.$emit("input", {
                allergic: this.allergic
            });
        }
    }
};
</script>