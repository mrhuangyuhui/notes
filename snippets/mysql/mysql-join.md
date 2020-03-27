# MySQL 联结查询

<https://dev.mysql.com/doc/refman/5.7/en/join.html>

```sql
-- 查询晒单记录详情
SELECT
    record.*, log.op_name,
    log.op_phone,
    log.remark,
    log.create_time AS op_time
FROM
    tcbj_receipt_payback_record record
-- log.type = 1 属于联结查询条件 要放到 ON 里
LEFT JOIN tcbj_receipt_payback_log log ON (
    record.id = log.other_id
    AND log.type = 1
)
WHERE
    record.id = 2
ORDER BY
    log.create_time;
```