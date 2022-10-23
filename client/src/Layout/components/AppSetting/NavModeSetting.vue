<template>
    <div class="i-setting">
        <n-divider title-placement="center">导航栏模式</n-divider>

        <div class="i-container">
            <div class="i-container-item">
                <n-tooltip placement="top">
                    <template #trigger>
                        <img src="~@/assets/nav/nav-theme-dark.svg?url" @click="togNavMode('vertical')" />
                    </template>
                    <span>左侧菜单模式</span>
                </n-tooltip>
                <n-badge dot color="#19be6b" v-show="navMode === 'vertical'" />
            </div>
            <div class="i-container-item">
                <n-tooltip placement="top">
                    <template #trigger>
                        <img src="~@/assets/nav/nav-horizontal.svg?url" @click="togNavMode('horizontal')" />
                    </template>
                    <span>顶部菜单模式</span>
                </n-tooltip>
                <n-badge dot color="#19be6b" v-show="navMode === 'horizontal'" />
            </div>
            <div class="i-container-item">
                <n-tooltip placement="top">
                    <template #trigger>
                        <img src="~@/assets/nav/nav-horizontal-mix.svg?url" @click="togNavMode('horizontal-mix')" />
                    </template>
                    <span>顶部菜单混合模式</span>
                </n-tooltip>
                <n-badge dot color="#19be6b" v-show="navMode === 'horizontal-mix'" />
            </div>
        </div>
    </div>
</template>

<script lang="ts">
import { defineComponent, computed } from 'vue'
import { useProjectSettingStore } from '@/store/modules/projectSetting'
import { INavMode } from '@/settings/types'

export default defineComponent({
    name: 'NavModeSetting',
    setup(){
        const settingStore = useProjectSettingStore()

        function togNavMode(mode: INavMode) {
            settingStore.setNavMode(mode)
        }
        return {
            navMode: computed(() => settingStore.navMode),
            togNavMode,
        }
    }
})
</script>