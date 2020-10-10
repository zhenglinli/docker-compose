FROM mysql:5.7.18

# mysql的工作位置
ENV WORK_PATH /usr/local/

#定义会被容器自动执行的目录
ENV AUTO_RUN_DIR /docker-entrypoint-initdb.d

# 初始化数据库的SQL
ENV FILE_0 lenovo-schema.sql
ENV FILE_1 lenovo-data.sql

#执行SQL
ENV INSTALL_DATA_SHELL docker-entrypoint.sh

COPY ./$FILE_0 $WORK_PATH/
COPY ./$FILE_1 $WORK_PATH/
COPY ./$INSTALL_DATA_SHELL $AUTO_RUN_DIR/

#给执行文件增加可执行权限
RUN chmod a+x $AUTO_RUN_DIR/$INSTALL_DATA_SHELL