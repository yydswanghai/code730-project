<template>
    <div class="i-cropper" :class="{ show : show }">
        <div class="box">
            <!-- 图片 -->
            <div class="image-container">
                <img ref="imageRef" id="image" />
            </div>
            <!-- 预览 -->
            <div class="preview-container">
                <div class="preview-image"></div>
            </div>
        </div>
        <!-- 操作栏 -->
        <div class="oper-container">
            <div class="tip">角度、step的值可以修改</div>
            <n-form ref="formRef" :model="state" label-placement="left">
                <div class="form-item form-item-left">
                    <n-form-item label="角度" label-width="52">
                        <n-input v-model="rotate" @blur="RotateBlur" />
                    </n-form-item>
                    <n-form-item label="step" label-width="52">
                        <n-input v-model="step" @blur="StepBlur" />
                    </n-form-item>
                    <n-form-item label="width" label-width="52">
                        <n-tag>{{ width }}</n-tag>
                    </n-form-item>
                    <n-form-item label="height" label-width="52">
                        <n-tag>{{ height }}</n-tag>
                    </n-form-item>
                    <n-form-item label="x" label-width="52">
                        <n-tag>{{ left }}</n-tag>
                    </n-form-item>
                    <n-form-item label="y" label-width="52">
                        <n-tag>{{ top }}</n-tag>
                    </n-form-item>
                </div>
                <div class="form-item form-item-right">
                    <n-form-item label="比例">
                        <n-button @click="handleRatio(16/9)">16:9</n-button>
                        <n-button @click="handleRatio(4/3)">4:3</n-button>
                        <n-button @click="handleRatio(1)">1:1</n-button>
                        <n-button @click="handleRatio(2/3)">2:3</n-button>
                    </n-form-item>
                    <n-form-item label="方向">
                        <n-button @click="handleMove('left')">左</n-button>
                        <n-button @click="handleMove('right')">右</n-button>
                        <n-button @click="handleMove('up')">上</n-button>
                        <n-button @click="handleMove('down')">下</n-button>
                    </n-form-item>
                    <n-form-item label="旋转">
                        <n-button @click="handleRotate('left')">逆时钟</n-button>
                        <n-button @click="handleRotate('right')">顺时钟</n-button>
                    </n-form-item>
                    <n-form-item label="翻转">
                        <n-button @click="handleScale('scaleX')">x轴翻转</n-button>
                        <n-button @click="handleScale('scaleY')">y轴翻转</n-button>
                    </n-form-item>
                    <n-form-item label="缩放">
                        <n-button @click="handleZoom('narrow')">缩小</n-button>
                        <n-button @click="handleZoom('enlarge')">放大</n-button>
                    </n-form-item>
                    <n-form-item label="其他">
                        <n-button @click="handleReset" secondary type="success">复原</n-button>
                        <n-button @click="handleDownload" secondary type="info">下载</n-button>
                        <n-button @click="handleBack" secondary type="tertiary">返回</n-button>
                        <n-button @click="handleSend" secondary type="primary">确定</n-button>
                    </n-form-item>
                </div>
            </n-form>
        </div>
    </div>
    <!-- 下载弹窗 -->
    <div class="i-modal" v-show="showModal">
        <div class="modal-dialog">
            <div class="modal-header">
                <h3>Cropped</h3>
            </div>
            <div class="modal-body" ref="modalBodyRef"></div>
            <div class="modal-footer">
                <button @click="showModal = false;">关闭</button>
                <a :href="downloadHref" download="cropped.jpg">下载</a>
            </div>
        </div>
    </div>
</template>

<script lang="ts">
import { defineComponent, ref, onMounted, reactive, toRefs, watch } from "vue"
import Cropper from 'cropperjs'
import 'cropperjs/dist/cropper.css'

export default defineComponent({
    props: {
        show: {// 控制显示
            type: Boolean,
            default: false,
        },
        data: {// cropper需要的数据
            type: String,
            default: ''
        }
    },
    emits: ['update:show', 'get-data'],
    setup(props, ctx) {
        const cropper = ref<Cropper | null>(null);// 容器对象
        const imageRef = ref<HTMLImageElement | null>(null);// 图片dom
        const showModal = ref(false);// 是否显示下载弹窗
        const modalBodyRef = ref<HTMLElement | null>(null);// 弹窗cvs容器
        const downloadHref = ref('');// <a> href
        const state = reactive({
            left: 0,// 底图的left
            top: 0,// 底图的top
            width: 0,// 底图的width
            height: 0,// 底图的height
            step: 10,// 移动一次的距离
            rotate: 0,// 旋转角度
            scaleX: 0,// 以x轴为中心轴翻转
            scaleY: 0,// 以y轴为中心轴翻转
            scale: {// 用于切换翻转状态
                x: 1,
                y: 1
            },
            zoom: 0,// 缩放
        });
        onMounted(() => {
            /* 初始化 cropper */
            changeCropper(imageRef.value);
        });
        watch(() => props.data, (val) => {
            if(val){
                cropper.value?.replace(val);
            }
        })
        function changeCropper(element: any, options: Cropper.Options = {}) {
            cropper.value = new Cropper(element, Object.assign({
                preview: '.preview-image',// 预览
                aspectRatio: 1,// 纵横比
                ready(){
                    const canvasData = cropper.value?.getCanvasData();
                    if(canvasData){
                        state.left = canvasData.left;
                        state.top = canvasData.top;
                        state.width = canvasData.width;
                        state.height = canvasData.height;
                    }
                }
            }, options));
        }
        /* 确定 */
        function handleSend() {
            if(!cropper.value) return;
            const src = cropper.value.getCroppedCanvas().toDataURL('image/jpeg', 0.9);
            ctx.emit('get-data', src);
            ctx.emit('update:show', false);
        }
        /* 返回 */
        function handleBack() {
            if(!cropper.value) return;
            cropper.value.clear();
            cropper.value.reset();
            ctx.emit('update:show', false);
        }
        /* 复原 */
        function handleReset() {
            if(!cropper.value) return;
            cropper.value.reset();
        }
        /* 移动底照片 */
        function handleMove(direction: 'left' | 'right' | 'up' | 'down') {
            if(!cropper.value) return;
            if(direction === 'left'){
                cropper.value.move(-state.step, 0);
            }else if(direction === 'right'){
                cropper.value.move(state.step, 0);
            }else if(direction === 'up'){
                cropper.value.move(0, -state.step);
            }else if(direction === 'down'){
                cropper.value.move(0, state.step);
            }
            _updateMove();
        }
        function _updateMove() {
            if(!cropper.value) return;
            const { left, top } = cropper.value?.getCanvasData();
            state.left = left;
            state.top = top;
        }
        /* 设置裁剪框纵横比 */
        function handleRatio(ratio: number) {
            if(!cropper.value) return;
            cropper.value.setAspectRatio(ratio);
        }
        /* 旋转底照片 */
        function handleRotate(direction: 'left' | 'right') {
            if(!cropper.value) return;
            if(state.rotate == 360 || state.rotate == -360) state.rotate = 0;
            if(direction === 'left'){
                state.rotate -= 45;
            }else if(direction === 'right'){
                state.rotate = Number(state.rotate) + 45;
            }
            cropper.value.rotateTo(state.rotate);
        }
        function RotateBlur(e: any) {
            const val = Number(e.target.value);
            state.rotate = val;
            cropper.value?.rotateTo(val);
        }
        function StepBlur(e: any) {
            const val = Number(e.target.value);
            state.step = val;
        }
        /* 翻转底照片 */
        function handleScale(direction: 'scaleX' | 'scaleY') {
            if(!cropper.value) return;
            if(direction === 'scaleX'){
                state.scale.x = -state.scale.x
                cropper.value.scaleX(state.scale.x);
            }else{
                state.scale.y = -state.scale.y
                cropper.value.scaleY(state.scale.y);
            }
        }
        /* 缩放底照片 */
        function handleZoom(direction: 'narrow' | 'enlarge') {
            if(!cropper.value) return;
            if(direction === 'narrow'){// 缩小
                cropper.value.zoom(-0.1);
            }else{
                cropper.value.zoom(0.1);
            }
        }
        /* 下载弹窗 */
        function handleDownload() {
            if(!cropper.value) return;
            const cvs = cropper.value.getCroppedCanvas({ maxWidth: 4096, maxHeight: 4096 });
            cvs.style.width = "100%";
            if(modalBodyRef.value){
                modalBodyRef.value.innerHTML = '';
                modalBodyRef.value.appendChild(cvs);
                downloadHref.value = cvs.toDataURL('image/jpeg');
            }
            showModal.value = true;
        }

        return {
            state,
            ...toRefs(state),
            imageRef,
            showModal,
            modalBodyRef,
            downloadHref,
            handleSend,
            handleBack,
            handleReset,
            handleMove,
            handleRatio,
            handleRotate,
            RotateBlur,
            StepBlur,
            handleScale,
            handleZoom,
            handleDownload,
        }
    }
})
</script>
<style lang="scss" scoped>
.i-cropper{
    width: 100%;
    height: auto;
    padding: 20px;
    box-sizing: border-box;
    background-color: #fff;
    display: none;
    z-index: 1;
    &.show{
        display: block !important;
    }
    .box{
        display: flex;
    }
}
.image-container{
    flex: 1 1 50%;
    width: 50%;
    height: 480px;
    max-width: 480px;
    max-height: 480px;
    border: 1px dashed #ccc;
    margin: 10px auto 40px;
    box-sizing: border-box;
    #image{
        display: block;
        max-width: 100%;/* 记得设置这个 */
    }
}
.preview-container{
    flex: 1 1 50%;
    width: 200px;
    height: 200px;
    box-sizing: border-box;
    margin-top: 25px;
    display: flex;
    align-items: center;
    justify-content: center;
    .preview-image{
        width: 200px;
        height: 200px;
        overflow: hidden;
    }
}
.oper-container{
    padding: 0 12px;
    width: 100%;
    box-sizing: border-box;
    .tip{
        font-size: 18px;
        font-weight: bold;
        margin-bottom: 10px;
        height: 30px;
        line-height: 30px;
    }
    .n-form{
        display: flex;
    }
    .form-item{
        flex: 1 1 50%;
        &.form-item-left{
            .n-form-item{
                width: 200px;
            }
        }
        &.form-item-right{
            .n-button{
                margin-right: 8px;
            }
        }
    }
}
.i-modal{
    position: fixed;
    width: 100%;
    height: 100%;
    left: 0;
    top: 0;
    z-index: 100;
    font-size: 16px;
    background-color: rgba(0,0,0,.5);
    display: flex;
    align-items: center;
    justify-content: center;
    .modal-dialog{
        width: 400px;
        height: auto;
        margin: 20px auto 0;
        background: #fff;
        border-radius: 3px;
    }
    .modal-header{
        padding: 12px;
        border-bottom: 1px solid #dee2e6;
        h3{
            font-weight: 400;
        }
    }
    .modal-body{
        padding: 12px;
    }
    .modal-footer{
        padding: 12px;
        text-align: center;
        border-top: 1px solid #dee2e6;
        button, a{
            color: #fff;
            background-color: #6c757d;
            border-color: #6c757d;
            padding: 6px 12px;
            border-radius: 3px;
            margin-right: 5px;
        }
        a{
            background-color: #007bff;
            border-color: #007bff;
        }
    }
}
</style>