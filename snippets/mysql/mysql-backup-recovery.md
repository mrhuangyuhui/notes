# MySQL BAckup & Recovery

备份

```bash
mysqldump -h 127.0.0.1 -uroot  -p example_db example_tb > example_backup.sql
```

恢复

```bash
mysql> source example_backup.sql;
```