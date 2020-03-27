# [V01 Vue.js 实战教程 - 基础篇](https://learnku.com/courses/vuejs-essential)

[配套代码](https://github.com/RyunPu/vuejs-essential)

[网站预览](https://ryunpu.github.io/vuejs-essential/dist/)

[前端开发环境部署](https://learnku.com/docs/environment-setup)

下载代码

```bash
git clone git@gitee.com:mrhuangyuhui/vuejs-essential.git
```

使用 Docker Compose

```yml
version: "3"
services:
  node:
    image: "node:8.11.2"
    working_dir: /app
    environment:
      - NODE_ENV=development
      - HOST=0.0.0.0
      - PORT=8080
    volumes:
      - ./:/app
    ports:
      - "8080:8080"
    command: "npm run dev"
```
