<template>
    <div class="i-setting">
        <n-divider title-placement="center">动画</n-divider>

        <div class="i-item">
            <div class="title">禁用动画</div>
            <div class="switch">
                <n-switch v-model:value="settingStore.animateSetting.open" />
            </div>
        </div>

        <div class="i-item">
            <div class="title">动画类型</div>
            <div class="select">
                <n-select v-model:value="settingStore.animateSetting.type" :options="animateOptions" />
            </div>
        </div>
    </div>
</template>

<script lang="ts">
import { defineComponent } from 'vue'
import { useProjectSettingStore } from '@/store/modules/projectSetting'
export default defineComponent({
    name: 'AnimateSetting',
    setup(){
        const settingStore = useProjectSettingStore();

        const animateOptions = [
            { value: 'zoom-fade', label: '渐变' },
            { value: 'zoom-out', label: '闪现' },
            { value: 'fade-slide', label: '滑动' },
            { value: 'fade', label: '消退' },
            { value: 'fade-bottom', label: '底部消退' },
            { value: 'fade-scale', label: '缩放消退' },
        ];

        return {
            settingStore,
            animateOptions,
        }
    }
})
</script>