# [PostgreSQL FETCH](http://www.postgresqltutorial.com/postgresql-fetch/)

获取第一条记录

```sql
SELECT
    film_id,
    title
FROM
    film
ORDER BY
    title FETCH FIRST ROW ONLY;
```

获取第一条记录（和上一条语句是等价的）

```sql
SELECT
    film_id,
    title
FROM
    film
ORDER BY
    title FETCH FIRST 1 ROW ONLY;
```

获取前五条记录

```sql
SELECT
    film_id,
    title
FROM
    film
ORDER BY
    title FETCH FIRST 5 ROW ONLY;
```

从第 6 条记录开始，获取 5 条记录。

```sql
SELECT
    film_id,
    title
FROM
    film
ORDER BY
    title OFFSET 5 ROWS FETCH FIRST 5 ROW ONLY;
```