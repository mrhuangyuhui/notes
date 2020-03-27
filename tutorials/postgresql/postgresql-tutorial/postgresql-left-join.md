# [PostgreSQL LEFT JOIN](http://www.postgresqltutorial.com/postgresql-left-join/)

```sql
SELECT
    film.film_id,
    film.title,
    inventory_id
FROM
    film
LEFT JOIN inventory ON inventory.film_id = film.film_id;
```

把另一个表中的空白记录筛选出来

```sql
SELECT
    film.film_id,
    film.title,
    inventory_id
FROM
    film
LEFT JOIN inventory ON inventory.film_id = film.film_id
WHERE
    inventory.film_id IS NULL;
```