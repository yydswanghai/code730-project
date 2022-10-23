<template>
    <n-layout class="layout" :position="fixedHeader" has-sider>
        <!-- 左侧边的菜单 -->
        <n-layout-sider
            v-if="showAside"
            class="layout-sider"
            show-trigger="bar"
            collapse-mode="width"
            :position="fixedMenu"
            :collapsed="collapsed"
            :collapsed-width="minMenuWidth"
            :width="menuWidth"
            :native-scrollbar="false"
            :inverted="inverted"
            @collapse="collapsed = true"
            @expand="collapsed = false"
            >
            <Logo />
            <AsideMenu :inverted="inverted" />
        </n-layout-sider>

        <n-layout>
            <!-- 顶部的组件 -->
            <n-layout-header :inverted="headerInverted" :position="fixedHeader">
                <Header :inverted="headerInverted"  />
            </n-layout-header>
            <!-- 主内容区 -->
            <n-layout-content :class="{ 'light-bg': !isDark }">
                <div class="layout-content" :class="{'layout-content-fixed': fixedHeader === 'static'}">
                    <!-- 菜单标签 -->
                    <TagsView v-if="showTagsView"
                        :class="{ 'i-tags-view-fixed': fixedTagsView, 'light-bg': !isDark, 'dark-bg': isDark }" />
                    <div class="layout-main" :class="{ 'layout-main-fixed': fixedTagsView, 'no-tags-view': !showTagsView }">
                        <!-- 内容区 -->
                        <Main />
                    </div>
                </div>
            </n-layout-content>
            <n-back-top :right="100" />
        </n-layout>
    </n-layout>
</template>

<script lang="ts">
import { defineComponent, computed, unref, onMounted } from 'vue'
import { useProjectSettingStore } from '@/store/modules/projectSetting'
import { useLoadingBar } from 'naive-ui'
import { Logo } from './components/Logo/'
import { Menu as AsideMenu } from './components/Menu/'
import { Header } from './components/Header/'
import { TagsView } from './components/TagsView/'
import { Main } from './components/Main/'
/**
 * Layout 页面布局组件
 */
export default defineComponent({
    name: 'Layout',
    components: {
        Logo,
        AsideMenu,
        Header,
        TagsView,
        Main,
    },
    setup(){
        const settingStore = useProjectSettingStore();
        const collapsed = computed({
            get: () => settingStore.collapsed,
            set: () => settingStore.toggleCollapse()
        });
        /* 导航栏模式 */
        const navMode = computed(() => settingStore.navMode);
        /* 是否为手机端 */
        const isMobile = computed({
            get: () => settingStore.isMobile,
            set: (val) => settingStore.setIsMobile(val)
        });
        /* 显示侧边栏 */
        const showAside = computed(() => {
            return !isMobile.value && (navMode.value === 'vertical' || navMode.value === 'horizontal-mix')
        });
        const navTheme = computed(() => settingStore.navTheme);
        const fixedHeader = computed(() => {;
            const { fixed } = settingStore.headerSetting
            return fixed ? 'absolute' : 'static'
        });
        const menuWidth = computed(() => {
            if(collapsed.value){
                return settingStore.menuSetting.minMenuWidth;
            }
            return settingStore.menuSetting.menuWidth;
        });
        const minMenuWidth = computed(() => settingStore.menuSetting.minMenuWidth);
        const inverted = computed(() => ['dark', 'mix-dark'].includes(navTheme.value));
        const headerInverted = computed(() => {
            return ['light', 'mix-dark'].includes(navTheme.value) ? unref(inverted) : !unref(inverted)
        });

        /* 监听屏幕宽度改变 */
        function watchScreenWidth() {
            const { mobileWidth } = settingStore.menuSetting;
            if(document.body.clientWidth <= mobileWidth){
                settingStore.setCollapse(true);
            }else{
                settingStore.setCollapse(false);
            }
        }
        onMounted(() => {
            // 全局loading-bar挂载在 window 方便与在js中使用
            Reflect.set(window, '$loading', useLoadingBar());
            const loading = Reflect.get(window, '$loading');
            loading && loading.finish();

            window.addEventListener('resize', watchScreenWidth);
        });

        return {
            collapsed,
            showAside,
            inverted,
            headerInverted,
            menuWidth,
            minMenuWidth,
            fixedHeader,
            fixedMenu: fixedHeader,
            fixedTagsView: computed(() => settingStore.tagsViewSetting.fixed),// 标签是否固定
            showTagsView: computed(() => settingStore.tagsViewSetting.show),// 标签是否显示
            isDark: computed(() => settingStore.themeSetting.isDark),// 是否为暗色主题
        }
    }
})
</script>

<style lang="scss" scoped>
.layout{
    width: 100%;
    height: 100%;
    .layout-sider {
        min-height: 100vh;
        box-shadow: 2px 0 8px 0 rgb(29 35 41 / 5%);
        position: relative;
        z-index: 13;
        transition: all 0.2s ease-in-out;
    }
    .light-bg {
        background: #f5f7f9;
    }
    .dark-bg{
        background: #101014;
    }
    .layout-content {
        margin: 0 10px 10px;
        position: relative;
        padding-top: $header-height;
        &.layout-content-fixed{
            padding-top: 0;
        }
    }
    .layout-main{
        padding-top: 0;
        &.layout-main-fixed{
            padding-top: 44px;
        }
    }
    .no-tags-view {
        padding-top: 0;
        margin-top: 0.75rem;
    }
    .i-tags-view-fixed {
        position: fixed;
        z-index: 5;
        padding: 6px 19px 6px 10px;
        left: 200px;
    }
    .i-tags-view-fixed-header {
        top: 0;
    }
}
.n-layout-header.n-layout-header--absolute-positioned{
    z-index: 100;
}
</style>