<template>
    <n-upload
        class="upload-single"
        list-type="image-card"
        v-model:file-list="fileList"
        :custom-request="customRequest"
        @before-upload="beforeUpload"
        @preview="preview"
        @finish="finish"
        @error="error"
        @remove="remove"
        >
            <slot>
                <div class="upload-default">
                    <n-icon size="28"><UploadOutline /></n-icon>
                    <div>选择文件<br/><span>图片不超过5M</span></div>
                </div>
            </slot>
    </n-upload>
    <!-- 预览 -->
    <n-modal
        v-model:show="showModal"
        preset="card"
        style="width: 600px"
        title="图片预览"
        >
        <img :src="previewImageUrl" />
    </n-modal>
</template>

<script lang="ts">
/**
 * 单个文件上传
 */
import { defineComponent, ref, computed } from "vue"
import { UploadOutline } from '@/icons'
import { useMessage } from 'naive-ui'
import type { UploadCustomRequestOptions, UploadFileInfo} from 'naive-ui'
import { upload } from "@/api/upload"
import { statusCodeEnum } from '@/enums/statusCodeEnum'

interface uploadResponse {// 文件上传返回结果对象
    url: string
}
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
        const fileList = ref<UploadFileInfo[]>([]);// 文件列表
        const showModal = ref(false);// 预览弹窗控制
        const previewImageUrl = ref('');// 预览大图

        /* 自定义上传 */
        async function customRequest(options: UploadCustomRequestOptions) {
            const { file } = options;
            const formData = new FormData();
            if(file?.file){
                formData.append('image-single', file.file, file.name)
            }
            const resp = await upload(formData);
            if(resp.code === statusCodeEnum.success){
                const url = resp.data.url;
                previewImageUrl.value = url
                options.onFinish();
                $message.success('上传成功');
            }else{
                options.onError();
                $message.error('上传失败');
            }
        }
        /* 上传之前 */
        function beforeUpload(options: {file: UploadFileInfo, fileList: UploadFileInfo[]}): any {
            const accepts = ["image/jpg", "image/jpeg", "image/png", "image/gif", "image/webp"];// 文件类型
            if(!accepts.includes(options.file.type!)){
                $message.error('上传的文件格式不正确！');
                return false;
            }
        }
        /* 上传完成 */
        function finish(options: {file: UploadFileInfo, event?: ProgressEvent}): any {
            // 上传证件照只需要一张，删除前一张
            fileList.value.length > 1 && fileList.value.splice(0, 1);
            ctx.emit('success', fileList.value)
        }
        /* 上传失败 */
        function error(options: {file: UploadFileInfo, event?: ProgressEvent}): any {
            console.log(123);
        }
        /* 预览文件 */
        function preview(file: UploadFileInfo) {
            showModal.value = true;
        }
        /* 删除图片 */
        function remove(options: {file: UploadFileInfo, fileList: UploadFileInfo[]}) {
            const { file } = options;
            const index = fileList.value.findIndex(it => it.id === file.id);
            fileList.value.splice(index, 1);
            ctx.emit('remove');
        }

        return {
            fileList,
            showModal,
            previewImageUrl,
            width: computed(() => props.triggerWidth + 'px'),
            height: computed(() => props.triggerHeight + 'px'),
            customRequest,
            beforeUpload,
            preview,
            finish,
            remove,
            error
        }
    }
})
</script>
<style lang="scss" scoped>
.upload-single{
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