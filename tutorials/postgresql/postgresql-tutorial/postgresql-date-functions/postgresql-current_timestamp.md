# [PostgreSQL `CURRENT_TIMESTAMP` Function](http://www.postgresqltutorial.com/postgresql-current_timestamp/)

```sql
SELECT CURRENT_TIMESTAMP;
-- 2018-06-28 21:23:59.973715+08
```

```sql
CREATE TABLE note(
    note_id SERIAL PRIMARY KEY,
    message VARCHAR(255) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
```