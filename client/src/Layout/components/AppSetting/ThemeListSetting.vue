<template>
    <div class="i-setting">
        <n-divider title-placement="center">系统主题</n-divider>

        <div class="theme-container">
            <span
                class="theme-item"
                v-for="(color, i) in predefineColors"
                :key="i"
                :style="{ 'background-color': color }"
                @click="changeTheme(color)"
                >
                <n-icon size="12" v-if="color === primaryColor">
                    <CheckOutlined />
                </n-icon>
            </span>
        </div>
    </div>
</template>

<script lang="ts">
import { useProjectSettingStore } from '@/store/modules/projectSetting'
import { defineComponent, computed } from 'vue'
import { CheckOutlined } from '@vicons/antd'

export default defineComponent({
    name: 'ThemeListSetting',
    components: {
        CheckOutlined
    },
    setup(){
        const settingStore = useProjectSettingStore();

        // 修改系统主题
        function changeTheme(color: string) {
            settingStore.setAppTheme(color);
        }

        return {
            primaryColor: computed(() => settingStore.themeSetting.primary),
            predefineColors: computed(() => settingStore.themeSetting.colorList),
            changeTheme,
        }
    }
})
</script>
<style lang="scss" scoped>
.theme-container{
    display: flex;
    flex-wrap: wrap;
    justify-content: flex-start;
    padding: 2px 0;
    .theme-item{
        width: 20px;
        min-width: 20px;
        height: 20px;
        cursor: pointer;
        border: 1px solid #eee;
        border-radius: 2px;
        margin: 0 5px 5px 0;
        text-align: center;
    }
}
</style>