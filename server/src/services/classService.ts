import Class, { ClassAttributes } from '../models/Class'
import { validate } from 'validate.js'
import { utc } from 'moment'

// 添加
export async function addClass(obj: ClassAttributes) {
    const data = {// 设置默认值
        ...obj,
        openDate: obj.openDate || utc().format('yyyy-MM-DD HH:mm:ss')
    }
    const result = validate(data, {
        name: {
            presence: {
                allowEmpty: false,
                message: '班级名称不能为空'
            },
            type: {
                type: 'string',
                message: '班级名称必须为字符串'
            }
        }
    })
    if(!result){// 验证通过
        const ins = await Class.create(data)
        return ins.toJSON()
    }else{
        console.log(result)
        return null;
    }
}

// 删除
export async function deleteClass(id: number) {
    return await Class.destroy({
        where: { id }
    })
}

// 更新
export async function updateClass(id: number, obj) {
    return await Class.update(obj, {
        where: { id },
    })
}

// 通过id查询
export async function getClassById(id: number) {
    const result = await Class.findByPk(id);
    if(result){
        return result.toJSON();
    }
    return null;
}

// 查询所有
export async function getClasses() {
    const result = await Class.findAll();
    return JSON.parse(JSON.stringify(result));
}