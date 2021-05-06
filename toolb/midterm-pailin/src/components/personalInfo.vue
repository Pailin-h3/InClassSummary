<template>
  <div>
    <form class="form-inline">
      <label>
        คำนำหน้า
        <!-- <input v-for="item in reakList"
                type="radio"
                v-bind:key="item.id"
                v-bind:value="item.reak"
                v-bind:name="reak"
        v-bind:v-model="info.reak">{{item.reak}}-->
      </label>
    </form>
    <form class="form-inline">
      <label class="mb-2 mr-sm-2">ชื่อ</label>
      <input v-model="info.firstName" class="mb-2 mr-sm-2" />
      <label class="mb-2 mr-sm-2">นามสกุล</label>
      <input v-model="info.lastName" class="mb-2 mr-sm-2" />
    </form>
    <form class="form-inline">
      <label class="mb-2 mr-sm-2">เชื้อชาติ</label>
      <input v-model="info.chuechart" class="mb-2 mr-sm-2" />
      <label class="mb-2 mr-sm-2">สัญชาติ</label>
      <input v-model="info.sanchart" class="mb-2 mr-sm-2" />
    </form>
    <form class="form-inline">
      <label class="mb-2 mr-sm-2">ศาสนา</label>
      <input v-model="info.religiant" class="mb-2 mr-sm-2" />
      <label class="mb-2 mr-sm-2">
        ส่วนสูง
        <input v-model="info.hight" class="mb-2 mr-sm-2" />ซม.
      </label>
      <label class="mb-2 mr-sm-2">
        น้ำหนัก
        <input v-model="info.hight" class="mb-2 mr-sm-2" />ก.ก.
      </label>
    </form>
    <form class="form-inline">
      <label class="mb-2 mr-sm-2">วัน/เดือน/ปี เกิด</label>
      <select v-model="info.bday" id="bday" class="form-control">
        <option v-for="day in dayList" v-bind:key="day" v-bind:value="day">{{ day }}</option>
      </select>/
      <select v-model="info.bmonth" id="bmonth" class="form-control">
        <option v-for="month in monthList" v-bind:key="month" v-bind:value="month">{{ month }}</option>
      </select>/
      <select v-model="info.byear" id="byear" class="form-control">
        <option v-for="year in yearList" v-bind:key="year" v-bind:value="year">{{ year }}</option>
      </select>
      <label class="mb-2 mr-sm-2">อายุ
      <input v-model="info.sanchart" class="mb-2 mr-sm-2" />ปี</label>
    </form>
    <p>{{info}}</p>
  </div>
</template>

<script>
export default {
  data: function() {
    return {
      info: {
        reak: "",
        firstName: "",
        lastName: "",
        chuechart: "",
        sanchart: "",
        religiant: "",
        hight: 0,
        weight: 0,
        bday: 0,
        bmonth: 0,
        byear: 0
      },
      reakList: [
        { id: 0, reak: "นาย" },
        { id: 1, reak: "นาง" },
        { id: 2, reak: "นางสาว" },
        { id: 3, reak: "อื่นๆ" }
      ],
      maxDay: 32,
      maxMonth: 13,
      maxYear: 2019,
    };
  },
  computed: {
    dayList: function() {
        return Array(this.maxDay)
                .fill(null).map( (x,i) => i )
                .filter( (x) => x > 0);
    },
    monthList: function() {
        return Array(this.maxMonth)
                .fill(null).map( (x,i) => i )
                .filter( (x) => x > 0);
    },
    yearList: function() {
        return Array(this.maxyear)
                .fill(null).map( (x,i) => i )
                .filter( (x) => x > 1900);
    }
  }
};
</script>