<template>
  <NConfigProvider
    :locale="zhCN"
    :date-locale="dateZhCN"
    :theme="theme"
    :theme-overrides="themeOverrides"
  >
    <AppProvider>
      <RouterView />
    </AppProvider>
  </NConfigProvider>
</template>

<script lang="ts">
/**
 * NConfigProvider 是ui库的适配主题的组件
 * detail: https://www.naiveui.com/zh-CN/light/components/config-provider
 */
import { defineComponent, computed, provide, unref } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { zhCN, dateZhCN, darkTheme, GlobalThemeOverrides } from 'naive-ui'
import { AppProvider } from '@/components/Application/'
import { lighten } from '@/utils/'
import { useProjectSettingStore } from '@/store/modules/projectSetting'

export default defineComponent({
    components: {
      AppProvider,
    },
    setup(){
        const $route = useRoute();
        const $router = useRouter();
        const settingStore = useProjectSettingStore()
        // 当前主题，如果设置为暗色主题，直接使用系统自带的暗色主题，否则就是亮色主题
        const theme = computed(() => settingStore.themeSetting.isDark ? darkTheme : undefined)
        /* 全局刷新 */
        provide('reload', () => {
          $router.push({ path: '/redirect' + unref($route).fullPath });
        });

        const themeOverrides = computed<GlobalThemeOverrides>(() => {
            const { primary, success, waring, error, info } = settingStore.themeSetting;
            const lightenStr = lighten(primary, 6);
            return {
                common: {
                    primaryColor: primary,         // 主题色
                    primaryColorHover: lightenStr,  // hover
                    primaryColorPressed: lightenStr,
                    successColor: success,
                    warningColor: waring,
                    infoColor: info,
                    errorColor: error,
                },
                LoadingBar: {
                    colorLoading: primary,// 加载效果的颜色
                }
            }
        })
        return {
            zhCN,
            dateZhCN,
            theme,
            themeOverrides,
        }
    }
})
</script>