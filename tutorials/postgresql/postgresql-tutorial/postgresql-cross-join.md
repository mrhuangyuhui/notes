# [PostgreSQL Cross Join](http://www.postgresqltutorial.com/postgresql-cross-join/)

创建测试表和测试数据

```sql
CREATE TABLE T1(label CHAR(1) PRIMARY KEY);

CREATE TABLE T2(score INT PRIMARY KEY);

INSERT INTO T1(label)
VALUES
    ('A'),
    ('B');

INSERT INTO T2(score)
VALUES
    (1),
    (2),
    (3);
```

查询两个表的笛卡尔积

```sql
SELECT
    *
FROM
    T1
CROSS JOIN T2;
```