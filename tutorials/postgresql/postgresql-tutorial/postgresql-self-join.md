# [PostgreSQL Self-Join](http://www.postgresqltutorial.com/postgresql-self-join/)

示例一：查询层级数据

创建测试数据

```sql
CREATE TABLE employee(
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    manager_id INT,
    FOREIGN KEY(manager_id) REFERENCES employee(employee_id) ON DELETE CASCADE
);

INSERT INTO employee(
    employee_id,
    first_name,
    last_name,
    manager_id
)
VALUES
    (1, 'Windy', 'Hays', NULL),
    (2, 'Ava', 'Christensen', 1),
    (3, 'Hassan', 'Conner', 1),
    (4, 'Anna', 'Reeves', 2),
    (5, 'Sau', 'Norman', 2),
    (6, 'Kelsie', 'Hays', 3),
    (7, 'Tory', 'Goff', 3),
    (8, 'Salley', 'Lester', 3);
```

查询每一位员工的上司

```sql
SELECT
    e.first_name || ' ' || e.last_name employee,
    m.first_name || ' ' || m.last_name manager
FROM
    employee e
INNER JOIN employee m ON m.employee_id = e.manager_id
ORDER BY
    manager;
```

查询每一位员工的上司，包括没有上司的员工。

```sql
SELECT
    e.first_name || ' ' || e.last_name employee,
    m.first_name || ' ' || m.last_name manager
FROM
    employee e
LEFT JOIN employee m ON m.employee_id = e.manager_id
ORDER BY
    manager;
```

示例二：比较同一个表中的记录

查询时间长度相同的电影

```sql
SELECT
    f1.title,
    f2.title,
    f1.length
FROM
    film f1
INNER JOIN film f2 ON f1.film_id <> f2.film_id
AND f1.length = f2.length;
```