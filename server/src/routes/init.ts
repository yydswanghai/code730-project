import Koa from 'koa'
import { ParameterizedContext } from 'koa'
import http from 'http'
import { resolve } from 'path'
import koaStatic from 'koa-static'
import { historyApiFallback } from 'koa2-connect-history-api-fallback'
import koaBody from 'koa-body'
import session from 'koa-session'
import tokenMid from './middleware/token4jwt'
import corsMid from './middleware/cors'
import proxyMid from './middleware/proxy'
import apiLogMid from './middleware/apiLog'
import imageProtectMid from './middleware/imageProtect'
import adminRouter from './api/admin'
import uploadRouter from './api/upload'
import downloadRouter from './api/download'
import qrcodeRouter from './api/qrcode'
import captchaMid from './api/captcha'
import bookRouter from './api/book'

const app = new Koa();
const server = http.createServer(app.callback());

app.keys = ['i secret for wanghai']
const CONFIG = {
    key: 'koa.sessid',
    maxAge: 86400 * 1000,
    overwrite: true,
    httpOnly: true,
    signed: false,
    rolling: false,
    renew: false
}
app.use(session(CONFIG, app))
app.use(imageProtectMid)
app.use(corsMid)
app.use(koaBody())// 处理请求
// app.use(proxyMid)
app.use(apiLogMid)
app.use(tokenMid)
app.use(historyApiFallback({
    whiteList: ['/api']
}))
app.use(koaStatic(
    resolve(__dirname, '../../public/'),
    {
        // 关于后端设置请求缓存
        // setHeaders(res: ParameterizedContext["res"], path: string){
        //     if(!path.endsWith('.html')){// 不缓存 html 文件
        //         res.setHeader('Cache-Control', `max-age=${3600*24}`)
        //     }
        // }
    }
))

app.use(captchaMid)
app.use(adminRouter)
app.use(uploadRouter)
app.use(downloadRouter)
app.use(qrcodeRouter)
app.use(bookRouter)

app.on('error', (err, ctx) => {
    console.error(err)
})

server.listen(9525, () => console.log('server listening 9525'))