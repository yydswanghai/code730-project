import Router from '@koa/router'
import { Next, ParameterizedContext } from 'koa'
import multer from '@koa/multer'
import { resolve, extname } from 'path'
import { getSuccess, getError } from '../getSendResult'
import jimp from 'jimp'

/**
 * 上传
 */

const router = new Router({
    prefix: '/api'
})
// 文件存储路径
const getPublicPath = (path: string) => {
    return resolve(__dirname, '../../../public/', path)
}
// 文件访问路径
const getAccessPath = (path: string) => {
    return 'http://localhost:9525/' + path
}

// 磁盘存储引擎可以让你控制文件的存储
const storage = multer.diskStorage({
    // 是用来确定上传的文件应该存储在哪个文件夹中
    destination: function (res, file, cb) {// 这种方式需要手动自己添加文件目录
        if(file.fieldname === 'image-water'){// 水印图单独放一个目录
            cb(null, getPublicPath('waterImg/'))
            return;
        }
        if(file.fieldname === 'image-target'){// 原图目录
            cb(null, getPublicPath('origin/'))
            return;
        }
        cb(null, getPublicPath('upload/'))
    },
    // 用于确定文件夹中的文件名的确定
    filename: function (req, file, cb) {
        const tempStamp = Date.now();
        const randomStr = Math.random().toString(36).slice(-6);
        const ext = extname(file.originalname);
        const filename = `${tempStamp}-${randomStr}${ext}`
        cb(null, filename)
    }
})
// 设置
const upload = multer({
    storage,
    limits: { fileSize: 5 * 1024 * 1024 },
    fileFilter(req, file, cb){
        // 验证文件后缀名
        const extName = extname(file.originalname);
        const whiteList = ['.jpg', '.jpeg', '.png', '.gif', '.webp']
        if(whiteList.includes(extName)){
            cb(null, true);
        }else{
            cb(new Error(`不支持 ${extName} 后缀名，来上传文件`))
        }
    }
});

// 单张图片上传
router.post('/upload', async (ctx: ParameterizedContext, next: Next) => {
    const err = await upload.single('image-single')(ctx, next)
                .then(res => res)
                .catch(err => err)

    if(err){
        console.error(err)
        ctx.body = getError('上传文件出错', 1004)
    }else{
        const url= getAccessPath(`upload/${ctx.file.filename}`)
        ctx.body = getSuccess({ url })
    }
})
// 多张图片上传
router.post('/uploads', async (ctx: ParameterizedContext, next: Next) => {
    const err = await upload.fields([{ name: 'image-multiple'}])(ctx, next)
                .then(res => res)
                .catch(err => err)

    if(err){
        console.error(err)
        ctx.body = getError('上传文件出错', 1004)
    }else{
        const files: any[] = [];
        ctx.files['image-multiple'].forEach(item => {
            files.push({
                filename: item.filename,
                url: getAccessPath(`upload/${item.filename}`)
            })
        })
        ctx.body = getSuccess(files)
    }
})

/**
 * 加水印
 * @param waterFile 水印图
 * @param originFile 原图
 * @param targetPath 生成后的水印图放置的目标路径
 * @param proportion 水印图以原图为基础缩小多少倍显示
 */
async function mark(waterFile, originFile, targetPath, proportion = 5, marginProportion = 0.01) {
    const [water, origin] = await Promise.all([
        jimp.read(waterFile),
        jimp.read(originFile),
    ])

    // 对水印图片进行缩放
    const scale = (origin.bitmap.width / proportion) / water.bitmap.width;
    water.scale(scale);

    // 计算位置
    const right = origin.bitmap.width * marginProportion;// 距离右下角右边的距离
    const bottom = origin.bitmap.height * marginProportion;// 距离右下角下边的距离
    const x = origin.bitmap.width - right - water.bitmap.width;
    const y = origin.bitmap.height - bottom - water.bitmap.height;

    // 写入水印
    origin.composite(water, x, y, {
        mode: jimp.BLEND_SOURCE_OVER,
        opacitySource: 0.5,
        opacityDest: 1
    })

    await origin.write(targetPath)
}
// 上传加水印
router.post('/upload2water', async (ctx: ParameterizedContext, next: Next) => {
    const err = await upload.fields([{ name: 'image-target'}, { name: 'image-water' }])(ctx, next)
                .then(res => res)
                .catch(err => err)

    if(err){
        console.error(err)
        ctx.body = getError('上传文件出错', 1004)
    }else{
        const water: any = ctx.files['image-water'][0];
        const targets: any[] = ctx.files['image-target'];
        const files: any[] = [];
        // 上传至服务器的访问地址
        const waterPath = getPublicPath(`waterImg/${water.filename}`);
        targets.forEach(async (item) => {
            const originPath = getPublicPath(`origin/${item.filename}`);
            const targetPath = getPublicPath(`upload/${item.filename}`);
            mark(waterPath, originPath, targetPath)
            files.push({
                filename: item.filename,
                url: getAccessPath(`upload/${item.filename}`)
            })
        })
        ctx.body = getSuccess(files)
    }
})

export default router.routes()
