# [12.4 Control Flow Functions](https://dev.mysql.com/doc/refman/5.7/en/control-flow-functions.html)

[`CASE`](https://dev.mysql.com/doc/refman/5.7/en/control-flow-functions.html#operator_case)

条件判断函数

```sql
mysql> SELECT CASE 1 WHEN 1 THEN 'one'
    ->     WHEN 2 THEN 'two' ELSE 'more' END;
        -> 'one'
mysql> SELECT CASE WHEN 1>0 THEN 'true' ELSE 'false' END;
        -> 'true'
mysql> SELECT CASE BINARY 'B'
    ->     WHEN 'a' THEN 1 WHEN 'b' THEN 2 END;
        -> NULL
```