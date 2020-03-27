# [PostgreSQL Alias](http://www.postgresqltutorial.com/postgresql-alias/)

```sql
SELECT
    first_name || ' ' || last_name AS full_name
FROM
    customer
ORDER BY
    full_name;
```