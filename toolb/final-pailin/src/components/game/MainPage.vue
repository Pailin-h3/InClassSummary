<template>
    <div class="card card-content">
        <img src="https://dejpknyizje2n.cloudfront.net/svgcustom/clipart/preview/boom-graphic-comic-sticker-31105-300x300.png" class="center">
        <h1 class="head">Welcome to Bombed Field</h1>
        <nav-bar></nav-bar>
        <p>Live Score</p>
        <b-table class="primary" :data="scores" :columns="columns"></b-table>
    </div>
</template>

<script>
import NavBar from "../NavBar.vue";
import { mapState } from "vuex";
export default {
    components: {
        NavBar,
    },
    data(){
        return{
            columns: [
                { field: "level", label: "level" },
                { field: "score", label: "score" },
            ],
        }
    },
    computed: {
        ...mapState("scores", ["scores"])
    }
}
</script>

<style scoped>
    .head {
        font-size: 40px;
        font-family: "Times New Roman", Times, serif;
        font-weight: bold;
        text-align: center;
        color: rgb(99, 38, 38);
        text-shadow: 1px 1px rgb(255, 73, 73);
    }
    .center {
        display: block;
        margin-left: auto;
        margin-right: auto;
    }
</style>