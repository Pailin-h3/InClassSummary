<template>
    <div class=card-content>
        <p>ข้าพเจ้าขอรับรองว่าข้อมูลทั้งหมดนี้ถูกต้อง ตรงกับความเป็นจริงทุกประการ และยินยอมให้โรงพยาบาลธรรมศาสตร์ เฉลิมพระเกียรติ
            ตรวจสอบหลักฐานข้อมูลภาครัฐ หากมีข้อมูลใดไม่ถูกต้อง ไม่เป็นความจริง ข้าพเจ้ายินยอมรับผิดชอบทุกประการ
        </p>
        <b-field>
            <b-checkbox v-model="accept" class="center">ยอมรับ</b-checkbox>
        </b-field>
    </div>
</template>

<script>
export default {
    data: function(){
        return {
            accept: false
        }
    }
}
</script>