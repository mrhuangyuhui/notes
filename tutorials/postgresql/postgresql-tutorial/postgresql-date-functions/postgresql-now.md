# [PostgreSQL `NOW` Function](http://www.postgresqltutorial.com/postgresql-now/)

```sql
SELECT now();
-- 2018-06-28 21:52:38.236592+08

SELECT now()::TIMESTAMP;
-- 2018-06-28 21:52:38.2377

SELECT (now() + INTERVAL '1 hour') AS an_hour_later;
-- 2018-06-28 22:52:38.238702+08

SELECT (now() + INTERVAL '1 day') AS this_time_tomorrow;
-- 2018-06-29 21:52:38.239892+08

SELECT now() - INTERVAL '2 hours 30 minutes' AS two_hour_30_min_go;
-- 2018-06-28 19:22:38.241262+08
```

```sql
CREATE TABLE posts(
    id SERIAL PRIMARY KEY,
    title VARCHAR NOT NULL,
    created_at TIMESTAMPTZ DEFAULT now()
);
```