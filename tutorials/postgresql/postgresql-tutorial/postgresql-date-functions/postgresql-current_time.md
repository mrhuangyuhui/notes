# [PostgreSQL `CURRENT_TIME` Function](http://www.postgresqltutorial.com/postgresql-current_time/)

```sql
SELECT CURRENT_TIME;
-- 21:18:08.455412+08
SELECT CURRENT_TIME(2);
-- 21:20:26.45+08
```

```sql
CREATE TABLE log(
    log_id SERIAL PRIMARY KEY,
    message VARCHAR(255) NOT NULL,
    created_at TIME DEFAULT CURRENT_TIME,
    created_on DATE DEFAULT CURRENT_DATE
);
```