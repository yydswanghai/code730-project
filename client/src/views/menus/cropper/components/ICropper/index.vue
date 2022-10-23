<template>
    <div class="i-upload">
        <div class="tips">请选择一张图片，裁剪图片</div>
        <label for="inputImage" class="upload">
            <input id="inputImage" type="file" accept="image/*" class="upload-hide" @change="uploadChange" />
            <button>打开</button>
        </label>
    </div>
    <core v-model:show="show" :data="fileData" @get-data="getData" />
</template>

<script lang="ts">
import { defineComponent, ref } from "vue"
import core from './core.vue'

export default defineComponent({
    components : {
        core,
    },
    setup(props, ctx){
        const show = ref(false);// 是否显示裁剪操作页面
        const fileData = ref('');
        function uploadChange(e: any) {
            show.value = true;
            const file = e.target.files[0];// 源文件
            const reader = new FileReader();
            reader.readAsDataURL(file);// 读取图片文件
            reader.onload = function (ev: any) {// 文件读取完成后，会触发一个 load 事件
                // 图片文件读取完成，我们要进行裁剪
                fileData.value = ev.target.result;
            }
        }
        function getData(str: string) {
            console.log(str)
        }
        return {
            show,
            fileData,
            uploadChange,
            getData,
        }
    }
})
</script>
<style lang="scss" scoped>
.i-upload{
    display: flex;
    flex-direction: column;
    align-items: center;
    box-sizing: border-box;
    margin-bottom: 20px;
    .tips{
        font-size: 18px;
        font-weight: bold;
        margin-bottom: 20px;
    }
    .upload{
        position: relative;
        display: inline-block;
        z-index: 1;
        background-color: #007bff;
        border-color: #007bff;
        padding: 6px 12px;
        &:hover{
            background-color: #0069d9;
            border-color: #0062cc;
        }
        .upload-hide{
            width: 100%;
            height: 100%;
            opacity: 0;
            position: absolute;
            left: 0;
            top: 0;
        }
        button{
            background: 0;
            color: #fff;
            border: none;
        }
    }
}
</style>