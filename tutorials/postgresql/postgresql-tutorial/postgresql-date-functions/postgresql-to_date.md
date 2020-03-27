# [PostgreSQL `TO_DATE` Function: Convert String to Date](http://www.postgresqltutorial.com/postgresql-to_date/)

```sql
SELECT to_date('20170103','YYYYMMDD');
-- 2017-01-03

SELECT to_date('10 Feb 2017', 'DD Mon YYYY');
-- 2017-02-10

SELECT to_date('2017 Feb 20','YYYY Mon DD');
-- 2017-02-20
```