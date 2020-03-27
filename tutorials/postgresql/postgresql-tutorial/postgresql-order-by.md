# [PostgreSQL ORDER BY](http://www.postgresqltutorial.com/postgresql-order-by/)

```sql
SELECT
    first_name,
    last_name
FROM
    customer
ORDER BY
    first_name ASC;
```

```sql
SELECT
    first_name,
    last_name
FROM
    customer
ORDER BY
    last_name DESC;
```

```sql
SELECT
    first_name,
    last_name
FROM
    customer
ORDER BY
    first_name ASC,
    last_name DESC;
```

> Notice that the SQL standard only allows you to sort rows based on the columns that appear in the `SELECT` clause. However, PostgreSQL allows you to sort rows based on the columns that even does not appear in the selection list.