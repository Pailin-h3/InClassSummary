<template>
    <div>
        <nav-bar></nav-bar>
        <div class="columns">
            <p class="column">This is your luck : {{count}}</p>
            <b-button tag="router-link" to="/game" type="is-link">restart</b-button>
        </div>
        <div class="columns is-multiline">
            <b-button 
                class="column is-1 state" 
                :key="poom.id" 
                :disabled="boom || poom.showValue"
                v-for="poom in pooms"
                @click="step(poom)">
                    <p v-show="poom.showValue">{{ poom.value }}</p>
                </b-button>
        </div> 
    </div>
</template>

<script>
import NavBar from "../NavBar.vue";
export default {
    mounted(){
        for(var j=0;j<40;j++){
            this.bombPosition.push(Math.floor(Math.random()*83));
        }
        this.bombPosition.sort();
        for(var i=0;i<84;i++){
            this.pooms.push({id: i+1 , value: '0' , showValue: false});
        }
        this.bombPosition.forEach(b=>{
            this.pooms[b].value='x';
        })
    },
    components: {
        NavBar
    },
    data() {
        return {
            pooms: [],
            bombPosition: [],
            count: 0,
            boom: false,
        }
    },
    methods: {
        step(poom) {
            poom.showValue=true
            this.count=this.count+1
            if(poom.value==="x"){
                this.pooms.forEach(poom => poom.showValue=true)
                this.boom = true
                this.alert();
                this.$store.dispatch("scores/addScore", {
                    score: this.count,
                    level: "normal",
                });
            }
        },
        alert() {
            this.$buefy.dialog.confirm({
                title: 'Opps',
                message: 'Better luck next time',
                cancelText: 'Home',
                confirmText: 'Try Again',
                onCancel: () => this.$buefy.toast.open("Back home"),
                onConfirm: () => this.$buefy.toast.open("Restart"),
            })
        },
    }
}
</script>

<style scoped>
    .state {
        
        color: black;
        background-color: darkgray;
    }
</style>