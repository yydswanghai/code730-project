<template>
    <n-breadcrumb v-if="crumbsSetting.show">
        <template v-for="routeItem in breadcrumbList" :key="routeItem.name + nanoid()">
            <n-breadcrumb-item>
                <n-dropdown
                    v-if="routeItem.children.length"
                    :options="routeItem.children"
                    @select="dropdownSelect"
                    >
                    <span class="link-text">
                        <component
                            v-if="crumbsSetting.showIcon && routeItem.meta.icon"
                            :is="routeItem.meta.icon"
                        />
                        {{ routeItem.meta.title }}
                    </span>
                </n-dropdown>
                <span v-else class="link-text">
                    <component
                        v-if="crumbsSetting.showIcon && routeItem.meta.icon"
                        :is="routeItem.meta.icon"
                    />
                    {{ routeItem.meta.title }}
                </span>
            </n-breadcrumb-item>
        </template>
    </n-breadcrumb>
</template>

<script lang="ts">
import { useProjectSettingStore } from '@/store/modules/projectSetting'
import { useRoute, useRouter } from 'vue-router'
import { defineComponent ,computed } from 'vue'
import { nanoid } from 'nanoid'

export default defineComponent({
    name: 'Breadcrumb',
    setup(){
        const $route = useRoute();
        const $router = useRouter();
        const settingStore = useProjectSettingStore();

        // 生成面包屑
        function generator(routerMap: any[]) {
            return routerMap.map(it => {
                const currentMenu = {
                    ...it,
                    label: it.meta.title,
                    key: it.name,
                    disabled: it.path === '/',
                }
                // 是否有子菜单，并递归处理
                if(it.children && it.children.length > 0){
                    currentMenu.children = generator(it.children)
                }
                return currentMenu
            })
        }
        // 当前面包屑数组
        const breadcrumbList = computed(() => {
            return generator($route.matched)
        })
        // 下拉选择对应的面包屑
        function dropdownSelect(key: string) {
            $router.push({ name: key })
        }

        return {
            crumbsSetting: computed(() => settingStore.crumbsSetting),
            breadcrumbList,
            dropdownSelect,
            nanoid,
        }
    }
})
</script>