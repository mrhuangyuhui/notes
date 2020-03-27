# [PostgreSQL NATURAL JOIN](http://www.postgresqltutorial.com/postgresql-natural-join/)

自然联结可以是内联结、左联结或右联结，默认是内联结。自然联结自动对两张表的同名列进行比较，内联结、左联结和右联结都需要指定。

不推荐使用自然联结，因为如果两张表有两个以上的同名列时，会出现歧义。

创建测试表和测试数据

```sql
CREATE TABLE categories(
    category_id serial PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL
);

CREATE TABLE products(
    product_id serial PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    category_id INT NOT NULL,
    FOREIGN KEY(category_id) REFERENCES categories(category_id)
);

INSERT INTO categories(category_name)
VALUES
    ('Smart Phone'),
    ('Laptop'),
    ('Tablet');

INSERT INTO products(product_name, category_id)
VALUES
    ('iPhone', 1),
    ('Samsung Galaxy', 1),
    ('HP Elite', 2),
    ('Lenovo Thinkpad', 2),
    ('iPad', 3),
    ('Kindle Fire', 3);
```

```sql
SELECT
    *
FROM
    products
NATURAL JOIN categories;
```

等价于（内联结指定了对哪一列进行比较）

```sql
SELECT
    *
FROM
    products
INNER JOIN categories USING(category_id);
```