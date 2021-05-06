<template>
    <div>
        <!-- <b-field>
            <b-button @click="easy">easy</b-button>
            <b-button @click="normal">normal</b-button>
            <b-button @click="hard">hard</b-button>
        </b-field> -->
        <nav-bar></nav-bar>
        <div class="columns is-multiline">
            <b-button 
                class="column is-1 state" 
                :key="poom.id" 
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
        for(var j=0;j<20;j++){
            this.bombPosition.push(Math.floor(Math.random()*83));
        }
        this.bombPosition.sort();
        // if(i===this.bombPosition.forEach()){
        //         this.pooms.push({id: i+1 , value: 'x' , showValue: false});
        // }
        for(var i=0;i<84;i++){
            this.pooms.push({id: i+1 , value: '0' , showValue: false});
        }
        this.bombPosition.forEach(b=>{
            this.pooms[b].value='x';
        })
        // this.pooms.sort();
    },
    components: {
        NavBar
    },
    data() {
        return {
            lev: "",
            level: [
                {id:1,width:8,hight:8,bomb:20},
                {id:2,width:10,hight:10,bomb:30},
                {id:3,width:12,hight:12,bomb:40}
            ],
            // pooms: [
            //     {id: 1 , value: "x" , showValue: false},
            //     {id: 2 , value: "2" , showValue: false},
            //     {id: 3 , value: "1" , showValue: false},
            //     {id: 4 , value: "2" , showValue: false},
            //     {id: 5 , value: "x" , showValue: false},
            //     {id: 6 , value: "1" , showValue: false},
            //     {id: 7 , value: "1" , showValue: false},
            //     {id: 8 , value: "1" , showValue: false},
            //     {id: 9 , value: "1" , showValue: false},
            // ]
            pooms: [],
            bombPosition: [],
        }
    },
    methods: {
            // easy() {
            //     this.level.id=1
            //     this.lev="easy"
            //     this.$buefy.notification.open('Level 1')
            // },
            // normal() {
            //     this.level.id=2
            //     this.lev="normal"
            //     this.$buefy.notification.open('Level 2')
            // },
            // hard() {
            //     this.level.id=3
            //     this.lev="hard"
            //     this.$buefy.notification.open('Level 3')
            // },
            step(poom) {
                poom.showValue=true
                if(poom.value==="x"){
                    this.pooms.forEach(poom => poom.showValue=true)
                    this.$buefy.notification.open('BOMBED!!')
                    return
                }
                // this.pooms.forEach(if(poom.showValue===true))
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