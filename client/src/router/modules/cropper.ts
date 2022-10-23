import { IRouteRecordRaw } from '@/router/types'
import { Layout } from '@/router/constant'
import { renderIcon } from "@/utils/"
import { Cropper } from '@/icons'


/**
 * @param path 路由路径，必填，如果是外部链接会重新打开新窗口跳转到指定地址
 * @param name 路由名称，必填，且不能重名
 * @param component 组件，父路由默认都是Layout布局组件，子组件显示你自定义组件
 * @param children 选填，但是由于父组件都是布局组件，所以你至少要给它一个子组件来渲染页面
 * @param redirect 重定向
 * @param meta.title 菜单名称，必填
 * @param meta.icon 图标
 * @param meta.sort 排序
 * @param meta.hidden 在菜单栏中隐藏
 * @param meta.alwaysShow 一直显示根路由
 * @param meta.keepAlive 缓存该路由
 * @param meta.affix 固定标签
 */

const routes: Array<IRouteRecordRaw> = [
    {
        path: '/cropper',
        name: 'Cropper',
        component: Layout,
        redirect: '/cropper/index',
        meta: { title: '裁剪', icon: renderIcon(Cropper) },
        children: [
            {
                path: 'index',
                name: 'Cropper-Index',
                component: () => import('@/views/menus/cropper/index.vue'),
                meta: { title: '图片裁剪' },
            }
        ]
    }
]

export default routes;