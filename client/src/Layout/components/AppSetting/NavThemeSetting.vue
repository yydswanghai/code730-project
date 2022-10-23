<template>
    <div class="i-setting">
        <n-divider title-placement="center">导航栏风格</n-divider>

        <div class="i-container">
            <div class="i-container-item">
                <n-tooltip placement="top">
                    <template #trigger>
                        <img src="~@/assets/nav/nav-theme-dark.svg?url" @click="togNavTheme('dark')" />
                    </template>
                    <span>暗色侧边栏</span>
                </n-tooltip>
                <n-badge dot color="#19be6b" v-show="navTheme === 'dark'" />
            </div>
            <div class="i-container-item">
                <n-tooltip placement="top">
                    <template #trigger>
                        <img src="~@/assets/nav/nav-theme-light.svg?url" @click="togNavTheme('light')" />
                    </template>
                    <span>亮色侧边栏</span>
                </n-tooltip>
                <n-badge dot color="#19be6b" v-show="navTheme === 'light'" />
            </div>
            <div class="i-container-item">
                <n-tooltip placement="top">
                    <template #trigger>
                        <img src="~@/assets/nav/nav-theme-mix-dark.svg?url" @click="togNavTheme('mix-dark')" />
                    </template>
                    <span>暗色混合侧边栏</span>
                </n-tooltip>
                <n-badge dot color="#19be6b" v-show="navTheme === 'mix-dark'" />
            </div>
        </div>
    </div>
</template>

<script lang="ts">
import { useProjectSettingStore } from '@/store/modules/projectSetting'
import { defineComponent, computed } from 'vue'
import { INavTheme } from '@/settings/types'

export default defineComponent({
    name: 'NavThemeSetting',
    setup(){
        const settingStore = useProjectSettingStore()

        function togNavTheme(theme: INavTheme) {
            settingStore.setNavTheme(theme);
        }

        return {
            navTheme: computed(() => settingStore.navTheme),
            togNavTheme,
        }
    }
})
</script>