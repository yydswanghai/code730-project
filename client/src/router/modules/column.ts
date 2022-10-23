import { IRouteRecordRaw } from '@/router/types'
import { Layout } from '@/router/constant'
import { renderIcon } from "@/utils/"
import { Columns } from '@/icons'


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
        path: '/column',
        name: 'Column',
        component: Layout,
        redirect: '/column/A',
        meta: { title: '多级栏目', icon: renderIcon(Columns) },
        children: [
            {
                path: 'A',
                name: 'Column-A',
                component: () => import('@/views/menus/column/index-a.vue'),
                redirect: '/column/A/1',
                meta: { title: '栏目A' },
                children: [
                    {
                        path: '1',
                        name: 'Column-A-1',
                        component: () => import('@/views/menus/column/index-a-1.vue'),
                        meta: { title: '栏目A-1' }
                    },
                    {
                        path: '2',
                        name: 'Column-A-2',
                        component: () => import('@/views/menus/column/index-a-2.vue'),
                        meta: { title: '栏目A-2' }
                    },
                ]
            },
            {
                path: 'B',
                name: 'Column-B',
                component: () => import('@/views/menus/column/index-b.vue'),
                meta: { title: '栏目B' },
                children: [
                    {
                        path: '1',
                        name: 'Column-B-1',
                        component: () => import('@/views/menus/column/index-b-1.vue'),
                        meta: { title: '栏目B-1' }
                    },
                    {
                        path: '2',
                        name: 'Column-B-2',
                        component: () => import('@/views/menus/column/index-b-2.vue'),
                        meta: { title: '栏目B-2' },
                        children: [
                            {
                                path: 'X',
                                name: 'Column-B-2-X',
                                component: () => import('@/views/menus/column/index-b-2-x.vue'),
                                meta: { title: '栏目B-2-X' }
                            },
                            {
                                path: 'Y',
                                name: 'Column-B-2-Y',
                                component: () => import('@/views/menus/column/index-b-2-y.vue'),
                                meta: { title: '栏目B-2-Y' }
                            },
                        ]
                    },
                ]
            },
            {
                path: 'C',
                name: 'Column-C',
                component: () => import('@/views/menus/column/index-c.vue'),
                meta: { title: '栏目C' }
            }
        ]
    }
]

export default routes;