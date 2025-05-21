Enter password: *************
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 16
Server version: 8.0.42 MySQL Community Server - GPL

Copyright (c) 2000, 2025, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> ^C
mysql> CREATE DATABASE sales_analysis;
ERROR 1007 (HY000): Can't create database 'sales_analysis'; database exists
mysql> USE sales_analysis;
Database changed
mysql> CREATE TABLE online_sales (
    ->     order_id INT,
    ->     order_date DATE,
    ->     amount DECIMAL(10, 2),
    ->     product_id INT
    -> );
ERROR 1050 (42S01): Table 'online_sales' already exists
mysql> INSERT INTO online_sales (order_id, order_date, amount, product_id)
    -> VALUES
    -> (1, '2024-01-10', 100.00, 101),
    -> (2, '2024-01-15', 150.00, 102),
    -> (3, '2024-02-05', 200.00, 103),
    -> (4, '2024-02-20', 180.00, 104),
    -> (5, '2024-03-01', 220.00, 105),
    -> (6, '2024-03-15', 300.00, 106);
Query OK, 6 rows affected (0.01 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> SELECT
    ->     YEAR(order_date) AS year,
    ->     MONTH(order_date) AS month,
    ->     SUM(amount) AS monthly_revenue,
    ->     COUNT(DISTINCT order_id) AS order_volume
    -> FROM
    ->     online_sales
    -> GROUP BY
    ->     year, month
    -> ORDER BY
    ->     year, month;
+------+-------+-----------------+--------------+
| year | month | monthly_revenue | order_volume |
+------+-------+-----------------+--------------+
| 2024 |     1 |         1100.00 |            2 |
| 2024 |     2 |         1360.00 |            2 |
| 2024 |     3 |         2140.00 |            2 |
+------+-------+-----------------+--------------+
3 rows in set (0.00 sec)

mysql> SELECT
    ->     YEAR(order_date) AS year,
    ->     MONTH(order_date) AS month,
    ->     SUM(amount) AS monthly_revenue
    -> FROM
    ->     online_sales
    -> GROUP BY
    ->     year, month
    -> ORDER BY
    ->     monthly_revenue DESC
    -> LIMIT 3;
+------+-------+-----------------+
| year | month | monthly_revenue |
+------+-------+-----------------+
| 2024 |     3 |         2140.00 |
| 2024 |     2 |         1360.00 |
| 2024 |     1 |         1100.00 |
+------+-------+-----------------+
3 rows in set (0.00 sec)

mysql>
