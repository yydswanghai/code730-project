import { http } from './http'

// 文件上传
export function upload(data: any) {
    return http.request({
        method: 'post',
        url: '/upload',
        data,
    })
}

export function uploadMultiple(data: any) {
    return http.request({
        method: 'post',
        url: '/uploads',
        data,
    })
}

export function upload2water(data: any) {
    return http.request({
        method: 'post',
        url: '/upload2water',
        data,
    })
}

// 获取所有可以下载的文件
export function getAllFiles() {
    return http.request({
        method: 'get',
        url: '/download/all',
    })
}