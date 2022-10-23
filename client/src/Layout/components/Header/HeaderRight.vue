<template>
    <div class="header-right">
        <!-- 搜索 -->
        <div class="trigger">
            <n-tooltip placement="bottom">
                <template #trigger>
                    <n-icon size="18"><SearchOutlined /></n-icon>
                </template>
                <span>搜索</span>
            </n-tooltip>
        </div>
        <!-- 外部链接 -->
        <div class="trigger">
            <n-tooltip placement="bottom">
                <template #trigger>
                    <n-icon size="18">
                        <a href="https://github.com/" target="_blank" style="color: inherit;">
                            <GithubFilled />
                        </a>
                    </n-icon>
                </template>
                <span>github</span>
            </n-tooltip>
        </div>
        <!--切换全屏-->
        <div class="trigger">
            <n-tooltip placement="bottom">
                <template #trigger>
                    <n-icon size="18">
                        <component :is="fullscreenIcon" @click="toggleFullScreen" />
                    </n-icon>
                </template>
                <span>全屏</span>
            </n-tooltip>
        </div>
        <!-- 个人中心 -->
        <div class="trigger">
            <n-dropdown class="header-user-dropdown" trigger="hover" :options="userOptions" @select="handleDropdown">
                <div class="user">
                    <n-avatar round :src="avatar" class="avatar" />
                </div>
            </n-dropdown>
        </div>
        <!--设置-->
        <div class="trigger" @click="openSetting">
            <n-tooltip placement="bottom">
                <template #trigger>
                    <n-icon size="18"><SettingOutlined /></n-icon>
                </template>
                <span>修改设置</span>
            </n-tooltip>
        </div>
    </div>
    <!--app全局设置-->
    <AppSetting ref="appSettingRef" />
</template>

<script lang="ts">
import { defineComponent, ref, h, onMounted } from 'vue'
import { useRouter } from 'vue-router'
import { useUserStore } from '@/store/modules/user'
import { SearchOutlined, GithubFilled, FullscreenOutlined, FullscreenExitOutlined, UserOutlined, SettingOutlined } from '@vicons/antd'
import { userEnum } from '@/enums/userEnum'
import { PageEnum } from '@/enums/pageEnum'
import { AppSetting } from '../AppSetting/'
import { DropdownOption, DropdownRenderOption } from 'naive-ui'
import Avatar3 from '@/assets/avatar-3.svg?url'
import Avatar2 from '@/assets/avatar-2.svg?url'
import Avatar1 from '@/assets/avatar-1.svg?url'

export default defineComponent({
    name: 'HeaderRight',
    components: {
        SearchOutlined,
        GithubFilled,
        FullscreenOutlined,
        FullscreenExitOutlined,
        UserOutlined,
        SettingOutlined,
        AppSetting,
    },
    setup(){
        const $router = useRouter();
        const userStore = useUserStore();
        /* 个人中心 */
        const avatar = ref();// 用户头像
        enum IDropdownEnum {
            个人设置 = 1,
            退出登录 = 2
        }
        const userOptions: Array<DropdownOption | DropdownRenderOption> = [
            { label: '个人设置', key: IDropdownEnum.个人设置 },
            { label: '退出登录', key: IDropdownEnum.退出登录 },
        ]
        /**
         * 渲染自定义下拉菜单
         * @param {string} userType 用户类型
         * @param {string} name 用户名称
         * @param {string} desc 用户描述
         */
        function renderCustomHeader(userType: string, name: string, desc: string = '整条街最靓的仔') {
            return h('div', { class: 'custom' }, [
                h('div', { class: 'custom-title' }, [
                    h('span', { class: 'user-type' }, { default: () => userType }),
                    h('span', { class: 'user-name' }, { default: () => name })
                ]),
                h('div', { class: 'custom-desc' }, { default: () => desc })
            ])
        }
        let vNode: any = null
        let username = userStore.user_info?.name || '';
        if(userStore.user_type == userEnum.system){
            avatar.value = Avatar3;
            vNode = renderCustomHeader('后台用户', username);
        }else if(userStore.user_type == userEnum.user2){
            avatar.value = Avatar2;
            vNode = renderCustomHeader('组织用户', username);
        }else{
            avatar.value = Avatar1;
            vNode = renderCustomHeader('普通用户', username);
        }
        userOptions.unshift(...[
            { key: 'header-render', type: 'render', render: () => vNode },
            { key: 'header-divider', type: 'divider' }
        ]);
        async function handleDropdown(key: number) {// 用户下拉菜单
            if(key === IDropdownEnum.个人设置){
                console.log('个人设置')
            }else{
                await userStore.logout()
                $router.push(PageEnum.LOGIN)
            }
        }
        /* 全屏 */
        const fullscreenIcon = ref('FullscreenOutlined');
        // 切换全屏图标
        function toggleFullscreenIcon() {
            fullscreenIcon.value = document.fullscreenElement !== null ? 'FullscreenExitOutlined' : 'FullscreenOutlined'
        }
        // 全屏切换
        function toggleFullScreen() {
            if (!document.fullscreenElement) {
                document.documentElement.requestFullscreen();
            } else {
                if (document.exitFullscreen) {
                    document.exitFullscreen();
                }
            }
        }
        onMounted(() => {
            // 监听全屏切换事件
            document.addEventListener('fullscreenchange', toggleFullscreenIcon)
        })
        /* 设置 */
        const appSettingRef = ref();
        // 打开设置
        function openSetting() {
            appSettingRef.value?.openSetting()
        }

        return {
            avatar,
            userOptions,
            fullscreenIcon,
            appSettingRef,
            handleDropdown,
            toggleFullScreen,
            openSetting,
        }
    }
})
</script>
<style lang="scss" scoped>
.header-right{
    display: flex;
    align-items: center;
    margin-right: 20px;
    .user{
        display: flex;
        align-items: center;
        height: $header-height;
        .avatar{
            position: relative;
            overflow: visible;
            &::before{
                content: "";
                display: block;
                height: 100%;
                width: 100%;
                border-radius: 999px;
                position: absolute;
                z-index: -1;
                animation: wave 1.5s ease-out infinite;
                background: #2d3e37fc;
            }
        }
    }
}
</style>
<style lang="scss">
.header-user-dropdown{
    .custom{
        padding: 8px 8px;
        .custom-title{
            font-size: 13px;
            .user-type{
                color: #f80;
                margin-right: 4px;
            }
            .user-name{
                color: rgb(24,25,28);
            }
        }
        .custom-desc{
            font-size: 12px;
            color: rgb(118, 124, 130);
        }
    }
}
@keyframes wave {
    25%{
        opacity: .75;
        transform: scale(1);
    }
    50%{
        opacity: .5;
        transform: scale(1.1);
    }
    75%{
        opacity: .25;
        transform: scale(1.2);
    }
    100%{
        opacity: 0;
        transform: scale(1.3);
    }
}
</style>