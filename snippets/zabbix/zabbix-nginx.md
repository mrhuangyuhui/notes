# Zabbix - Nginx

## [Nginx for Zabbix 3.2](https://share.zabbix.com/cat-app/web-servers/nginx-for-zabbix-3-2)

<https://github.com/oscm/zabbix/tree/master/nginx>

```bash
# 在被监控主机（192.168.31.211）执行以下命令
# 注意：要先安装 Zabbix Agent

git clone https://github.com/oscm/zabbix.git
cd zabbix/nginx

# 拷贝配置文件到 Zabbix Agent 的配置目录
cp userparameter_nginx.conf /etc/zabbix/zabbix_agentd.d/

# 拷贝执行脚本到 Zabbix Agent 的脚本目录
mkdir -p /etc/zabbix/scripts
cp nginx.sh /etc/zabbix/scripts/

# 修改执行脚本
vim /etc/zabbix/scripts/nginx.sh
# HOST 变量改成 127.0.0.1，不然读取不到 Nginx 的统计数据。
HOST="127.0.0.1"

# 修改脚本的属性
chmod +x /etc/zabbix/scripts/nginx.sh
# 测试脚本的执行结果
$ /etc/zabbix/scripts/nginx.sh accepts
184

# 配置 Nginx
$ vim /etc/nginx/nginx.conf
# 在 Server 区块添加以下配置，开启 Nginx 统计功能。
location /stub_status {
    stub_status on;
    access_log off;
    allow 127.0.0.1;
    deny all;
}

# 配置 Zabbix Server 的连接信息
$ vim /etc/zabbix/zabbix_agentd.conf
# Zabbix Server 的 IP 地址
Server=192.168.31.134
ServerActive=192.168.31.134
# 当前主机（被监控）的名称，必须与 Zabbix Wed 端配置的保持一致。
Hostname=Nginx
```

```bash
# 在 Zabbix Server（192.168.31.134）执行以下命令

yum install -y zabbix-get
# 测试返回结果
$ zabbix_get -s 192.168.31.211 -k 'nginx.status[accepts]'
256
```