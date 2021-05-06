<template>
  <div>
    <div class="card-content">
      <h1>ผู้ติดต่อได้กรณีฉุกเฉิน</h1>
      <b-field>
        <b-field label="คำนำหน้า">
          <b-select placeholder="คำนำหน้า" @input="firechanges" v-model="parentInfo.callAs">
            <option value="นาย">นาย</option>
            <option value="นาง">นาง</option>
            <option value="นางสาว">นางสาว</option>
            <option value="เด็กชาย">เด็กชาย</option>
            <option value="เด็กหญิง">เด็กหญิง</option>
          </b-select>
        </b-field>
        <b-field label="ชื่อ">
          <b-input v-model="parentInfo.firstName" @input="firechanges"></b-input>
        </b-field>
        <b-field label="นามสกุล">
          <b-input @input="firechanges" v-model="parentInfo.lastName"></b-input>
        </b-field>
      </b-field>
      <b-checkbox>ใช้ที่อยู่เดียวกับผู้ป่วย</b-checkbox>
      <b-field>
        <b-field label="บ้านเลขที่">
          <b-input @input="firechanges" v-model="parentInfo.houseNum"></b-input>
        </b-field>
        <b-field label="หมู่">
          <b-input v-model="parentInfo.moo" @input="firechanges"></b-input>
        </b-field>
      </b-field>
      <b-field>
        <b-field label="ตำบล">
          <b-select v-model="parentInfo.tambon" @input="firechanges">
            <option
              v-for="item in carrerLabel"
              :value="item.select"
              :key="item.id"
            >{{ item.select }}</option>
          </b-select>
        </b-field>
        <b-field label="อำเภอ">
          <b-select @input="firechanges" v-model="parentInfo.aumpue">
            <option v-for="item in carrerLabel" :value="item.val" :key="item.id">{{ item.select }}</option>
          </b-select>
        </b-field>
        <b-field label="จังหวัด">
          <b-select @input="firechanges" v-model="parentInfo.province">
            <option v-for="item in provinceLabel" :value="item.val" :key="item.id">{{ item.select }}</option>
          </b-select>
        </b-field>
      </b-field>
      <b-field>
        <b-field label="โทรศัพท์">
          <b-input @input="firechanges" v-model="parentInfo.phoneNum"></b-input>
        </b-field>
        <b-field label="อีเมลล์">
          <b-input v-model="parentInfo.email" @input="firechanges"></b-input>
        </b-field>
      </b-field>
      <b-field label="ผู้ติดต่อได้เกี่ยวข้องเป็น :">
        <b-field>
          <b-radio
            v-for="item in ralationLabel"
            :key="item.id"
            :v-model="parentInfo.relation"
            :name="name"
            :native-value="item.select"
            @input="firechanges"
          >{{ item.select }}</b-radio>
          <!-- <b-radio v-model="parentInfo.relation"
                name="name"
                native-value="Flint">
                Flint
            </b-radio>
            <b-radio v-model="parentInfo.relation"
                name="name"
                native-value="Silver">
                Silver
            </b-radio>
            <b-radio v-model="parentInfo.relation"
                name="name"
                native-value="Jack">
                Jack
            </b-radio>
            <b-radio v-model="parentInfo.relation"
                name="name"
                native-value="Vane">
                Vane
          </b-radio>-->
        </b-field>
      </b-field>
    </div>
  </div>
</template>

<script>
export default {
  props: ["value"],
  data: function() {
    return {
      parentInfo: {
        callAs: this.value.callAs,
        firstName: this.value.firstName,
        lastName: this.value.lastName,
        houseNum: this.value.houseNum,
        province: this.value.province,
        tambon: this.value.tambon,
        aunpue: this.value.aumpue,
        phoneNum: this.value.phoneNum,
        email: this.value.email,
        relation: this.value.relation
      },
      relationLabel: [
        { id: "0", select: "พ่อ" },
        { id: "1", select: "แม่" },
        { id: "2", select: "พี่" },
        { id: "3", select: "น้อง" },
        { id: "4", select: "นายจ้าง" }
      ],
      provinceLabel: [
        { id: "0", select: "กรุงเทพ", val: "aumpueOfBkk" },
        { id: "1", select: "มุกดาหาร", val: "aumpueOfMuk" }
      ],
      aumpueOfBkk: [
        { id: "0", select: "อำเภอ1", val: "tambonOfAo" },
        { id: "1", select: "อำเภอ2", val: "tambonOfAt" }
      ],
      aumpueOfMuk: [
        { id: "0", select: "คำชะอี", val: "tambonOfKam" },
        { id: "1", select: "เมือง", val: "tambonOfMuk" }
      ],
      tambonOfAo: [{ id: "0", select: "กทม11" }, { id: "1", select: "กทม12" }],
      tambonOfAt: [{ id: "0", select: "กทม21" }, { id: "1", select: "กทม22" }],
      tambonOfKam: [
        { id: "0", select: "คำชะอี1" },
        { id: "1", select: "คำชะอี2" }
      ],
      tambonOfMuk: [{ id: "0", select: "มุก1" }, { id: "1", select: "มุก2" }]
    };
  },
  methods: {
    firechanges() {
      this.$emit("input", {
        callAs: this.parentInfo.callAs,
        firstName: this.parentInfo.firstName,
        lastName: this.parentInfo.lastName,
        houseNum: this.parentInfo.houseNum,
        province: this.parentInfo.province,
        tambon: this.parentInfo.tambon,
        aunpue: this.parentInfo.aumpue,
        phoneNum: this.parentInfo.phoneNum,
        email: this.parentInfo.email,
        relation: this.parentInfo.relation,
      })
    }
  }
};
</script>