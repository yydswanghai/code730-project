/**
 * 该方法用来使obj的属性有效
 * 传入一个对象obj 和该对象需要被保留的属性
 * 返回的新对象只包含该传入的props属性
 */
export function pick(obj, ...props: string[]) {
    if(!obj || typeof obj !== 'object') return obj;

    const newObj = {};
    for (const key in obj) {
        // 如果传入的属性在obj中说明属于他原来的属性，则添加到newObj
        if(props.includes(key)){
            newObj[key] = obj[key];
        }
    }

    return newObj;
}