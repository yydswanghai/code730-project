import axios from 'axios'
import type { AxiosInstance, AxiosRequestConfig, AxiosResponse } from 'axios'
import { statusCodeEnum } from '@/enums/statusCodeEnum'
import { authEnum } from '@/enums/userEnum'
import { getCookie, setCookie, delCookie } from '@/utils/auth'

// 加载环境变量
const { VITE_PROXY_PATH } = import.meta.env;

export interface Result {
    code: number
    msg: string
}

export interface ResultData<T = any> extends Result {
    data?: T
}

class RequestHttp {
    service: AxiosInstance;
    constructor(){
        /**
         * 创建 axios 实例
         */
        this.service = axios.create({
            baseURL: VITE_PROXY_PATH,
            timeout: 20000,// 超时时间
            withCredentials: true// 跨域时候允许携带凭证
        })
        /**
         * 请求拦截
         */
        this.service.interceptors.request.use((config: AxiosRequestConfig) => {
            let headers = config.headers;
            // 1. 发送请求的时候，如果有token，需要附带到请求头中
            const token = getCookie(authEnum.ACCESS_TOKEN);
            if(token){
                headers!.authorization = `bearer ${token}`
            }
            return {
                ...config,
                headers,
            }
        },error => {
            return Promise.reject(error);
        })
        /**
         * 响应拦截
         */
        this.service.interceptors.response.use((resp: AxiosResponse) => {
            // 2. 响应的时候，如果有token，保存token到客户端
            if (resp.headers.authorization) {
                setCookie(authEnum.ACCESS_TOKEN, resp.headers.authorization)
            }
            return resp.data;
        },error => {
             // 3. 响应的时候，如果响应的消息码是403（没有token，token失效），在本地删除token
            if (error.response.status === statusCodeEnum.overdue) {
                delCookie(authEnum.ACCESS_TOKEN)
                const message = Reflect.get(window, '$message') || null
                message && message.error(error.response.data?.msg);
            }
            return Promise.reject(error);
        })
    }

    // 常用方法封装
    request(config: AxiosRequestConfig<any>): Promise<ResultData<any>>{
        return this.service.request(config)
    }
    get<T = any>(url: string, config?: AxiosRequestConfig): Promise<ResultData<T>> {
        return this.service.get(url, config);
    }
    post<T = any>(url: string, data?: any, config?: AxiosRequestConfig): Promise<ResultData<T>> {
        return this.service.post(url, data, config);
    }
    put<T = any>(url: string, data?: any, config?: AxiosRequestConfig): Promise<ResultData<T>> {
        return this.service.put(url, data, config);
    }
    delete<T = any>(url: string, config?: AxiosRequestConfig): Promise<ResultData<T>> {
        return this.service.delete(url, config);
    }
}

export const http = new RequestHttp()