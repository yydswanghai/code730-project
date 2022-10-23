import { defineStore } from 'pinia'
import { toRaw } from 'vue'
import { constantRouter, asyncRouter } from '@/router'
import { IRouteRecordRaw } from '@/router/types'
import { PageEnum } from '@/enums/pageEnum'
import { userEnum } from '@/enums/userEnum'
import { statusCodeEnum } from '@/enums/statusCodeEnum'
import { useUserStore } from './user'
import { getUserMenu } from '@/api/user'
import { Layout } from '@/router/constant'
import { renderIcon } from '@/utils/'
import * as $icons from '@/icons/'
import { isExternal } from '@/utils/'

export type IState = {
    routes: IRouteRecordRaw[]
    menus: IRouteRecordRaw[]
    keepAliveComponents: string[]
}
/**
 * 动态路由相关的状态
 */
export const useAsyncRouteStore = defineStore({
    id: 'async-route',
    state: (): IState => ({
        routes: [],// 用户路由
        menus: [],// 菜单 用于生成侧边栏
        keepAliveComponents: [],// 缓存组件
    }),
    getters: {
        getUserStore(){// 用户状态
            return useUserStore()
        },
    },
    actions: {
        setRoutes(routers: IRouteRecordRaw[]){// 设置路由
            this.routes = constantRouter.concat(routers);
        },
        setMenus(menus: IRouteRecordRaw[]) {// 设置菜单
            // 根据控制台的hidden决定是否添加到菜单中
            const DashboardRoute = constantRouter.find(it => it.name === PageEnum.HOME_NAME)!;
            if(!DashboardRoute.meta.hidden){
                this.menus = [DashboardRoute, ...menus];
            }else{
                this.menus = menus;
            }
        },
        setKeepAliveComponents(compNames: string[]) {// 设置需要缓存的组件
            this.keepAliveComponents = compNames;
        },
        /**
         * 生成路由
         * 后台用户根据接口生成
         * 其他用户，属于router/modules目录下的路由，通过权限列表去分配
         */
        async generateRoutes(data: any){
            let accessedRouters: IRouteRecordRaw[] = [];
            const permissionsList: string[] = data.permissions || [];// 权限列表
            if(this.getUserStore.user_type == userEnum.system){
                const menus = await fetchMenu();
                if(menus?.length){
                    accessedRouters = menus;
                }
            }else{
                accessedRouters = permissionsList.length ?
                asyncRouter.filter(it => permissionsList.includes(it.name)) : asyncRouter
            }

            this.setMenus(accessedRouters)
            this.setRoutes(accessedRouters)
            return toRaw(accessedRouters)
        }
    }
});

/**
 * 请求接口获取菜单
 */
async function fetchMenu(){
    try {
        const resp = await getUserMenu();
        if(resp.code === statusCodeEnum.success){
            const routerList = formatRouter(resp.data)
            const routerTree = convert(routerList)
            const routerMap = addSelf(routerTree)
            asyncImportRoute(routerMap);
            return routerMap;
        }else{
            window.$message.error(resp.msg || '请求获取菜单失败');
            return [];
        }
    } catch (error) {
        window.$message.error('请求获取菜单发生了错误');
    }
}
/**
 * 1. 格式化接口数据
 */
function formatRouter(resData: any[]) {
    return resData.map(item => {
        let icon = null;
        if(item.meta_icon){// 处理icon
            // 如果icons目录下能找到这个icon名的组件就返回，否则返回null
            const iconComponent = renderIcon(($icons as any)[item.meta_icon]);
            if(Boolean(iconComponent)){
                icon = iconComponent;
            }
        }
        const meta = {// 处理meta
            title: item.meta_title,
            icon: icon,
            sort: item.meta_sort,
            hidden: item.meta_hidden,
            keepAlive: item.meta_keep_alive,
            alwaysShow: item.meta_always_show,
            affix: item.meta_affix
        }
        const routerInfo = {
            id: item.id,
            parent_id: item.parent_id,
            path: isExternal(item.path) ? `/${item.path}` : item.path,// 外部链接
            name: item.name,
            permission: item.permission,
            type: item.type,
            meta,
            component: item.component,
            children: []
        }
        return routerInfo;
    })
}
/**
 * 2. 将一维数组转换成树形数组
 */
function convert(list: any[]) {
    const newList = []
    const map = list.reduce((pre, cur) => {
        pre[cur.id] = cur
        return pre
    }, {})
    for (const item of list) {
        if(item.parent_id === '-1'){
            newList.push(item)
            continue
        }
        if(item.parent_id in map){
            const parent = map[item.parent_id]
            parent.children = parent.children || []
            parent.children.push(item)
        }
    }
    return newList
}
/**
 * 3. 给parent_id为-1并且没有子路由，用于显示自己本身
 */
function addSelf(list: any[]): IRouteRecordRaw[] {
    return list.map(item => {
        if(item.parent_id === '-1' && item.children.length === 0){
            item.children = item.children || []
            item.children.push({
                id: Number(`${item.id}10`),
                parent_id: item.id,
                path: '',
                name: `${item.name}Index`,
                component: `${item.path}/index`,
                permission: item.permission,
                type: item.type,
                meta: item.meta,
            })
        }
        return item;
    })
}
/**
 * 4. 查找views中对应的组件文件
 */
const viewsModules: Record<string, any> = import.meta.glob('@/views/menus/**/*.{vue,tsx}', { eager: true });
function asyncImportRoute(routers: IRouteRecordRaw[]) {
    if (!routers) return
    routers.forEach(item => {
        const { component, children } = item;
        if(component){
            if(component === 'LAYOUT'){
                item.component = Layout;
            }else{
                item.component = dynamicImport(viewsModules, component as string);
            }
        }
        children?.length && asyncImportRoute(children)
    })
}
/**
 * 4. 动态导入组件
 */
function dynamicImport(viewsModules: Record<string, any>, component: string) {
    const matchKeys = Object.keys(viewsModules).filter(key => {
        // 去除首 '/src/views/menus/' 和尾 '.vue' 字符
        const k = key.replace('/src/views/menus', '').replace('.vue', '');
        return k === component;
    });
    if(matchKeys?.length === 1){
        const matchKey = matchKeys[0];
        return viewsModules[matchKey].default
    }
    if(matchKeys?.length > 1){
        console.warn(
            '请不要创建.vue，和在views/menus文件夹下的相同层次目录中，具有相同文件名的tsx文件。这将导致动态引入失败'
        )
        return;
    }
}