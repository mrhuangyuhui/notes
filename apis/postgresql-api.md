# [PostgreSQL API](https://gitee.com/mrhuangyuhui/notes/blob/master/apis/postgresql-api.md)

<https://www.postgresql.org/docs/10/static/sql.html>

## [Queries](https://www.postgresql.org/docs/10/static/queries.html)

### [LIMIT and OFFSET](https://www.postgresql.org/docs/10/static/queries-limit.html)

```sql
SELECT select_list
    FROM table_expression
    [ ORDER BY ... ]
    [ LIMIT { number | ALL } ] [ OFFSET number ]
```

## [Functions and Operators](https://www.postgresql.org/docs/10/static/functions.html)

### [Comparison Functions and Operators](https://www.postgresql.org/docs/10/static/functions-comparison.html)

Comparison Operators

Operator | Description
--- | ---
`<` | less than
`>` | greater than
`<=` | less than or equal to
`>=` | greater than or equal to
`=` | equal
`<>` or `!=` | not equal

Comparison Predicates

Predicate | Description
--- | ---
a BETWEEN x AND y | between
a NOT BETWEEN x AND y | not between
expression IS NULL | is null
expression IS NOT NULL | is not null
boolean_expression IS TRUE | is true
boolean_expression IS NOT TRUE | is false or unknown
boolean_expression IS FALSE | is false
boolean_expression IS NOT FALSE | is true or unknown

### [String Functions and Operators](https://www.postgresql.org/docs/10/static/functions-string.html)

- concat

### [Data Type Formatting Functions](https://www.postgresql.org/docs/10/static/functions-formatting.html)

- to_char
- to_date
- to_number
- to_timestamp

Template Patterns for Date/Time Formatting

Pattern | Description
--- | ---
HH24 | hour of day (00-23)
MI | minute (00-59)
SS | second (00-59)
YYYY | year (4 or more digits)
MM | month number (01-12)
DD | day of month (01-31)

Template Patterns for Numeric Formatting

Pattern | Description
--- | ---
9 | digit position (can be dropped if insignificant)
0 | digit position (will not be dropped, even if insignificant)

### [Date/Time Functions and Operators](https://www.postgresql.org/docs/10/static/functions-datetime.html)

- date_part
- date_trunc
- extract

### [Aggregate Functions](https://www.postgresql.org/docs/10/static/functions-aggregate.html)

- count
- max
- min
- string_agg
- sum