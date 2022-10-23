<template>
    <div class="i-setting">
        <n-divider title-placement="center">主题</n-divider>

        <n-tooltip placement="bottom">
            <template #trigger>
                <n-switch v-model:value="settingStore.themeSetting.isDark" :rail-style="railStyle">
                    <template #checked>
                        <NIcon size="14" color="#ffd93b"><SunnySharp /></NIcon>
                    </template>
                    <template #unchecked>
                        <NIcon size="14" color="#ffd93b"><Moon /></NIcon>
                    </template>
                </n-switch>
            </template>
            <span>{{ !settingStore.themeSetting.isDark ? '深' : '浅' }}色主题</span>
        </n-tooltip>
    </div>
</template>

<script lang="ts">
import { defineComponent } from 'vue'
import { useProjectSettingStore } from '@/store/modules/projectSetting'
import { Moon, SunnySharp } from '@vicons/ionicons5'

export default defineComponent({
    name: 'ThemeSetting',
    components: {
        Moon,
        SunnySharp,
    },
    setup(){
        const settingStore = useProjectSettingStore()
        function railStyle(info: { focused: boolean, checked: boolean }) {
            return info.checked ? { background: '#e0e7ff' } : { background: '#000e1c' }
        }
        return {
            settingStore,
            railStyle,
        }
    }
})
</script>