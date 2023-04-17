1. 需要安装nodejs (nodejs 版本16.16.0 https://nodejs.org/en/)
2. 导入数据库 结构和数据 (使用navicat或其他数据库工具)
3. 分别安装客户端和服务端依赖
    * cd 到 client 目录下运行 `npm i`
    * cd 到 server 目录下运行 `npm i`
4. 进入到连接数据库的目录: server/models/db.ts

```ts
// 参数一：数据库db名  参数二：数据库账号  参数三：数据库密码
new Sequelize('schooldb', 'root', 'root123567', {
    host: 'localhost',// 本地连接
    dialect: 'mysql',// 数据库驱动类型
})
```

5. 然后就可以运行，具体脚本在`package.json`里
