<template>
    <div class="card-content">
        <b-button type="is-info" click>ลงทะเบียน</b-button>
        <p style="is-danger">กรุณาติ๊กยอมรับเงื่อนไข ก่อนกดปุ่ม 'ลงทะเบียน'</p>
    </div>
</template>

<script>
export default {
    data: function(){
        return {
            submit: false
        }
    }
}
</script>