import { configure, getLogger, shutdown } from 'log4js'
import { resolve } from 'path'

function getAppenders(dirname: string) {
    return {
        type: 'dateFile',// 类型：带日期的文件类型，根据时间来备份日志
        filename: resolve(__dirname, '../../logs', dirname, 'logging.log'),
        pattern: 'yyyy-MM-dd',// 每天备份
        keepFileExt: true,// 保留文件后缀
        layout: {// 自定义日志前面的
            type: 'pattern',
            pattern: '%c [%d{yyyy-MM-dd hh:mm:ss}] [%p]: %m%n',
        },
    }
}

configure({
    appenders: {// 日志出口
        default: {// 默认日志
            type: 'stdout', // 控制台输出
        },
        sql: getAppenders('sql'),
        api: getAppenders('api'),
    },
    categories: {// 日志分类
        default: {
            appenders: ['default'],
            level: 'all'
        },
        sql: {
            appenders: ['sql'],// 该分类使用出口sql的配置写入日志
            level: 'all'
        },
        api: {
            appenders: ['api'],
            level: 'all'
        }
    }
})

// 程序崩溃时记录完剩下的日志
process.on('exit', () => {
    shutdown()
})

export const defaultLogger = getLogger()
export const sqlLogger = getLogger('sql')
export const apiLogger = getLogger('api')