# [PostgreSQL LIKE](http://www.postgresqltutorial.com/postgresql-like/)

`%` 代表字符串

`_` 代表单个字符

```sql
SELECT
    first_name,
    last_name
FROM
    customer
WHERE
    first_name LIKE '%er%';
```

```sql
SELECT
    first_name,
    last_name
FROM
    customer
WHERE
    first_name LIKE '_her%';
```

```sql
SELECT
    first_name,
    last_name
FROM
    customer
WHERE
    first_name NOT LIKE 'Jen%';
```

不区分大小写

```sql
SELECT
    first_name,
    last_name
FROM
    customer
WHERE
    first_name ILIKE 'BAR%';
```