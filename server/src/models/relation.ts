/**
 * 处理各个表之间建立外键联系
 */
import Class from './Class'
import Student from './Student'
import Admin from './Admin'

Class.hasMany(Student);
Student.belongsTo(Class);

Student.hasOne(Admin);// 一对一 Admin 表里有studentId
Admin.belongsTo(Student);

console.log('外键建立连接完成');