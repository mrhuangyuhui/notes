# PostgreSQL Date/Time

## API

- [Date/Time Functions and Operators](https://www.postgresql.org/docs/10/static/functions-datetime.html)
- [Data Type Formatting Functions](https://www.postgresql.org/docs/10/static/functions-formatting.html)

## Notes

[PostgreSQL DATE_PART Function](https://gitee.com/mrhuangyuhui/notes/blob/master/tutorials/postgresql/postgresql-tutorial/postgresql-date-functions/postgresql-date_part.md)

## Snippets

按日期汇总

```sql
SELECT
    -- 将时间转换为字符串
    to_char(sale_time, 'YYYY-MM-DD') AS sale_date,
    SUM(to_number(reward, '99999')) AS reward_sum
FROM
    tcbj_redpacket_act_reward
GROUP BY
    sale_date
```

判断时间范围

```java
// 将字符串转换为时间
"txn_dt >= TO_TIMESTAMP(?, 'YYYY-MM-DD HH24:MI:SS') AND txn_dt <= TO_TIMESTAMP(?, 'YYYY-MM-DD HH24:MI:SS')"
```

加/减一天

```java
// 将字符串转换为日期
"to_date(?, 'YYYY-MM-DD') - interval '1 day'"
"to_date(?, 'YYYY-MM-DD') + interval '1 day'"
```