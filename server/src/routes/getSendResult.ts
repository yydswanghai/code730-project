/**
 * 服务器API响应格式
 */

// 返回一个错误的结果
export function getError(msg: string = 'server internal error', code: number = 500) {
    return {
        code,
        msg
    }
}

// 返回一个正常的结果
export function getSuccess(data: any, code: number = 0) {
    return {
        code,
        msg: 'ok',
        data
    }
}