import { ParameterizedContext, Next } from 'koa'
import k2c from 'koa2-connect'
import { apiLogger } from '../../utils/logger'
import { connectLogger } from 'log4js'

/**
 * 自定义日志
 */
// export default async function (ctx, next) {
//     await next();
//     apiLogger.debug(`${req.method} ${req.path} ${req.ip}`)
// }
export default async function (ctx: ParameterizedContext, next: Next) {
    return await k2c(connectLogger(apiLogger, {
        level: 'auto',
        // format: ':remote-addr :method :url',
        nolog: '\\.css|\\.js$'
    }))(ctx, next)
}