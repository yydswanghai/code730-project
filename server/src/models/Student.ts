import { sequelize } from './db'
import { DataTypes } from 'sequelize'
import { utc } from 'moment'

export interface StudentAttributes {
    name: string
    birthday: string
    sex: boolean
    mobile: string
}

export default sequelize.define('Student', {
    name: {
        type: DataTypes.STRING,
        allowNull: false// 不允许为null
    },
    birthday: {
        type: DataTypes.DATE,
        allowNull: false,
        get() {
            return this.getDataValue('birthday')?.getTime()
        },
    },
    age: {
        type: DataTypes.VIRTUAL,
        get() {
            const now = utc();
            const birth = utc(this.getDataValue('birthday'));
            return now.diff(birth, 'y')
        },
    },
    sex: {
        type: DataTypes.BOOLEAN,
        allowNull: false
    },
    mobile: {
        type: DataTypes.STRING(11),
        allowNull: false
    },
}, {
    createdAt: false,
    updatedAt: false,
    paranoid: true,// 从此以后该表的数据不会真正的删除，而是增加一列deleteAt，记录删除时间
});