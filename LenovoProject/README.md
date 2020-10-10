# 部署步骤

1. 安装 docker 及 docker-compose

2. 运行命令

    ```bash
    sudo docker-compose up -d
    ```

# 目录结构

```bash
LenovoProject
├── build-java              # 后端镜像构建目录(springboot:lenovo)
│   ├── python_dependency       # python 依赖离线包
│   ├── docker-entrypoint.sh    # 入口脚本
│   └── Dockerfile
├── build-mysql             # 数据库镜像构建目录(mysql:1.0_lenovo)
│   ├── docker-entrypoint.sh    # 入口脚本
│   ├── Dockerfile
│   ├── lenovo-data.sql         # 数据库数据 sql 文件
│   └── lenovo-schema.sql       # 数据库结构 sql 文件
├── lenovo-java             # 后端运行时目录
|   └─── target                 # jar 包
├── lenovo-mysql            # 数据库运行时目录
│   ├─── conf.d                 # 数据库配置文件
|   └─── data                   # 数据库映射目录（运行时创建）
├── lenovo-nginx            # nginx 运行时目录
│   ├── conf.d                  # nginx 配置目录
│   └── dist                    # 前端映射目录
├── docker-compose.yml
└── README
```

# 文件位置

## 数据库文件

`build-mysql/lenovo-data.sql`
`build-mysql/lenovo-schema.sql`

修改数据库文件后需要重新 `build`

## springboot 后端程序(jar包)

`lenovo-java/target/`

## vue 前端程序

`lenovo-nginx/dist/`