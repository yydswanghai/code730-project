<template>
    <div class="header-left">
        <!-- 菜单收起 -->
        <div class="left-gap trigger" @click="toggleCollapse">
            <n-icon size="18" v-if="collapsed"><MenuUnfoldOutlined /></n-icon>
            <n-icon size="18" v-else><MenuFoldOutlined /></n-icon>
        </div>
        <!-- 刷新 -->
        <div class="left-gap trigger" v-if="isReload" @click="reload">
            <n-icon size="18"><ReloadOutlined /></n-icon>
        </div>
        <!-- 面包屑 -->
        <Breadcrumb />
    </div>
</template>

<script lang="ts">
import { defineComponent, computed, inject } from 'vue'
import { useProjectSettingStore } from '@/store/modules/projectSetting'
import { MenuUnfoldOutlined, MenuFoldOutlined, ReloadOutlined } from '@vicons/antd'
import { Breadcrumb } from '../Breadcrumb/'

export default defineComponent({
    name: 'HeaderLeft',
    components: {
        Breadcrumb,
        MenuUnfoldOutlined,
        MenuFoldOutlined,
        ReloadOutlined,
    },
    props: {
        collapsed: Boolean
    },
    setup(){
        const settingStore = useProjectSettingStore()
        /* 刷新 */
        return {
            reload: inject<() => void>('reload'),
            toggleCollapse: computed(() => settingStore.toggleCollapse),
            isReload: computed(() => settingStore.headerSetting.isReload),
            collapsed: computed(() => settingStore.collapsed)
        }
    }
})
</script>
<style lang="scss" scoped>
.header-left{
    display: flex;
    align-items: center;
    .left-gap{
        margin-left: 0.25rem;
    }
}
</style>