import { defineStore } from 'pinia'
import { authEnum, userEnum } from '@/enums/userEnum'
import { getCookie, setCookie, delCookie } from '@/utils/auth'
import { login, getUserInfo, logout } from '@/api/user'
import { useTagsViewStore } from './tagsView'
import { statusCodeEnum } from '@/enums/statusCodeEnum'

type IUserInfo = {
    id?: string
    mobile?: string
    name?: string
}

export type IState = {
    user_type: userEnum | undefined
    user_info: IUserInfo | null
    permissions: string[] | null
}

/**
 * 用户相关的状态
 */
export const useUserStore = defineStore({
    id: 'app-user',
    state: (): IState => ({
        user_type: getCookie(authEnum.USER_TYPE) as userEnum | undefined,
        user_info: null,
        permissions: null,
    }),
    actions: {
        setUserType(type: userEnum){// 设置用户类型
            this.user_type = type;
            setCookie(authEnum.USER_TYPE, type);
        },
        setPermissions(perm: string[] | null) {// 设置用户权限
            this.permissions = perm;
        },
        setUserInfo(info: object | null){// 设置用户信息
            this.user_info = info;
        },
        async login(params: { loginId: string, loginPwd: string, captcha: string }, type: userEnum){// 登录
            try{
                const resp = await login(params, type);
                if(resp.code === statusCodeEnum.success){
                    return true;// 这里返回数据方便登录的时候判断状态
                }else{
                    window.$message.error(resp.msg || '登录失败')
                    return false;
                }
            } catch(error){
                return Promise.reject(error);
            }
        },
        async getInfo(){// 获取用户信息
            try {
                const resp = await getUserInfo({ type: this.user_type! });
                if(resp.code === statusCodeEnum.success){
                    const { info, permissions } = resp.data;
                    this.setUserInfo(info);
                    this.setPermissions(permissions);
                    return { info, permissions }
                }else{
                    window.$message.error(resp.msg || '获取用户信息失败')
                    return {}
                }
            } catch (error) {
                return Promise.reject(error);
            }
        },
        async logout(){// 登出
            await logout()
            delCookie(authEnum.ACCESS_TOKEN)
            this.setUserInfo(null);
            this.setPermissions(null);
            // 清除tags-views
            const tagsViewStore = useTagsViewStore();
            tagsViewStore.closeAllTags();
            return Promise.resolve(true);
        }
    }
})