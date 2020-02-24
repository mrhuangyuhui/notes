# PostgreSQL TO_CHAR Function

<http://www.postgresqltutorial.com/postgresql-to_char/>

Format | Description
--- | ---
9 | Numeric value with the specified number of digits
0 | Numeric value with leading zeros
YYYY | year in 4 digits
MM | month number from 01 to 12
DD | Day of month (01-31)
HH24 | Hour of day (0-23)
MI | Minute (0-59)
SS | Second (0-59)

```sql
SELECT
    TO_CHAR(
        TIMESTAMP '2017-08-18 22:30:59',
        'HH24:MI:SS'
    );
```

输出结果

```bash
22:30:59
```

```sql
SELECT
    TO_CHAR(2017, '9,999');
```

输出结果

```bash
2,017
```