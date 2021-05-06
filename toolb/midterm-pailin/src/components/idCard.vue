<template>
    <div>
        <form class="form-inline">
            <label class="mb-2 mr-sm-2">เลขที่บัตรประชาชน</label>
            <input v-model="cardId" class="mb-2 mr-sm-2">
            <button class="btn btn-primary mb-2">ตกลง</button>
        </form>
        <p>{{cardId}}</p>
    </div>
</template>

<script>
export default {
    data: function(){
        return {
            cardId: ""
        }
    }
}
</script>