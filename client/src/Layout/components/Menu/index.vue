<template>
    <n-menu
        :options="menus"
        :mode="mode"
        :inverted="inverted"
        :collapsed="collapsed"
        :collapsed-width="menuWidth"
        :collapsed-icon-size="20"
        :indent="24"
        :expanded-keys="openKeys"
        :value="activeValue"
        @update:value="clickMenuItem"
        @update:expanded-keys="menuExpanded"
    />
</template>

<script lang="ts">
import { defineComponent, PropType, ref, computed, watch, onMounted } from 'vue'
import { useRoute, useRouter, RouteRecordName } from 'vue-router'
import { useProjectSettingStore } from '@/store/modules/projectSetting'
import { useAsyncRouteStore } from '@/store/modules/asyncRoute'
import { isExternal } from '@/utils/'
import { IRouteRecordRaw } from '@/router/types'
import { cloneDeep } from 'lodash-es'

export default defineComponent({
    name: 'Menu',
    props: {
        mode: {// 菜单模式
            type: String as PropType<'vertical' | 'horizontal'>,
            default: 'vertical',
        },
        location: {// 菜单位置
            type: String,
            default: 'left',
        },
        inverted: Boolean,// 反转样式
    },
    setup(props, ctx){
        const $route = useRoute();
        const $router = useRouter();
        const settingStore = useProjectSettingStore();
        const asyncRouteStore = useAsyncRouteStore();
        const menus = ref<IRouteRecordRaw[] | any>([]);
        const collapsed = computed(() => settingStore.collapsed);
        const navMode = computed(() => settingStore.navMode);
        const menuWidth = computed(() => settingStore.menuSetting.minMenuWidth);
        // 获取当前打开的子菜单
        function getOpenKeys() {
            const matched = $route.matched;
            return matched && matched.length ? matched.map((it) => it.name) : []
        }
        const keys = getOpenKeys();
        const openKeys = ref(keys);// 展开的子菜单标识符 Array[]

        const selectKey = ref<string>($route.name as string);
        const headerSelectKey = ref<string>('');
        /* 当前菜单的选中值 */
        const activeValue = computed(() => {
            const { location } = props;
            if(location === 'left' || (location === 'header' && navMode.value === 'horizontal')){
                return selectKey.value;
            }else{
                return headerSelectKey.value;
            }
        });
        /* 是否是根路由 */
        function isRootRouter(router: IRouteRecordRaw) {
            return router.meta?.alwaysShow != true && router.children?.length === 1;
        }
        /* 过滤掉隐藏的菜单 */
        function filterHide(routes: IRouteRecordRaw[]) {
            return routes.filter(it => (it.meta?.hidden || false) != true)
        }
        /* 递归组装菜单格式 */
        function generatorMenu(routes: any[]) {
            return routes.map(it => {
                const isRoot = isRootRouter(it);
                const routerInfo = isRoot ? it.children[0] : it;// 当前路由信息
                const currentMenu = {// 当前菜单
                    key: routerInfo.name,
                    label: routerInfo.meta?.title,
                    icon: isRoot ? it.meta?.icon : routerInfo.meta?.icon || null,
                    path: it.path,
                    isRoot: isRoot,
                }
                // 是否有子菜单，并递归处理
                if(routerInfo.children && routerInfo.children.length > 0){
                    Reflect.set(currentMenu, 'children', generatorMenu(routerInfo.children));
                }
                return currentMenu;
            })
        }
        /* 混合菜单 */
        function generatorMenuMix(routes: IRouteRecordRaw[], routerName: RouteRecordName, location: string) {
            const newRoutes: any[] = cloneDeep(routes);
            if (location === 'header') {// 顶栏菜单 (不包含子菜单)
                return newRoutes.map(it => {
                    const isRoot = isRootRouter(it)
                    const routerInfo = isRoot ? it.children[0] : it;// 当前路由信息
                    const currentMenu = {// 当前菜单
                        key: routerInfo.name,
                        label: routerInfo.meta?.title,
                        icon: isRoot ? it.meta?.icon : routerInfo.meta?.icon || null,
                        isRoot: isRoot,
                        path: it.path,
                        children: undefined
                    }
                    return currentMenu
                })
            }else{// 左侧的菜单
                return getChildrenRouter(newRoutes.filter(it => it.name === routerName))
            }
        }
        /* 递归混合子菜单 */
        function getChildrenRouter(routes: any[]) {
            return routes.map(it => {
                const isRoot = isRootRouter(it);
                const routerInfo = isRoot ? it.children[0] : it;// 当前路由信息
                const currentMenu = {// 当前菜单
                    key: routerInfo.name,
                    label: routerInfo.meta?.title,
                    icon: isRoot ? it.meta?.icon : routerInfo.meta?.icon || null,
                    isRoot: isRoot,
                    path: it.path,
                }
                // 是否有子菜单，并递归处理
                if (routerInfo.children && routerInfo.children.length > 0) {
                    Reflect.set(currentMenu, 'children', getChildrenRouter(routerInfo.children));
                }
                return currentMenu
            })
        }
        /* 更新菜单 */
        function renderMenu() {
            const routes = filterHide(asyncRouteStore.menus);
            if(navMode.value === 'horizontal-mix'){
                const routerName = ($route.matched[0].name) || '';
                menus.value = generatorMenuMix(routes, routerName, props.location);
                headerSelectKey.value = routerName as string || '';
                if(props.location === 'header'){
                    const cur = menus.value.find((it: any) => it.path === $route.matched[0].path);
                    if(cur && cur.isRoot){
                        headerSelectKey.value = cur.key as string;
                    }
                }
            }else{
                menus.value = generatorMenu(routes);
            }
        }
        /* 点击菜单 */
        function clickMenuItem(key: string, option: any) {
            // 如果是外部链接直接另外打开一个窗口并跳转
            if (isExternal(option.path)) {
                window.open(option.path.replace(/^\//,''));
            } else {
                $router.push({ name: key });
            }
            ctx.emit('clickMenuItem', key);
        }
        /* 展开菜单 openks 是展开菜单项的 key 的数组 */
        function menuExpanded(keys: string[]) {
            if (!keys) return
            const latestOpenKey = keys.find((key) => keys.indexOf(key) === -1);
            const isExistChildren = findChildrenLen(latestOpenKey as string);
            openKeys.value = (isExistChildren ? (latestOpenKey ? latestOpenKey : []) : keys) as RouteRecordName[];
        }

        //查找是否存在子路由
        function findChildrenLen(key: string) {
            if (!key) return false
            const subRouteChildren = [];
            for (const { children, key } of menus.value) {
                if (children && children.length) {
                    subRouteChildren.push(key)
                }
            }
            return subRouteChildren.includes(key)
        }
        /* 路由地址变化时，重新渲染 */
        watch(() => $route.fullPath, () => {
            renderMenu();
            openKeys.value = $route.matched.map((item) => item.name);
            selectKey.value = $route.name as string;
        });
        /* 切换导航栏模式时，重新渲染 */
        watch(() => navMode.value, () => {
            renderMenu();
        })
        onMounted(() => {
            renderMenu();
        });
        return {
            menus,
            openKeys,
            activeValue,
            collapsed,
            menuWidth,
            clickMenuItem,
            menuExpanded
        }
    }
})
</script>