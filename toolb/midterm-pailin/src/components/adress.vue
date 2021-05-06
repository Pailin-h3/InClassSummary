<template>
  <div>
    <h5>สถานที่ติดต่อได้สะดวก</h5>
    <form class="form-inline">
      <label class="mb-2 mr-sm-2">บ้านเลขที่</label>
      <input v-model="info.houseNum" class="mb-2 mr-sm-2" />
      <label class="mb-2 mr-sm-2">หมู่ที่</label>
      <input v-model="info.moo" class="mb-2 mr-sm-2" />
      <label class="mb-2 mr-sm-2">ซอย</label>
      <input v-model="info.soi" class="mb-2 mr-sm-2" />
    </form>
    <form class="form-inline">
      <label class="mb-2 mr-sm-2">ถนน</label>
      <input v-model="info.road" class="mb-2 mr-sm-2" />
      <label class="mb-2 mr-sm-2">ตำบล/แขวง</label>
      <input v-model="info.tambon" class="mb-2 mr-sm-2" />
      <label class="mb-2 mr-sm-2">อำเภอ/เขต</label>
      <input v-model="info.aumpue" class="mb-2 mr-sm-2" />
    </form>
    <form class="form-inline">
      <label class="mb-2 mr-sm-2">จังหวัด</label>
      <input v-model="info.province" class="mb-2 mr-sm-2" />
      <label class="mb-2 mr-sm-2">รหัสไปรษณีย์</label>
      <input v-model="info.postCide" class="mb-2 mr-sm-2" />
      <label class="mb-2 mr-sm-2">โทรศัพท์</label>
      <input v-model="info.tel" class="mb-2 mr-sm-2" />
    </form>
    <form class="form-inline">
      <label class="mb-2 mr-sm-2">มือถือ</label>
      <input v-model="info.mobilephone" class="mb-2 mr-sm-2" />
      <label class="mb-2 mr-sm-2">Email</label>
      <input v-model="info.email" class="mb-2 mr-sm-2" />
      </form>
    <p>{{info}}</p>
  </div>
</template>

<script>
export default {
    data: function(){
        return {
            info: {
                houseNum: 0,
                moo: 0,
                soi: "",
                road: '',
                tambon: '',
                aumpue: '',
                province: '',
                postCode: '',
                tel:'',
                mobilephone:'',
                email: ''
            }
        }
    }
}
</script>