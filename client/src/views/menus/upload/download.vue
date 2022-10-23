<template>
    <div class="download-container">
        <h3>资源列表</h3>
        <div class="button-wrap">
            <n-button type="info" v-for="(item, idx) in files" :key="idx">
                <a :href="item.url">{{ item.filename }}</a>
            </n-button>
        </div>
        <h3>使用迅雷下载</h3>
        <div class="button-wrap">
            <n-button type="info" v-for="(item, idx) in files" :key="idx">
                <a :href="toxunlei(item.url)" resrole="thunder">{{ item.filename }}</a>
            </n-button>
        </div>
    </div>
</template>

<script lang="ts">
import { defineComponent, ref } from "vue"
import { getAllFiles } from '@/api/upload'
import { statusCodeEnum } from '@/enums/statusCodeEnum'
export default defineComponent({
    setup(){
        const files = ref<{ filename: string, url: string }[] | null>(null)
        /* 获取服务器提供的下载资源 */
        async function fetchAllFiles() {
            const res = await getAllFiles();
            if(res.code === statusCodeEnum.success){
                files.value = res.data.map((it: string) => ({  filename: it ,url: `/api/download/${it}` }));
            }
        }
        fetchAllFiles()
        /*
         * 迅雷下载协议:
         * 1. 把完整的下载地址得到
         * 2. 'AA地址ZZ'
         * 3. base64编码
         * 4. thunder://base64编码
         */
        function toxunlei(url: string) {
            return `thunder://AA${btoa(url)}ZZ`;
        }

        return {
            files,
            toxunlei,
        }
    }
})
</script>
<style lang="scss" scoped>
.download-container{
    box-sizing: border-box;
    padding: 20px;
    .button-wrap{
        display: flex;
        flex-wrap: wrap;
        column-gap: 20px;
        a{
            color: inherit;
        }
    }
}
</style>