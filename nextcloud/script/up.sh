
###
 # @Date         : 2020-10-11 10:59:26
 # @LastEditors  : LiZhenglin
 # @LastEditTime : 2020-10-15 20:04:37
 # @FilePath     : /nextcloud/script/up.sh
### 

#!/bin/bash

# 使用现有网络，将 NET 设为现有网络名称
NET="NC_network"

# 创建新网络
docker network create $NET

docker run -d --name=NC_redis --network $NET --restart=always redis
# 数据库 Root 密码为 nextcloud，数据库名为 nextcloud
docker run -d --name=NC_mariadb --network $NET -v /mnt/usb/mysql:/var/lib/mysql -e "MYSQL_ROOT_PASSWORD=nextcloud" -e "MYSQL_DATABASE=nextcloud" --restart=always mariadb
# 映射 /var/www/html 目录，若 config 及 data 目录映射至其他位置，单独映射 /var/www/config 及 /var/www/data 目录
docker run -d --name=NC_nextcloud --network $NET -v /root/nextcloud/NC_nextcloud:/var/www/html -v /mnt/usb/nextcloud/config:/var/www/html/config -v /mnt/usb/nextcloud/data:/var/www/html/data --link NC_mariadb:mariadb --link NC_redis:redis --restart=always nextcloud:stable-fpm
# 映射 80 及 443 端口，在 nginx 配置文件中将 80 端口重定向到 443
docker run -d --name=NC_nginx --network $NET -p 80:80 -p 443:443 -v /root/nextcloud/NC_nextcloud:/var/www/html -v /root/nextcloud/NC_nginx/conf.d:/etc/nginx/conf.d -v /root/nextcloud/NC_nginx/ssl_certs:/etc/nginx/ssl_certs --link NC_nextcloud:nextcloud --restart=always nginx
