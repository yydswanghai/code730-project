<template>
    <div class="logo">
        <img src="~@/assets/logo-2.svg?url" :class="{ 'margin-right': !collapsed }" />
        <div class="title" v-show="!collapsed">vueNaiveAdmin</div>
    </div>
</template>

<script lang="ts">
import { defineComponent, computed } from 'vue'
import { useProjectSettingStore } from '@/store/modules/projectSetting'
export default defineComponent({
    name: 'Logo',
    setup(){
        const settingStore = useProjectSettingStore();
        return {
            collapsed: computed(() => settingStore.collapsed)
        }
    }
})
</script>
<style lang="scss" scoped>
.logo{
    height: 4rem;
    line-height: 1.5;
    white-space: normal;
    overflow: hidden;
    display: flex;
    align-items: center;
    justify-content: center;
    img{
        width: auto;
        height: 2rem;
        &.margin-right{
            margin-right: 0.5rem;
        }
    }
    .title{
        font-size: 16px;
        margin-bottom: 0px;
    }
}
</style>