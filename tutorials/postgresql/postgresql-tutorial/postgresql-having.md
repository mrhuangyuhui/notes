# [PostgreSQL HAVING](http://www.postgresqltutorial.com/postgresql-having/)

`HAVING` 一般和 `GROUP BY` 一起使用，用来筛选出满足某一条件的数据。

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

查询消费总额超过 200 的客户

```sql
SELECT
    customer_id,
    SUM(amount)
FROM
    payment
GROUP BY
    customer_id
HAVING
    SUM(amount) > 200;
```

查询每家店铺的客户总数

```sql
SELECT
    store_id,
    COUNT(customer_id)
FROM
    customer
GROUP BY
    store_id;
```

查询客户总数超过 300 的店铺

```sql
SELECT
    store_id,
    COUNT(customer_id)
FROM
    customer
GROUP BY
    store_id
HAVING
    COUNT(customer_id) > 300;
```