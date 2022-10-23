import cors from '@koa/cors'
import { ParameterizedContext } from 'koa'

export default cors({
    origin: function (ctx: ParameterizedContext) {//设置允许来自指定域名请求
        // 允许跨域白名单
        const whiteList = ['https://127.0.0.1:5500', 'http://localhost:9527', 'null']
        if('origin' in ctx.header && whiteList.includes(ctx.header.origin!)){
            return ctx.header.origin
        }
    },
    credentials: true, //是否允许发送Cookie
})