# [PostgreSQL `CURRENT_DATE` Function](http://www.postgresqltutorial.com/postgresql-current_date/)

```sql
SELECT CURRENT_DATE;
-- 2018-06-28
```

```sql
CREATE TABLE delivery(
    delivery_id SERIAL PRIMARY KEY,
    product VARCHAR(255) NOT NULL,
    delivery_date DATE DEFAULT CURRENT_DATE
);
```