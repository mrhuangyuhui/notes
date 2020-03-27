# [PostgreSQL GROUP BY](http://www.postgresqltutorial.com/postgresql-group-by/)

分组子句一般和聚合函数一起使用

查询每位客户的消费总额

```sql
SELECT
    customer_id,
    SUM(amount)
FROM
    payment
GROUP BY
    customer_id;
```

查询每位客户的消费总额，并从高到低排序。

```sql
SELECT
    customer_id,
    SUM(amount)
FROM
    payment
GROUP BY
    customer_id
ORDER BY
    SUM(amount) DESC;
```

查询每位员工处理的交易数

```sql
SELECT
    staff_id,
    COUNT(payment_id)
FROM
    payment
GROUP BY
    staff_id;
```