# [PostgreSQL `DATE_PART` Function](http://www.postgresqltutorial.com/postgresql-date_part/)

```sql
SELECT date_part('year', TIMESTAMP '2017-01-01');
-- 2017

SELECT date_part('month', TIMESTAMP '2017-09-30');
-- 9

SELECT date_part( 'day', TIMESTAMP '2017-03-18 10:20:30');
-- 18

SELECT
    date_part(
        'hour',
        TIMESTAMP '2017-03-18 10:20:30'
    ) h,
    date_part(
        'minute',
        TIMESTAMP '2017-03-18 10:20:30'
    ) M,
    date_part(
        'second',
        TIMESTAMP '2017-03-18 10:20:30'
    ) s;
-- 10 20 30
```