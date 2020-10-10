# Build

## 自签名 ssl 证书

```bash
# In Directory `./NC_nginx/ssl_certs
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ./nginx-selfsigned.key -out ./nginx-selfsigned.crt
```

```bash
Country Name (2 letter code) [XX]:CN
State or Province Name (full name) []:BJ
Locality Name (eg, city) [Default City]:BJ
Organization Name (eg, company) [Default Company Ltd]:ZL
Organizational Unit Name (eg, section) []:NextCloud
Common Name (eg, your name or your server’s hostname) []:your-host-or-ip
Email Address []:email@email.com
```

## 修改 host 或 ip

```bash
server {
    listen 80;
    listen [::]:80;
    server_name your-host-or-ip;
    ...
}

server {
    listen 443 ssl http2;
    listen [::]:443 ssl http2;
    server_name your-host-or-ip;
    ...
}
```

# RUN

```bash
sudo docker-compose up -d
```

# Config

## 连接数据库

浏览器打开 `https://your-host-or-ip`，点击 `存储与数据库`,选择 `MySQL/MariaDB`:

- 数据库用户：  `root`
- 数据库密码：  `nextcloud`
- 数据库名:     `nextcloud`
- 数据库主机:   `mariadb`

点击 `安装完成`,等待完成配置。

## 配置 Redis

```bash
# In file ./NC_nextcloud/config/config.php
{
    ...
  'memcache.local' => '\\OC\\Memcache\\APCu',
  'memcache.locking' => '\\OC\\Memcache\\Redis',
  'redis' => array (
      'host' => 'redis',
      'port' => '6379',
  ),
  ...
}
```
