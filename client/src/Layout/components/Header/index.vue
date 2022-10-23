<template>
    <div class="layout-header">
        <div class="header-menu" v-if="navMode === 'horizontal' || navMode === 'horizontal-mix'">
            <Logo v-if="navMode === 'horizontal'" class="logo-h" />
            <AsideMenu
                mode="horizontal"
                location="header"
                :inverted="inverted"
            />
        </div>
        <HeaderLeft v-else v-if="navMode === 'vertical'" />
        <HeaderRight />
    </div>
</template>

<script lang="ts">
import { defineComponent, computed } from 'vue'
import { useProjectSettingStore } from '@/store/modules/projectSetting'
import { Logo } from '../Logo/'
import { Menu as AsideMenu } from '../Menu/'
import HeaderLeft from './HeaderLeft.vue'
import HeaderRight from './HeaderRight.vue'
/**
 * 顶部组件
 */
export default defineComponent({
    name: 'Header',
    components: {
        Logo,
        AsideMenu,
        HeaderLeft,
        HeaderRight,
    },
    props: {
        inverted: Boolean,
    },
    setup(){
        const settingStore = useProjectSettingStore()

        return {
            settingStore,
            navMode: computed(() => settingStore.navMode),
        }
    }
})
</script>
<style lang="scss" scoped>
.layout-header{
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 0;
    height: $header-height;
    box-shadow: 0 1px 4px rgb(0 21 41 / 8%);
    transition: all 0.2s ease-in-out;
    width: 100%;
    z-index: 11;
    .header-menu{
        display: flex;
        align-items: center;
        .logo-h{
            padding-left: 10px;
            padding-right: 10px;
        }
    }
}
</style>
<style lang="scss">
.layout-header{
    .trigger{
        display: inline-block;
        width: auto;
        padding: 0 12px;
        height: $header-height;
        text-align: center;
        cursor: pointer;
        transition: all 0.2s ease-in-out;
        .n-icon {
            display: flex;
            align-items: center;
            height: $header-height;
            line-height: $header-height;
        }
        &:hover {
            background: hsla(0, 0%, 100%, 0.08);
        }
    }
}
</style>