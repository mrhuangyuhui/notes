# [ExpressJS - Debugging](https://gitee.com/mrhuangyuhui/notes/tree/master/tutorials/node/learn-expressjs/expressjs_debugging.md)

<https://www.tutorialspoint.com/expressjs/expressjs_debugging.htm>

```bash
# 打印所有日志信息
DEBUG=express:* node index.js
# 打印 application 和 express 日志信息
DEBUG=express:application,express:router node index.js
```