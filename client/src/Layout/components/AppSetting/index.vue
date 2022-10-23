<template>
    <n-drawer v-model:show="show" :width="width" placement="right">
        <n-drawer-content :title="title" :native-scrollbar="false">
            <div class="setting-container">
                <!-- 主题 -->
                <ThemeSetting />
                <!-- 系统主题 -->
                <ThemeListSetting />
                <!-- 导航模式 -->
                <NavModeSetting />
                <!-- 导航风格 -->
                <NavThemeSetting />
                <!-- 其他设置 -->
                <OtherSetting />
                <!-- 动画设置 -->
                <AnimateSetting />

                <div class="setting-item">
                    <n-alert type="warning" :showIcon="false">
                        <p>{{ markedWords }}</p>
                    </n-alert>
                </div>
            </div>
        </n-drawer-content>
    </n-drawer>
</template>

<script lang="ts">
import { defineComponent, reactive, toRefs } from 'vue'
import { CheckOutlined } from '@vicons/antd'
import ThemeSetting from './ThemeSetting.vue'
import ThemeListSetting from './ThemeListSetting.vue'
import NavModeSetting from './NavModeSetting.vue'
import NavThemeSetting from './NavThemeSetting.vue'
import OtherSetting from './OtherSetting.vue'
import AnimateSetting from './AnimateSetting.vue'

export default defineComponent({
    name: 'AppSetting',
    components: {
        CheckOutlined,
        ThemeSetting,
        ThemeListSetting,
        NavModeSetting,
        NavThemeSetting,
        OtherSetting,
        AnimateSetting,
    },
    setup(){
        const state = reactive({
            width: 280,
            title: '系统设置',
            show: false,
            markedWords: '所有的设置都是即时的没有保存任何状态',
        })

        function openSetting() {
            state.show = true;
        }

        return {
            ...toRefs(state),
            openSetting,
        }
    }
})
</script>
<style lang="scss">
.setting-container{
    .i-setting{
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 12px 0;
        flex-wrap: wrap;
        .n-divider:not(.n-divider--vertical) {
            margin: 10px 0;
        }
        .i-container{
            display: flex;
            flex-wrap: wrap;
            justify-content: flex-start;
            padding: 2px 0;
            .i-container-item{
                margin-right: 16px;
                display: flex;
                flex-direction: column;
                align-items: center;
                img{
                    margin-bottom: .5rem;
                }
            }
        }
        .i-item{
            display: flex;
            align-items: center;
            padding: 12px 0;
            flex-wrap: wrap;
            width: 100%;
            .title{
                flex: 1 1;
                font-size: 14px;
            }
            .switch{
                flex: 0 0 auto;
            }
            .select{
                flex: 1;
            }
        }
    }
}
</style>