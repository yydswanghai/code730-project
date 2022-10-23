<template>
    <div class="upload-container">
        <div class="flex">
            <h3>单张图片上传</h3>
            <Single fileListJustifyContent="center" />
        </div>
        <div class="flex">
            <h3>多张图片上传</h3>
            <Multiple fileListJustifyContent="center" />
        </div>
    </div>
</template>

<script lang="ts">
import { defineComponent } from "vue"
import Single from './components/single.vue'
import Multiple from './components/multiple.vue'
export default defineComponent({
    components: {
        Single,
        Multiple
    },
    setup(){

        return {

        }
    }
})
</script>
<style lang="scss" scoped>
.upload-container{
    width: 100%;
    height: calc(100vh - 108px);
    display: flex;
    background: #eee;
    .flex{
        padding-top: 50px;
        flex: 0 0 50%;
        h3{
            text-align: center;
        }
    }
}
</style>