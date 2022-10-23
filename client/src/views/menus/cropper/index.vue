<template>
    <div class="i-cropper-container">
        <ICropper />
    </div>
</template>

<script lang="ts">
import { defineComponent } from "vue"
import { ICropper } from './components/ICropper/'

export default defineComponent({
    components: {
        ICropper,
    },
})
</script>
<style lang="scss" scoped>
.i-cropper-container{
    box-sizing: border-box;
    padding: 20px;
    min-height: calc(100vh - 108px);
}
</style>