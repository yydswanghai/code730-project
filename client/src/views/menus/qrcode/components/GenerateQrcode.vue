<template>
    <div class="qrcode">
        <div class="item">
            <h3>{{ title }}</h3>
            <n-auto-complete v-model:value="value" :options="options">
                <template #default="{ handleInput, handleBlur, handleFocus, value: inputValue }" >
                    <n-input
                        type="textarea"
                        :value="inputValue"
                        placeholder="请输入要生成的二维码链接"
                        @input="handleInput"
                        @focus="handleFocus"
                        @blur="handleBlur"
                        style="height: 135px;"
                    />
                </template>
            </n-auto-complete>
            <n-button type="info" @click="confirm" style="margin-top: 20px;width: 120px;">确认</n-button>
        </div>
        <div class="item">
            <img :src="qrcodeImg" />
        </div>
    </div>
</template>

<script lang="ts">
import { defineComponent, ref, computed } from "vue"
import { getQrcode, getQrcode2Custom } from '@/api/qrcode'
import { statusCodeEnum } from '@/enums/statusCodeEnum'

export default defineComponent({
    props: {
        title: {
            type: String,
            default: ''
        },
        type: {
            type: Number,
            default: 1
        }
    },
    setup(props, ctx){
        const value = ref('');
        const qrcodeImg = ref('');
        const options = computed(() => {
            const arr = ['.com', '@gmail.com', '@163.com', '@qq.com'];
            return arr.map(suffix => {
                const prefix = value.value.split('@')[0]
                return {
                    label: prefix + suffix,
                    value: prefix + suffix
                }
            })
        });
        async function confirm() {
            let fetchFunc = null;
            if(props.type === 1){
                fetchFunc = getQrcode;
            }else{
                fetchFunc = getQrcode2Custom;
            }
            const resp = await fetchFunc({ str: value.value });
            if(resp.code === statusCodeEnum.success){
                qrcodeImg.value = resp.data.url;
            }
        }
        return {
            value,
            qrcodeImg,
            options,
            confirm
        }
    }
})
</script>
<style lang="scss" scoped>
.qrcode{
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    box-sizing: border-box;
    .item{
        flex: 0 0 48%;
    }
}
</style>