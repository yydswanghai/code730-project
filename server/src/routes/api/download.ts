import Router from '@koa/router'
import { ParameterizedContext } from 'koa'
import { resolve } from 'path'
import { getSuccess } from '../getSendResult'
import { promises } from 'fs'
import send from 'koa-send'
/**
 * 下载
 * 下载相关的headers
 * Content-Disposition: attachment
 * 指示如何处理响应内容: 以附件形式下载
 * Accept-Ranges: bytes
 * 是否支持断点续传，使用字节数，null为不支持
 */

const router = new Router({
    prefix: '/api/download'
})

// 获取/upload目录下的全部文件
router.get('/all', async (ctx: ParameterizedContext) => {
    const files = await promises.readdir(resolve(__dirname, '../../../public/upload/'));
    ctx.body = getSuccess(files)
})
// 下载
router.get('/:filename', async (ctx: ParameterizedContext) => {
    const absPath = ctx.params.filename;
    const resourcesDir = resolve(__dirname, '../../../public/upload/');
    ctx.attachment(absPath);
    await send(ctx, absPath, { root: resourcesDir });
})

/**
 * 断点续传
 * 例如在请求头里如果有：Range: bytes=1310720-1512672
 * 说明这里仅下载规定的范围内的字节
 * 可以在 const absPath 处添加一个断电，然后使用迅雷下载查看具体的断点续传操作
 * download()默认是支持断点续传
 */

/**
 * HEAD请求
 * 在语意上和 GET请求 相同，意思是得到一个 GET请求 的消息头
 */

export default router.routes()