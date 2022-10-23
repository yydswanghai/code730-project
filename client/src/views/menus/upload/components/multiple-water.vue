<template>
    <n-space vertical>
        <n-steps :current="(current as number)">
            <n-step title="上传原图">
                <n-upload
                    class="upload"
                    list-type="image-card"
                    :default-upload="false"
                    multiple
                    @before-upload="beforeUpload"
                    @change="change"
                    >
                        <slot>
                            <div class="upload-default">
                                <n-icon size="28"><UploadOutline /></n-icon>
                                <div>选择文件<br/><span>图片不超过5M</span></div>
                            </div>
                        </slot>
                </n-upload>
            </n-step>
            <n-step title="上传水印">
                <n-upload
                    class="upload"
                    list-type="image-card"
                    :default-upload="false"
                    @before-upload="beforeUpload"
                    @change="waterChange"
                    >
                        <slot>
                            <div class="upload-default">
                                <n-icon size="28"><UploadOutline /></n-icon>
                                <div>选择作为水印的文件<br/><span>图片不超过5M</span></div>
                            </div>
                        </slot>
                </n-upload>
            </n-step>
        </n-steps>
    </n-space>
    <div style="text-align: center;margin-top: 50px;">
        <n-button type="primary" :disabled="!waterFileList.length" @click="clickUpload">上传文件</n-button>
        <n-button type="success" :disabled="!isPreview" style="margin-left: 6px;" @click="preview">预览已经上传的文件</n-button>
    </div>
    <!-- 预览 -->
    <n-modal
        v-model:show="showModal"
        preset="card"
        style="width: 400px"
        title="图片预览"
        >
        <n-carousel show-arrow autoplay draggable>
            <img v-for="(item, idx) in previewImages" :key="idx" :src="item.url" />
        </n-carousel>
    </n-modal>
</template>

<script lang="ts">
/**
 * 上传加水印
 */
import { defineComponent, ref, computed } from "vue"
import { UploadOutline } from '@/icons'
import { useMessage } from 'naive-ui'
import type { UploadFileInfo } from 'naive-ui'
import { upload2water } from "@/api/upload"
import { statusCodeEnum } from '@/enums/statusCodeEnum'

export default defineComponent({
    emits: ['success', 'remove'],
    props: {
        triggerWidth: {
            type: Number,
            default: 160
        },
        triggerHeight: {
            type: Number,
            default: 210
        },
        fileListJustifyContent: {
            type: String,
            default: 'flex-start'
        }
    },
    components: {
        UploadOutline,
    },
    setup(props, ctx){
        const $message = useMessage();
        const current = ref(1);// 当前步骤
        const fileList = ref<UploadFileInfo[]>([]);// 文件列表
        const waterFileList = ref<UploadFileInfo[]>([]);// 水印
        const showModal = ref(false);// 预览弹窗控制
        const isPreview = ref(false);// 时候可以预览
        const previewImages = ref<any[]>([]);// 预览大图

        /* 上传之前 */
        function beforeUpload(options: {file: UploadFileInfo, fileList: UploadFileInfo[]}): any {
            const accepts = ["image/jpg", "image/jpeg", "image/png", "image/gif", "image/webp"];// 文件类型
            if(!accepts.includes(options.file.type!)){
                $message.error('上传的文件格式不正确！');
                return false;
            }
        }
        /* 文件发生改变 */
        function change(options: { fileList: UploadFileInfo[] }) {
            fileList.value = options.fileList;
            if(fileList.value.length > 0){
                current.value++
            }
        }
        /* 水印 */
        function waterChange(options: { fileList: UploadFileInfo[] }) {
            if(options.fileList.length >= 2){// 仅能上传一张
                options.fileList.splice(0, 1)
            }
            waterFileList.value = options.fileList;
        }
        /* 点击上传 */
        async function clickUpload() {
            const formData = new FormData();
            if(fileList.value.length > 0){
                fileList.value.forEach(item => {
                    formData.append('image-target', item.file!, item.name)
                })
            }
            if(waterFileList.value.length > 0){
                waterFileList.value.forEach(item => {
                    formData.append('image-water', item.file!, item.name)
                })
            }
            const resp = await upload2water(formData);
            if(resp.code === statusCodeEnum.success){
                previewImages.value = resp.data;
                $message.success('上传成功')
                isPreview.value = true;
            }else{
                $message.error('上传失败');
            }
        }
        /* 预览文件 */
        function preview(file: UploadFileInfo) {
            showModal.value = true;
        }

        return {
            current,
            fileList,
            waterFileList,
            showModal,
            previewImages,
            isPreview,
            width: computed(() => props.triggerWidth + 'px'),
            height: computed(() => props.triggerHeight + 'px'),
            beforeUpload,
            change,
            waterChange,
            clickUpload,
            preview,
        }
    }
})
</script>
<style lang="scss" scoped>
.upload{
    :deep(.n-upload-file-list){
        display: flex;
        justify-content: v-bind(fileListJustifyContent);
        .n-upload-trigger{
            width: v-bind(width);
            height: v-bind(height);
        }
        .n-upload-file{
            width: v-bind(width);
            height: v-bind(height);
        }
    }
    .upload-default {
        font-size: 12px;
        span {
            color: #999;
        }
    }
}
</style>
<style lang="scss">
.n-modal-container{
    .n-modal-body-wrapper{
        .n-card__content{
            img{
                width: 100%;
            }
        }
    }
}
</style>