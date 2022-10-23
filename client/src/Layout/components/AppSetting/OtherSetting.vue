<template>
    <div class="i-setting">
        <n-divider title-placement="center">其他设置</n-divider>

        <div class="i-item">
            <div class="title">固定顶栏</div>
            <div class="switch">
                <n-switch v-model:value="settingStore.headerSetting.fixed" />
            </div>
        </div>
        <div class="i-item">
            <div class="title">固定多页签</div>
            <div class="switch">
                <n-switch v-model:value="settingStore.tagsViewSetting.fixed" />
            </div>
        </div>
        <div class="i-item">
            <div class="title">显示多页签</div>
            <div class="switch">
                <n-switch v-model:value="settingStore.tagsViewSetting.show" />
            </div>
        </div>
        <div class="i-item">
            <div class="title">显示刷新页面按钮</div>
            <div class="switch">
                <n-switch v-model:value="settingStore.headerSetting.isReload" />
            </div>
        </div>
        <div class="i-item">
            <div class="title">显示面包屑导航</div>
            <div class="switch">
                <n-switch v-model:value="settingStore.crumbsSetting.show" />
            </div>
        </div>
        <div class="i-item">
            <div class="title">显示面包屑图标</div>
            <div class="switch">
                <n-switch v-model:value="settingStore.crumbsSetting.showIcon" />
            </div>
        </div>
    </div>
</template>

<script lang="ts">
import { useProjectSettingStore } from '@/store/modules/projectSetting'
import { defineComponent, computed } from 'vue'
export default defineComponent({
    name: 'OtherSetting',
    setup(){
        const settingStore = useProjectSettingStore()

        return {
            navMode: computed(() => settingStore.navMode),
            settingStore
        }
    }
})
</script>