# [PostgreSQL `DATE_TRUNC` Function](http://www.postgresqltutorial.com/postgresql-date_trunc/)

```sql
SELECT date_trunc('hour', TIMESTAMP '2017-03-17 02:09:30');
-- 2017-03-17 02:00:00

SELECT date_trunc('minute', TIMESTAMP '2017-03-17 02:09:30');
-- 2017-03-17 02:09:00
```

按月分组

```sql
SELECT
    date_trunc('month', rental_date) m,
    COUNT(rental_id)
FROM
    rental
GROUP BY
    m
ORDER BY
    m;
```

按年分组

```sql
SELECT
    staff_id,
    date_trunc('year', rental_date) y,
    COUNT(rental_id) rental
FROM
    rental
GROUP BY
    staff_id,
    y
ORDER BY
    staff_id;
```