import Router from '@koa/router'
import { Next, ParameterizedContext } from 'koa'
import { login, getAdminById } from '../../services/adminService'
import { getMenus } from '../../services/menusService'
import { getSuccess, getError } from '../getSendResult'
import { encrypt } from '../../utils/crypt'
import { jwtPublish } from '../middleware/jwt'

/**
 * 用户/管理员
 */

const router = new Router({
    prefix: '/api/admin'
})

router.get('/whoami', async (ctx: ParameterizedContext) => {
    const id: number = ctx.state.userId || -1;
    const result = await getAdminById(id)
    if(result.length > 0){
        ctx.body = getSuccess({
            ...result[0].Student
        });
    }else{
        ctx.body = getError();
    }
})

// 默认使用jwt登录
router.post('/login', async (ctx: ParameterizedContext) => {
    const result = await login(ctx.request.body);
    if(result){// 登录成功
        jwtPublish(ctx, { id: result.id });
        ctx.body = getSuccess(result);
    }else{// 登录失败
        ctx.body = getError('登录失败', 1002);
    }
})

// 使用cookie登录
router.post('/login4cookie', async (ctx: ParameterizedContext) => {
    const result = await login(ctx.request.body);
    if(result){// 登录成功
        const value = encrypt(result.id.toString());// 加密
        ctx.cookies.set('token', value, {
            path: '/',
            domain: 'localhost',
            maxAge: 7*24*3600*1000,
            httpOnly: true,
            signed: false,
        })
        ctx.set('authorization', value);// 如果用户不是使用浏览器
        ctx.body = getSuccess(result);
    }else{// 登录失败
        ctx.body = getError('登录失败', 1002);
    }
})

// 使用session登录
router.post('/login4session', async (ctx: ParameterizedContext) => {
    const result = await login(ctx.request.body);
    if(result){// 登录成功
        const value = encrypt(result.id.toString());// 加密
        ctx.session.userId = value;
        ctx.body = getSuccess(result);
    }else{// 登录失败
        ctx.body = getError('登录失败', 1002);
    }
})

// 分不同角色登录
router.post('/oauth/token', async (ctx: ParameterizedContext) => {
    const { scope, type } = ctx.query;
    let isSucc = false;
    if(scope === 'app' && type === '1'){
        isSucc = true;
    }
    else if(scope === 'app' && type === '2'){
        isSucc = true;
    }
    else if(scope === 'server'){
        isSucc = true;
    }

    if(isSucc){
        // 验证验证码
        if(!captchaAdmin(ctx)){
            ctx.status = 401;
            ctx.body = getError('验证码错误', 401);
            return;
        }
        const result = await login(ctx.request.body);
        if(!result){
            ctx.body = getError('账号或密码错误', 414)
        }else{
            const token = jwtPublish(ctx, { id: result.id });
            ctx.body = getSuccess({ token });
        }
    }else{
        ctx.body = getError('登录失败', 1002);
    }
})

function captchaAdmin(ctx: ParameterizedContext) {
    if('captcha' in ctx.request.body){
        const reqCaptcha = ctx.request.body?.captcha?.toLowerCase();//用户传递的验证码
        if(reqCaptcha !== ctx.session.captcha){
            // 验证码有问题
            return false;
        }else{
            return true;
        }
    }else{
        return false;
    }
}

// 获取用户信息
router.get('/loginInfo', async (ctx: ParameterizedContext) => {
    const id: number = ctx.state.userId || -1;
    const result = await getAdminById(id);
    if(result.length > 0){
        ctx.body = getSuccess({
            info: { ...result[0].Student },
            permissions: null
        })
    }else{
        ctx.body = getError('找不到该用户', 1002);
    }
})

// 登出
router.delete('/logout', async (ctx: ParameterizedContext) => {
    ctx.body = getSuccess(null)
})

// 获取菜单
router.get('/menus', async (ctx: ParameterizedContext) => {
    ctx.body = getSuccess(await getMenus())
})

export default router.routes()