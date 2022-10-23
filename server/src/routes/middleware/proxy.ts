import { ParameterizedContext, Next } from 'koa'
import k2c from 'koa2-connect'
import { createProxyMiddleware } from 'http-proxy-middleware'

/**
 * 代理中间件
 * /data/api/movie => http://yuanjin.tech:5100/api/movie
 */
export default async function (ctx: ParameterizedContext, next: Next) {
    const context = '/data'
    const proxy = createProxyMiddleware(context, {
        target: 'http://yuanjin.tech:5100',
        pathRewrite(path){
            return path.substring(context.length)
        },
    })
    return await k2c(proxy)(ctx, next)
}