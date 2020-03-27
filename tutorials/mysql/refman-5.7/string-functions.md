# [12.5 String Functions](https://dev.mysql.com/doc/refman/5.7/en/string-functions.html)

[`CONCAT_WS(separator,str1,str2,...)`](https://dev.mysql.com/doc/refman/5.7/en/string-functions.html#function_concat-ws)

拼接字符串

```sql
mysql> SELECT CONCAT_WS(',','First name','Second name','Last Name');
        -> 'First name,Second name,Last Name'
mysql> SELECT CONCAT_WS(',','First name',NULL,'Last Name');
        -> 'First name,Last Name'
```