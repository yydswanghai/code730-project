import jwt from 'jsonwebtoken'
import { ParameterizedContext } from 'koa'

const secrect = 'fe-84de-22d21ca71e43'

/**
 * 颁发jwt
 */
export function jwtPublish(ctx: ParameterizedContext, info = {}, maxAge = 3600 * 24) {
    const token = jwt.sign(info, secrect, {
        expiresIn: maxAge
    })
    ctx.set('Authorization', token)
    return token;
}

/**
 * 认证jwt
 */
export function jwtVerify(ctx: ParameterizedContext) {
    let token = ctx.headers.authorization;
    if(!token){
        return null;
    }
    // authorization: bearer token (时候开头包含bearer都兼容)
    const arr = token.split(' ');
    token = arr.length === 1 ? arr[0] : arr[1];
    try {
        return jwt.verify(token, secrect);
    } catch (error) {
        console.log(error)
        return null;
    }
}