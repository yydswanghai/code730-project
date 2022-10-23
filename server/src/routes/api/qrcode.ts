import Router from '@koa/router'
import { ParameterizedContext } from 'koa'
import QRCode from 'qrcode'
import jimp from 'jimp'
import { getSuccess, getError } from '../getSendResult'
import { resolve } from 'path'

/**
 * 二维码
 */

const router = new Router({
    prefix: '/api/qrcode'
})

router.post('/', async (ctx: ParameterizedContext) => {
    const str = ctx.request.body.str;
    if(str){
        try {
            const result = await QRCode.toDataURL(str);
            ctx.body = getSuccess({ url: result })
        } catch (error) {
            ctx.body = getError('其他错误', 10020)
        }
    }else{
        ctx.body = getError('请求体参数为空', 10020)
    }
})

/**
 * 添加中间logo水印
 * @param waterFile 水印图
 * @param originFile 原图
 * @param targetPath 生成后的水印图放置的目标路径
 * @param proportion 水印图以原图为基础缩小多少倍显示
 */
async function mark(waterFile, originFile, targetPath, proportion = 5) {
    const [water, origin] = await Promise.all([
        jimp.read(waterFile),
        jimp.read(originFile),
    ])

    // 对水印图片进行缩放
    const scale = (origin.bitmap.width / proportion) / water.bitmap.width;
    water.scale(scale);

    // 计算位置
    const x = (origin.bitmap.width - (origin.bitmap.width / proportion)) /2;
    const y = (origin.bitmap.height - (origin.bitmap.height / proportion)) /2;

    // 写入水印
    origin.composite(water, x, y, {
        mode: jimp.BLEND_SOURCE_OVER,
        opacitySource: 1,
        opacityDest: 1
    })
    const jimpObj = await origin.write(targetPath)

    try {
        return await jimpObj.getBase64Async(jimp.MIME_PNG)
    } catch (err) {
        console.log(err)
        return null;
    }
}

router.post('/custom', async (ctx: ParameterizedContext) => {
    const str = ctx.request.body.str;
    if(str){
        const tempStamp = Date.now().toString().slice(-6);
        const randomStr = Math.random().toString(36).slice(-6);
        const filename = `${tempStamp}-${randomStr}.png`

        const waterPath = resolve(__dirname, '../../../public/img/qrcode-water.jpeg');
        const targetPath = resolve(__dirname, '../../../public/upload/', filename);
        const originFile = resolve(__dirname, '../../../public/origin/', filename);

        try {
            await QRCode.toFile(originFile, str)
            const result: any = await mark(waterPath, originFile, targetPath)
            ctx.body = getSuccess({ url: result })
        } catch (error) {
            ctx.body = getError('其他错误', 10020)
        }
    }else{
        ctx.body = getError('请求体参数为空', 10020)
    }
})

export default router.routes()