import { createCipheriv, createDecipheriv } from "crypto"
/**
 * 对称加密：aes
 */
// 128位(16字节)的密钥，无意义
const secret = Buffer.from('23b14d64-be37-43')
// iv，随机向量
const iv = Buffer.from('p9dhbrp1v8s3rgvr')
/**
 * 加密
 * @param str 被加密的数据
 */
export function encrypt(str: string){
    // 得到一个加密函数
    const cry = createCipheriv('aes-128-cbc', secret, iv);
    // 加密使用格式 utf-8，输出的字符串格式为 hex (16进制)
    let result = cry.update(str, 'utf-8', 'hex');
    result += cry.final('hex');
    return result;
}
/**
* 解密
* @param str 加密过后的字符串
*/
export function decrypt(str: string){
    // 得到一个解密函数
    const decry = createDecipheriv('aes-128-cbc', secret, iv);
    // 加密过后的字符串格式 hex，输出的字符串为 utf-8
    let result = decry.update(str, 'hex', 'utf-8');
    result += decry.final('utf-8');
    return result;
}
