# 第 2 章 MySQL 安装部署和入门

## 2.6 MySQL 的主要参数设置

`innodb_buffer_pool_size` 建议设置为机器物理内存大小的 70% ~ 80%

`innodb_log_file_size` 建议设置为 256MB 或更大

`innodb_flush_log_at_trx_commit` 建议设置为2

`sync_binlog` 建议设置为0

