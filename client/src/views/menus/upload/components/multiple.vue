<template>
    <n-upload
        class="upload-multiple"
        list-type="image-card"
        :default-upload="false"
        multiple
        @change="change"
        >
            <slot>
                <div class="upload-default">
                    <n-icon size="28"><UploadOutline /></n-icon>
                    <div>选择文件<br/><span>图片不超过5M</span></div>
                </div>
            </slot>
    </n-upload>
    <div style="text-align: center;margin-top: 10px;">
        <n-button type="primary" :disabled="!fileList.length" @click="handleClick">上传文件</n-button>
        <n-button type="success" style="margin-left: 6px;" @click="preview">预览已经上传的文件</n-button>
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
 * 多文件上传
 */
import { defineComponent, ref, computed } from "vue"
import { UploadOutline } from '@/icons'
import { useMessage } from 'naive-ui'
import type { UploadFileInfo } from 'naive-ui'
import { uploadMultiple } from "@/api/upload"
import { statusCodeEnum } from '@/enums/statusCodeEnum'

export default defineComponent({
    emits: ['success', 'fail'],
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
        const fileList = ref<UploadFileInfo[]>([]);// 文件列表
        const showModal = ref(false);// 预览弹窗控制
        const previewImages = ref<any[]>([]);// 预览大图

        /* 文件发生改变 */
        function change(options: { fileList: UploadFileInfo[] }) {
            fileList.value = options.fileList;
        }
        /* 点击上传 */
        async function handleClick() {
            const formData = new FormData();
            if(fileList.value.length > 0){
                fileList.value.forEach(item => {
                    formData.append('image-multiple', item.file!, item.name)
                })
            }
            const resp = await uploadMultiple(formData);
            if(resp.code === statusCodeEnum.success){
                resp.data.forEach((item: any) => {
                    previewImages.value.push(item)
                })
                $message.success('上传成功')
                ctx.emit('success')
            }else{
                $message.error('上传失败');
                ctx.emit('fail')
            }
        }
        /* 预览文件 */
        function preview() {
            showModal.value = true;
        }

        return {
            fileList,
            showModal,
            previewImages,
            width: computed(() => props.triggerWidth + 'px'),
            height: computed(() => props.triggerHeight + 'px'),
            change,
            preview,
            handleClick,
        }
    }
})
</script>
<style lang="scss" scoped>
.upload-multiple{
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