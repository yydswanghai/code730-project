import Book, { BookAttributes } from '../models/Book'
import { validate } from 'validate.js'
import { utc } from 'moment'
import { Op } from 'sequelize'

// 添加
export async function addBook(obj: BookAttributes) {
        const data = {// 设置默认值
            ...obj,
            publishDate: obj.publishDate || utc().format('yyyy-MM-DD'),
            description: obj.description || '',
        }
        const result = validate(data, {
            name: {
                presence: {
                    allowEmpty: false,
                    message: '书籍名称不能为空'
                },
                type: {
                    type: 'string',
                    message: '书籍名称必须为字符串'
                },
            },
            author: {
                presence: {
                    allowEmpty: false,
                    message: '作者不能为空'
                },
                type: {
                    type: 'string',
                    message: '作者必须为字符串'
                },
            }
        })
        if(!result){// 验证通过
            const ins = await Book.create(data);
            return ins.toJSON();
        }else{
            console.log(result)
            return null;
        }
}

// 删除
export async function deleteBook(id: number) {
    return await Book.destroy({
        where: { id }
    })
}

// 更新
// 注意：如果 deletedAt 字段有值，也就是删除了是无法更新数据库该字段大
export async function updateBook(id: number, obj) {
    return await Book.update(obj, {
        where: { id }
    })
}

// 通过id查询
export async function getBookById(id: number) {
    const result = await Book.findByPk(id);
    if(result){
        return result.toJSON();
    }
    return null;
}

// 分页查询
export interface BookPaging {
    page?: number
    pageSize?: number
    keywords?: string
}
export async function getBooks({ page = 1, pageSize = 10, keywords = '' }: BookPaging = {}) {
    const result = await Book.findAndCountAll({
        where: {
            [Op.or]: [// 里面的两个条件是或者关系
                {
                    name: {// 条件1：姓名模糊匹配关键词
                        [Op.like]: `%${keywords}%`
                    }
                },
                {
                    author: {// 条件2：作者模糊匹配关键词
                        [Op.like]: `%${keywords}%`
                    }
                }
            ]
        },
        offset: (page - 1) * pageSize,
        limit: pageSize
    });
    return {
        total: result.count,
        datas: JSON.parse(JSON.stringify(result.rows))
    }
}