## 服务端

数据库：mysql

连接数据库目录: server/models/db.ts

Node-ORM：sequelize	https://github.com/demopark/sequelize-docs-Zh-CN/tree/v6

node-web应用框架：koa	https://github.com/koajs/koa  中文网 https://koa.bootcss.com/

日志：log4js https://log4js-node.github.io/log4js-node/index.html

数据验证：validate.js  https://validatejs.org/

时间：moment http://momentjs.cn/ format含义 http://momentjs.cn/docs/#/displaying/format/

* node 调试

1. 直接使用`.vscode/launch.json` 配置，然后断点

2. 在浏览器使用，`ts-node` 必须安装在本地，运行`npm run debug`