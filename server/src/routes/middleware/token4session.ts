import { getError } from '../getSendResult'
import { decrypt } from '../../utils/crypt'
import { pathToRegexp } from 'path-to-regexp'
import { ParameterizedContext, Next } from 'koa'

const needTokenApi = [// 需要鉴权的api
    { method: 'POST', path: '/api/student' },
    { method: 'PUT', path: '/api/student/:id' },
    { method: 'GET', path: '/api/student' },
    { method: 'GET', path: '/api/admin/whoami' }
]

export default async function (ctx: ParameterizedContext, next: Next) {
    // 判断api是否需要token，请求方式和请求请求路径都匹配
    const apis = needTokenApi.filter(api => {
        const reg = pathToRegexp(api.path);
        return api.method === ctx.method && reg.test(ctx.path);
    })
    if(apis.length === 0){
        await next();
        return;
    }

    console.log(ctx.session)
    const token = ctx.session.userId;
    if(!token){// 没有认证
        ctx.status = 403;
        ctx.body = getError('你还没有认证身份');
        return;
    }
    // 认证通过，先解密
    const userId = decrypt(token);
    ctx.state.userId = Number(userId);
    await next();
}