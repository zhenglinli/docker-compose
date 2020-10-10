FROM innobead/python3-jdk8-docker

# python 依赖离线包的存放位置
ENV PYTHON_DEPENDENCY_PATH /usr/local/python_dependency

# 添加 python 依赖目录
ADD python_dependency ${PYTHON_DEPENDENCY_PATH}

# 容器入口文件
COPY ./docker-entrypoint.sh /docker-entrypoint.sh
ENTRYPOINT ["bash", "/docker-entrypoint.sh"]

# 启动 spring boot 后端程序
# WORKDIR /target
# CMD ["java", "-Dfile.encoding=utf-8", "-jar", "lenovo-back-*-SNAPSHOT.jar"]
