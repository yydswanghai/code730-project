import { sequelize } from './db'
import { DataTypes } from 'sequelize'

export interface ClassAttributes {
    name: string
    openDate?: string
}

export default sequelize.define('Class', {
    name: {
        type: DataTypes.STRING,
        allowNull: false// 不允许为null
    },
    openDate: {
        type: DataTypes.DATE,
        allowNull: false
    },
}, {
    createdAt: false,
    updatedAt: false,
    paranoid: true,// 从此以后该表的数据不会真正的删除，而是增加一列deleteAt，记录删除时间
});