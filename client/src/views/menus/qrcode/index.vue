<template>
    <div class="qrcode-container">
        <GenerateQrcode title="生成二维码" />
        <GenerateQrcode title="生成个性化二维码" :type="2" />
    </div>
</template>

<script lang="ts">
import { defineComponent } from "vue"
import GenerateQrcode from './components/GenerateQrcode.vue'

export default defineComponent({
    components: {
        GenerateQrcode,
    },
})
</script>
<style lang="scss" scoped>
.qrcode-container{
    box-sizing: border-box;
    padding: 20px;
}
</style>