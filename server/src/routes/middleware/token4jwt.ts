import { getError } from '../getSendResult'
import { pathToRegexp } from 'path-to-regexp'
import { jwtVerify } from './jwt'
import { JwtPayload } from 'jsonwebtoken'
import { ParameterizedContext, Next } from 'koa'

const needTokenApi = [// 需要鉴权的api
    { method: 'POST', path: '/api/student' },
    { method: 'PUT', path: '/api/student/:id' },
    { method: 'GET', path: '/api/student' },
    { method: 'GET', path: '/api/admin/whoami' },
    { method: 'GET', path: '/api/admin/loginInfo' },
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

    const token = jwtVerify(ctx);
    if(token){// 认证通过
        ctx.state.userId = (token as JwtPayload).id;
        await next();
    }else{// 认证失败
        ctx.status = 403;
        ctx.body = getError('你还没有认证身份');
    }
}