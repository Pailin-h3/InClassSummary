<template>
  <div>
    <div class="card-content">
      <b-field label="เลขบัตรประจำตัวประชาชน :">
        <b-input @input="fireChanges" v-model="patientInfo.cardId" maxlength="13"></b-input>
      </b-field>
      <b-field>
        <b-field label="คำนำหน้า">
          <b-select @input="fireChanges" placeholder="คำนำหน้า" v-model="patientInfo.callAs">
            <option value="นาย">นาย</option>
            <option value="นาง">นาง</option>
            <option value="นางสาว">นางสาว</option>
            <option value="เด็กชาย">เด็กชาย</option>
            <option value="เด็กหญิง">เด็กหญิง</option>
          </b-select>
        </b-field>
        <b-field label="ชื่อ">
          <b-input @input="fireChanges" v-model="patientInfo.firstName"></b-input>
        </b-field>
        <b-field label="นามสกุล">
          <b-input @input="fireChanges" v-model="patientInfo.lastName"></b-input>
        </b-field>
      </b-field>
      <b-field>
        <b-field label="วันเกิด">
          <b-datepicker
            @input="fireChanges"
            placeholder="select a date..."
            icon="calendar-today"
            v-model="patientInfo.birthDay"
          ></b-datepicker>
        </b-field>
        <b-field label="ศาสนา">
            <b-select @input="fireChanges" v-model="patientInfo.religion">
                <option 
                    v-for="item in religionAll"
                    :value="item.religionSelect"
                    :key="item.id">
                    {{ item.religionSelect }}
                </option>
            </b-select>
        </b-field>
      </b-field>
      <b-field>
        <b-field label="เชื้อชาติ">
            <b-select @input="fireChanges" v-model="patientInfo.nationality">
                <option 
                    v-for="item in nationalityLabel"
                    :value="item.select"
                    :key="item.id">
                    {{ item.select }}
                </option>
            </b-select>
        </b-field>
        <b-field label="สัญชาติ">
            <b-select @input="fireChanges" v-model="patientInfo.origin">
                <option 
                    v-for="item in originLabel"
                    :value="item.select"
                    :key="item.id">
                    {{ item.select }}
                </option>
            </b-select>
        </b-field>
      </b-field>
      <b-field>
        <b-field label="เพศ :">
          <b-radio @input="fireChanges" v-model="patientInfo.gender"
                name="gender"
                native-value="ชาย">
                ชาย
          </b-radio>
          <b-radio @input="fireChanges" v-model="patientInfo.gender"
                name="gender"
                native-value="หญิง">
                หญิง
          </b-radio>
        </b-field>
        <b-field label="อาชีพ">
          <b-select @input="fireChanges" v-model="patientInfo.carrer">
                <option 
                    v-for="item in carrerLabel"
                    :value="item.select"
                    :key="item.id">
                    {{ item.select }}
                </option>
            </b-select>
        </b-field>
      </b-field>
      <b-field>
        <b-field label="สถานภาพ :">
          <b-radio @input="fireChanges" v-model="patientInfo.status"
                name="name"
                native-value="โสด">
                โสด
          </b-radio>
          <b-radio @input="fireChanges" v-model="patientInfo.status"
                name="name"
                native-value="แต่งงานแล้ว">
                แต่งงานแล้ว
          </b-radio>
        </b-field>
      </b-field>
      <b-field>
        <b-field label="อาการเบื้องต้น">
            <b-input maxlength="200" type="textarea" @input="fireChanges" v-model="patientInfo.symtoms"></b-input>
        </b-field>
      </b-field>
      <b-field>
        <b-field label="บ้านเลขที่">
          <b-input @input="fireChanges" v-model="patientInfo.houseNum"></b-input>
        </b-field>
        <b-field label="หมู่">
          <b-input @input="fireChanges" v-model="patientInfo.moo"></b-input>
        </b-field>
      </b-field>
      <b-field>
        <b-field label="ตำบล">
          <b-select @input="fireChanges" v-model="patientInfo.tambon">
                <option 
                    v-for="item in carrerLabel"
                    :value="item.select"
                    :key="item.id">
                    {{ item.select }}
                </option>
            </b-select>
        </b-field>
        <b-field label="อำเภอ">
          <b-select @input="fireChanges" v-model="patientInfo.aumpue">
                <option 
                    v-for="item in carrerLabel"
                    :value="item.val"
                    :key="item.id">
                    {{ item.select }}
                </option>
            </b-select>
        </b-field>
        <b-field label="จังหวัด">
          <b-select @input="fireChanges" v-model="patientInfo.province">
                <option 
                    v-for="item in provinceLabel"
                    :value="item.val"
                    :key="item.id">
                    {{ item.select }}
                </option>
            </b-select>
        </b-field>
      </b-field>
      <b-field>
        <b-field label="เบอร์โทรศัพท์">
          <b-input @input="fireChanges" v-model="phone"></b-input>
        </b-field>
        <b-field label="e-mail">
          <b-input @input="fireChanges" v-model="email"></b-input>
        </b-field>
      </b-field>
      <b-field>
        <b-field label="ชื่อบิดา">
          <b-input @input="fireChanges" v-model="patientInfo.dadFirstName"></b-input>
        </b-field>
        <b-field label="นามสกุลบิดา">
          <b-input @input="fireChanges" v-model="patientInfo.momLastName"></b-input>
        </b-field>
      </b-field>
      <b-field>
        <b-field label="ชื่อมารดา">
          <b-input @input="fireChanges" v-model="patientInfo.momFirstName"></b-input>
        </b-field>
        <b-field label="นามสกุลมารดา">
          <b-input @input="fireChanges" v-model="patientInfo.momLastName"></b-input>
        </b-field>
      </b-field>
      <!-- <b-field v-if="$v.patientInfo.$dirty && $v.patientInfo.$invalid">
        <b-message type="is-danger" has-icon v-if="!$v.patientInfo.cardId.required">กรุณาใส่ไอดี</b-message>
        <b-message
          type="is-danger"
          has-icon
          v-if="!$v.patientInfo.cardId.numeric"
        >ไอดีต้องเป็นตัวเลขเท่านั้น</b-message>
        <b-message type="is-danger" has-icon >ERROR</b-message>
        <b-message type="is-danger" has-icon v-if="!$v.form.password.required">กรุณาใส่รหัสผ่าน</b-message>
        <b-message
          type="is-danger"
          has-icon
          v-if="!$v.form.password.minLength"
        >รหัสผ่านต้องอยู่ระหว่าง 4-16 ตัวอักษร</b-message>
      </b-field>
      <b-field class="buttons" grouped>
        <b-button type="is-primary" @click="touch">Login</b-button>
        <b-button type="is-primary" @click="reset">Reset</b-button>
      </b-field>
      <p>Dirty : {{ $v.form.$dirty }}</p>
      <p>Invalid : {{ $v.form.$invalid }}</p>
      <p>Require username: {{ $v.form.username.required }}</p>
      <p>User name between 8-30: {{ $v.form.username.email }}</p>
      <p>Require password: {{ $v.form.password.required }}</p>
      <p>Password between 4-16: {{ $v.form.password.minLength }}</p> -->
    </div>
  </div>
</template>

<script>
// import { required , numeric , email } from "vuelidate/lib/validators";
export default {
  props: ["value"],
  data() {
    return {
      patientInfo: {
        cardId: this.value.cardId,
        callAs: this.value.callAs,
        firstName: this.value.firstName,
        lastName: this.value.lastName,
        birthDay: this.value.birthDay,
        religion: this.value.religion,
        nationality: this.value.nationality,
        origin: this.value.origin,
        gender: this.value.gender,
        status: this.value.status,
        carrer: this.value.carrer,
        symtoms: this.value.symtoms,
        houseNum: this.value.houseNum,
        moo: this.value.moo,
        tambon: this.value.tambon,
        aumpue: this.value.aumpue,
        province: this.value.province,
        phone: this.value.phone,
        email: this.value.email,
        dadFirstName: this.value.dadFirstName,
        dadLastName: this.value.dadLastName,
        momFirstName: this.value.momFirstName,
        momLastName: this.value.momLastName,
      },
      hasError: this.value.hasError,
      religionAll: [
        {id:"0",religionSelect:"พุธ"},
        {id:"1",religionSelect:"คริส"},
        {id:"2",religionSelect:"อิสลาม"}
      ],
      nationalityLabel: [
        {id:"0",select:"ไทย"},
        {id:"1",select:"อินเดีย"},
        {id:"2",select:"ปากีสถาน"},
        {id:"3",select:"จีน"},
      ],
      originLabel: [
        {id:"0",select:"ไทย"},
        {id:"1",select:"อินเดีย"},
        {id:"2",select:"ปากีสถาน"},
        {id:"3",select:"จีน"},
      ],
      carrerLabel: [
        {id:"0",select:"นักษึกษา"},
        {id:"1",select:"ข้าราชการ"},
        {id:"2",select:"ธุรกิจส่วนตัว"},
        {id:"3",select:"พนักงานบริษัท"},
      ],
      provinceLabel: [
        {id:"0",select:"กรุงเทพ",val:"aumpueOfBkk"},
        {id:"1",select:"มุกดาหาร",val:"aumpueOfMuk"},
      ],
      aumpueOfBkk: [
        {id:"0",select:"อำเภอ1",val:"tambonOfAo"},
        {id:"1",select:"อำเภอ2",val:"tambonOfAt"},
      ],
      aumpueOfMuk: [
        {id:"0",select:"คำชะอี",val:"tambonOfKam"},
        {id:"1",select:"เมือง",val:"tambonOfMuk"},
      ],
      tambonOfAo: [
        {id:"0",select:"กทม11"},
        {id:"1",select:"กทม12"},
      ],
      tambonOfAt: [
        {id:"0",select:"กทม21"},
        {id:"1",select:"กทม22"},
      ],
      tambonOfKam: [
        {id:"0",select:"คำชะอี1"},
        {id:"1",select:"คำชะอี2"},
      ],
      tambonOfMuk: [
        {id:"0",select:"มุก1"},
        {id:"1",select:"มุก2"},
      ],
    };
  },
  methods: {
    fireChanges() {
      this.$emit("input", {
        cardId: this.patientInfo.cardId,
        callAs: this.patientInfo.callAs,
        firstName: this.patientInfo.firstName,
        lastName: this.patientInfo.lastName,
        birthDay: this.patientInfo.birthDay,
        religion: this.patientInfo.religion,
        nationality: this.patientInfo.nationality,
        origin: this.patientInfo.origin,
        gender: this.patientInfo.gender,
        status: this.patientInfo.status,
        carrer: this.patientInfo.carrer,
        symtoms: this.patientInfo.symtoms,
        houseNum: this.patientInfo.houseNum,
        moo: this.patientInfo.moo,
        tambon: this.patientInfo.tambon,
        aumpue: this.patientInfo.aumpue,
        province: this.patientInfo.province,
        phone: this.patientInfo.phone,
        email: this.patientInfo.email,
        dadFirstName: this.patientInfo.dadFirstName,
        dadLastName: this.patientInfo.dadLastName,
        momFirstName: this.patientInfo.momFirstName,
        momLastName: this.patientInfo.momLastName,
      })
    },
    // touch() {
    //   this.$v.form.$touch();
    // },
    // reset() {
    //   this.$v.form.$reset();
    // }
  },
  // validations : {
  //   patientInfo: {
  //     cardId: {
  //       required,
  //       numeric
  //     },
  //     callAs: {
  //       required
  //     },
  //     firstName: {
  //       required
  //     },
  //     lastName: {
  //       required
  //     },
  //     birthDay: {
  //       required
  //     },
  //     religion: {
  //       required
  //     },
  //     nationality: {
  //       required
  //     },
  //     origin: {
  //       required
  //     },
  //     gender: {
  //       required
  //     },
  //     status: {
  //       required
  //     },
  //     carrer: {
  //       required
  //     },
  //     symtoms: {
  //       required
  //     },
  //     houseNum: {
  //       required,
  //       numeric
  //     },
  //     moo: {
  //       required
  //     },
  //     tambon: {
  //       required
  //     },
  //     aumpue: {
  //       required
  //     },
  //     province: {
  //       required
  //     },
  //     phone: {
  //       required,
  //       numeric
  //     },
  //     email: {
  //       required,
  //       email
  //     },
  //     dadFirstName: {
  //       required
  //     },
  //     dadLastName: {
  //       required
  //     },
  //     momFirstName: {
  //       required
  //     },
  //     momLastName: {
  //       required
  //     },
  //   }
  // }
};
</script>