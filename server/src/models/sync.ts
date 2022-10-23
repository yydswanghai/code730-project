/**
 * 同步所有的模型
 */
import { sequelize } from './db'
import './Admin'
import './Class'
import './Student'
import './Book'
import './Menus'

// 同步所有模型
sequelize.sync({ alter: true }).then(() => {
    console.log('所有模型同步成功！')
})