import { extend, validators } from 'validate.js'
import { utc, MomentInput, MomentFormatSpecification } from 'moment'
/**
 * 1. 设置时间验证器，因为使用validate里的datetime之前必须要设置解析和格式函数
 * 2. 保证服务器的时间一定为utc时间
 * utc: 世界协调时，以英国格林威治时间为标准
 * utc时间与北京时间相差8小时，例如: utc的凌晨相当于北京时间的上午8点
 */

extend(validators.datetime, {
    /**
     * 该函数会自动用于日期格式转换
     * 它会在验证时自动触发，它需要将任何数据转换为时间戳返回
     * 如果无法转换，返回NaN
     * @param {*} value 传入要转换的值
     * @param {*} options 针对某个属性的验证配置
     */
    parse(value: MomentInput, options){
        let formats: MomentFormatSpecification = ['YYYY-MM-DD HH:mm:ss', 'yyyy-M-D H:m:s', 'x'];
        if(options.dateOnly){// 如果为真，则只允许日期（不是日期时间）。默认错误是必须是有效日期
            formats = ['YYYY-MM-DD', 'yyyy-M-D', 'x'];
        }
        return +utc(value, formats, true);
    },
    /**
     * 用户显示错误消息时，使用的显示字符串
     */
    format(value: MomentInput, options){
        let formats: MomentFormatSpecification = 'YYYY-MM-DD';
        if(!options.dateOnly){// 没有设置只允许日期，则为日期时间
            formats += " HH:mm:ss"
        }
        return +utc(value).format(formats);
    }
})