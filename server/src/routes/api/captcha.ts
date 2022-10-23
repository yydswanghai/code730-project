import Router from '@koa/router'
import { ParameterizedContext } from 'koa'
import svgCaptcha from 'svg-captcha'

/**
 * 验证码
 */

const router = new Router({
    prefix: '/api/captcha'
})

router.get('/', async (ctx: ParameterizedContext) => {
    const captcha = svgCaptcha.create({
        size: 4,// 验证码长度
        ignoreChars: 'iTlLoO',// 验证码字符中排除这些
        noise: 2,// 干扰线条的数量
        color: true,// 验证码的字符是否有颜色
    })
    // 把验证码中的文本存放到session中
    ctx.session.captcha = captcha.text.toLowerCase();
    // console.log(ctx.session)

    ctx.response.type = 'image/svg+xml';
    ctx.body = captcha.data
})

/**
 * 其他敏感操作验证：同一小段时间内(duration)操作的次数超过(repeat)次则需要进行验证
 * 该函数运行在对应的router里
 */
function captchaHandler(ctx: ParameterizedContext) {
    if(!ctx.session.records){
        // 如果session总没有访问记录
        ctx.session.records = [];
    }
    const now = new Date().getTime();
    ctx.session.records.push(now);// 讲这次请求的访问时间记录下来

    // 如果在一小段时间内请求达到了一定的数量，就可能是机器
    const duration = 1000 * 10;
    const repeat = 3;

    ctx.session.records = ctx.session.records.filter(
        (time) => now - time <= duration
    );

    // 一小段时间内请求大于repeat次 或 请求体里有 captcha 字段
    if(ctx.session.records.length >= repeat || 'captcha' in ctx.request.body){
        // 验证验证码
        const reqCaptcha = ctx.request.body?.captcha?.toLowerCase();//用户传递的验证码
        if(reqCaptcha !== ctx.session.captcha){
            // 验证码有问题
            return false;
        }else{
            return true;
        }
    }else{
        return true;
    }
}

export default router.routes()