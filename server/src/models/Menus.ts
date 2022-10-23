import { sequelize } from './db'
import { DataTypes } from 'sequelize'

export default sequelize.define('SysMenus', {
    parent_id: {
        type: DataTypes.STRING,
        allowNull: false// 不允许为null
    },
    path: {
        type: DataTypes.STRING,
        allowNull: false
    },
    name: {
        type: DataTypes.STRING,
        allowNull: false
    },
    type: {
        type: DataTypes.BOOLEAN,
        allowNull: false
    },
    permission: {
        type: DataTypes.STRING,
    },
    component: {
        type: DataTypes.STRING,
        allowNull: false
    },
    redirect: {
        type: DataTypes.STRING,
    },
    meta_sort: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    meta_title: {
        type: DataTypes.STRING,
        allowNull: false
    },
    meta_icon: {
        type: DataTypes.STRING,
    },
    meta_keep_alive: {
        type: DataTypes.BOOLEAN,
        allowNull: false
    },
    meta_hidden: {
        type: DataTypes.BOOLEAN,
        allowNull: false
    },
    meta_always_show: {
        type: DataTypes.BOOLEAN,
        allowNull: false
    },
    meta_affix: {
        type: DataTypes.BOOLEAN,
        allowNull: false
    }
}, {
    createdAt: false,
    updatedAt: false,
    paranoid: true,// 从此以后该表的数据不会真正的删除，而是增加一列deleteAt，记录删除时间
});