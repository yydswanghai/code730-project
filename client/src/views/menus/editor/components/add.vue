<template>
    <div class="add-container">
        <n-button type="info" @click="goHome">返回</n-button>
        <h2>添加一本书籍</h2>
        <n-form ref="formRef" label-placement="left" label-width="92" :model="formValue" :rules="rules">
            <n-form-item path="name" label="书籍名称：">
                <n-input v-model:value="formValue.name" placeholder="请输入书籍名称" />
            </n-form-item>
            <n-form-item path="author" label="作者：">
                <n-input v-model:value="formValue.author" placeholder="请输入书籍名称" />
            </n-form-item>
            <n-form-item path="publishDate" label="发布日期：">
                <n-date-picker v-model:formatted-value="formValue.publishDate" type="date" value-format="yyyy-MM-dd" />
            </n-form-item>
            <n-form-item path="imgurl" label="书籍封面：">
                <n-input v-model:value="formValue.imgurl" placeholder="请输入书籍封面" />
            </n-form-item>
            <n-form-item path="description" label="书籍描述：">
                <div style="border: 1px solid #ccc">
                    <!-- <Toolbar
                        style="border-bottom: 1px solid #ccc"
                        :editor="editorRef"
                        :defaultConfig="toolbarConfig"
                        mode="default"
                    />
                    <Editor
                        style="height: 500px; overflow-y: hidden;"
                        v-model="formValue.description"
                        :defaultConfig="editorConfig"
                        mode="default"
                        @onCreated="handleCreated"
                    /> -->
                </div>
            </n-form-item>
            <n-form-item>
                <div style="width: 160px;margin: 0 auto;">
                    <n-button type="primary" size="large" block @click="handleSubmit">
                        提交
                    </n-button>
                </div>
            </n-form-item>
        </n-form>
    </div>
</template>

<script lang="ts">
import { FormInst, useMessage } from "naive-ui"
import { defineComponent, reactive, shallowRef, onBeforeUnmount } from "vue"
// import '@wangeditor/editor/dist/css/style.css' // 引入 css
// import { Editor, Toolbar } from '@wangeditor/editor-for-vue'
import { addBook } from '@/api/editor'
import { statusCodeEnum } from '@/enums/statusCodeEnum'

export default defineComponent({
    // components: { Editor, Toolbar },
    emits: ['update:modelValue'],
    props: {
        modelValue: {
            type: Number,
            default: 0,
        },
    },
    setup(props, ctx) {
        const $message = useMessage()
        const formRef = ref<FormInst | null>(null)
        const formValue = reactive({
            name: '',
            author: '',
            imgurl: '',
            publishDate: '2022-10-05',
            description: '<p></p>'// 内容 HTML
        })
        const rules = {
            name: { required: true, message: '书籍名称不能为空', trigger: 'blur' },
            author: { required: true, message: '作者不能为空', trigger: 'blur' },
        }
        /* 提交 */
        function handleSubmit(e: MouseEvent) {
            e.preventDefault()
            formRef.value?.validate(async (errors) => {
                if (!errors) {
                    const resp =  await addBook(formValue)
                    if(resp.code === statusCodeEnum.success){
                        $message.success('添加成功')
                        goHome()
                    }
                } else {
                    $message.warning("提交失败，请填写完整表单");
                    console.log(errors);
                }
            })
        }
        function goHome() {
            ctx.emit('update:modelValue', props.modelValue-1)
        }

        // 编辑器实例，必须用 shallowRef
        const editorRef = shallowRef()
        const toolbarConfig = {}
        const editorConfig = { placeholder: '请输入书籍描述...' }

        // 组件销毁时，也及时销毁编辑器
        onBeforeUnmount(() => {
            const editor = editorRef.value;
            if (editor == null) return
            editor.destroy()
        })
        // 记录 editor 实例，重要！
        const handleCreated = (editor: any) => {
            editorRef.value = editor;
        }
        return {
            formRef,
            formValue,
            rules,
            handleSubmit,
            goHome,
            editorRef,
            toolbarConfig,
            editorConfig,
            handleCreated
        }
    }
})
</script>