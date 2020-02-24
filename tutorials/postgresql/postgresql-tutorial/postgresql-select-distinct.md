# [PostgreSQL SELECT DISTINCT](http://www.postgresqltutorial.com/postgresql-select-distinct/)

```sql
CREATE TABLE t1(
    ID serial NOT NULL PRIMARY KEY,
    bcolor VARCHAR,
    fcolor VARCHAR
);
```

```sql
INSERT INTO t1(bcolor, fcolor)
VALUES
    ('red', 'red'),
    ('red', 'red'),
    ('red', NULL),
    (NULL, 'red'),
    ('red', 'green'),
    ('red', 'blue'),
    ('green', 'red'),
    ('green', 'blue'),
    ('green', 'green'),
    ('blue', 'red'),
    ('blue', 'green'),
    ('blue', 'blue');
```

```sql
SELECT
    ID,
    bcolor,
    fcolor
FROM
    t1;
```

```sql
SELECT DISTINCT
    bcolor
FROM
    t1
ORDER BY
    bcolor;
```

```sql
SELECT DISTINCT
    bcolor,
    fcolor
FROM
    t1
ORDER BY
    bcolor,
    fcolor;
```

```sql
SELECT DISTINCT
    ON(bcolor) bcolor,
    fcolor
FROM
    t1
ORDER BY
    bcolor,
    fcolor;
```

> Notice that the `DISTINCT ON` expression must match the leftmost expression in the `ORDER BY` clause.