# [PostgreSQL LIMIT](https://gitee.com/mrhuangyuhui/notes/blob/master/tutorials/postgresql/postgresql-tutorial/postgresql-limit.md)

<http://www.postgresqltutorial.com/postgresql-limit/>

获取前五条记录

```sql
SELECT
    film_id,
    title,
    release_year
FROM
    film
ORDER BY
    film_id
LIMIT 5;
```

从第 4 条记录开始，获取 4 条记录。

```sql
SELECT
    film_id,
    title,
    release_year
FROM
    film
ORDER BY
    film_id
LIMIT 4 OFFSET 3;
```

获取前十条记录

```sql
SELECT
    film_id,
    title,
    rental_rate
FROM
    film
ORDER BY
    rental_rate DESC
LIMIT 10;
```