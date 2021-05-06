<template>
  <div>
    <h5>ข้อมูลบิดา</h5>
    <form class="form-inline">
      <label class="mb-2 mr-sm-2">ชื่อ-นามสกุล</label>
      <input v-model="info.dadName" class="mb-2 mr-sm-2" />
      <label class="mb-2 mr-sm-2">อาชีพ</label>
      <input v-model="info.dadCarrer" class="mb-2 mr-sm-2" />
    </form>
    <h5>ข้อมูลมารดา<h5>
    <form class="form-inline">
      <label class="mb-2 mr-sm-2">ชื่อ-นามสกุล</label>
      <input v-model="info.momName" class="mb-2 mr-sm-2" />
      <label class="mb-2 mr-sm-2">อาชีพ</label>
      <input v-model="info.momCarrer" class="mb-2 mr-sm-2" />
    </form>
    <form class="form-inline">
      <label class="mb-2 mr-sm-2">สถานภาพ</label>
    </form>
    <p>{{info}}</p>
  </div>
</template>

<script>
export default {
    data: function(){
        return {
            info: {
                dadName: '',
                momName: '',
                dadCarrer: '',
                momCarrer: ''
            }
        }
    }
}
</script>