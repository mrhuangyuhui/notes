# MySQL 日期和时间

```sql
CREATE TABLE tcbj_redpacket_act (
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `update_time` DATETIME ON UPDATE CURRENT_TIMESTAMP,
) ENGINE = INNODB DEFAULT CHARSET = utf8 COMMENT = '店员积分红包活动主表';
```