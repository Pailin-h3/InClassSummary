<template>
  <div>
    <form class="form-inline">
      <label class="mb-2 mr-sm-2">เลขที่ประกาศ/ตำแหน่ง</label>
      <select class="form-control mb-2 mr-sm-2" v-model="info.jobName">
        <option v-for="item in jobList" :key="item.id" :value="item.chair">{{item.chair}}</option>
      </select>
    </form>
    <form class="form-inline">
        <label class="form-check-label mb-2 mr-sm-2">
        <input type="radio" class="form-check-input" name="korpor" v-model="info.korpor">ผ่าน ก.พ.
        </label>
        <label class="form-check-label mb-2 mr-sm-2">
        <input type="radio" class="form-check-input" name="korpor" v-model="info.korpor">ยังไม่ผ่าน ก.พ.
        </label>
    </form>
    <p>{{info}}</p>
  </div>
</template>

<script>
export default {
  data: function() {
    return {
        info: {
            jobName: "",
      korpor: false,
        },
      jobList: [
        { id: 0, chair: "เจ้าหน้าที่บริหารงานทั่วไป" },
        { id: 1, chair: "พนักงานรักษาความปลอดภัย" }
      ]
    };
  }
};
</script>