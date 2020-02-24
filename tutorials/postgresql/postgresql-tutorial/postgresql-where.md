# [PostgreSQL WHERE](http://www.postgresqltutorial.com/postgresql-where/)

```sql
SELECT
    last_name,
    first_name
FROM
    customer
WHERE
    first_name = 'Jamie';
```

```sql
SELECT
    last_name,
    first_name
FROM
    customer
WHERE
    first_name = 'Jamie'
AND last_name = 'Rice';
```

```sql
SELECT
    customer_id,
    amount,
    payment_date
FROM
    payment
WHERE
    amount <= 1
OR amount >= 8;
```