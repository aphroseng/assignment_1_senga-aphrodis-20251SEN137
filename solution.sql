-- PL/SQL ASSIGNMENT 1: SUNRISE SUPERMARKET

-- 1. CREATE TABLES
CREATE TABLE customers (
    customer_id NUMBER PRIMARY KEY,
    customer_name VARCHAR2(100),
    email VARCHAR2(100),
    city VARCHAR2(50)
);

CREATE TABLE products (
    product_id NUMBER PRIMARY KEY,
    product_name VARCHAR2(100),
    category VARCHAR2(50),
    price NUMBER(10,2)
);

CREATE TABLE orders (
    order_id NUMBER PRIMARY KEY,
    customer_id NUMBER REFERENCES customers(customer_id),
    order_date DATE
);

CREATE TABLE order_items (
    order_item_id NUMBER PRIMARY KEY,
    order_id NUMBER REFERENCES orders(order_id),
    product_id NUMBER REFERENCES products(product_id),
    quantity NUMBER
);

-- 2. INSERT SAMPLE DATA
-- Customers (5)
INSERT INTO customers VALUES (1, 'Jessica Uwimpuhwe', 'jessica@gmail.com', 'nyabihu');
INSERT INTO customers VALUES (2, 'RWIBUTSO', 'eric@gmail.com', 'Huye');
INSERT INTO customers VALUES (3, 'SENGA APHRO', 'senga@gmail.com', 'Musanze');
INSERT INTO customers VALUES (4, 'Keza KESSY', 'kaza@gmail.com', 'Kigali');
INSERT INTO customers VALUES (5, 'Muhoza chris', 'muhoza@gmail.com', 'Rubavu');

-- Products (8)
INSERT INTO products VALUES (101, 'apple 2kg', 'market', 5000);
INSERT INTO products VALUES (102, 'Cheese 500g', 'Dairy', 4500);
INSERT INTO products VALUES (103, 'Yogurt', 'Dairy', 1000);
INSERT INTO products VALUES (104, 'White Bread', 'Bakery', 1500);
INSERT INTO products VALUES (105, 'Chocolate Cake', 'Bakery', 12000);
INSERT INTO products VALUES (106, 'Apple Juice', 'Beverages', 2500);
INSERT INTO products VALUES (107, 'Mineral Water', 'Beverages', 500);
INSERT INTO products VALUES (108, 'Coffee Powder', 'Beverages', 3500);

-- Orders (15)
INSERT INTO orders VALUES (001, 1, TO_DATE('2026-09-01', 'YYYY-MM-DD'));
INSERT INTO orders VALUES (002, 1, TO_DATE('2026-09-02', 'YYYY-MM-DD'));
INSERT INTO orders VALUES (003, 1, TO_DATE('2026-09-3', 'YYYY-MM-DD'));
INSERT INTO orders VALUES (004, 2, TO_DATE('2026-09-04', 'YYYY-MM-DD'));
INSERT INTO orders VALUES (005, 2, TO_DATE('2026-09-05', 'YYYY-MM-DD'));
INSERT INTO orders VALUES (007, 3, TO_DATE('2026-09-06', 'YYYY-MM-DD'));
INSERT INTO orders VALUES (008, 3, TO_DATE('2026-09-07', 'YYYY-MM-DD'));
INSERT INTO orders VALUES (009, 4, TO_DATE('2026-09-08', 'YYYY-MM-DD'));
INSERT INTO orders VALUES (010, 4, TO_DATE('2026-09-09', 'YYYY-MM-DD'));
INSERT INTO orders VALUES (011, 1, TO_DATE('2026-09-10', 'YYYY-MM-DD'));
INSERT INTO orders VALUES (012, 2, TO_DATE('2026-09-11', 'YYYY-MM-DD'));
INSERT INTO orders VALUES (013, 3, TO_DATE('2026-09-12', 'YYYY-MM-DD'));
INSERT INTO orders VALUES (014, 4, TO_DATE('2026-09-13', 'YYYY-MM-DD'));
INSERT INTO orders VALUES (015, 1, TO_DATE('2026-09-14', 'YYYY-MM-DD'));
INSERT INTO orders VALUES (016, 3, TO_DATE('2026-09-15', 'YYYY-MM-DD'));

-- Order Items (25)
INSERT INTO order_items VALUES (1, 001, 101, 2);
INSERT INTO order_items VALUES (2, 001, 104, 1);
INSERT INTO order_items VALUES (3, 002, 105, 1);
INSERT INTO order_items VALUES (4, 002, 106, 2);
INSERT INTO order_items VALUES (5, 003, 102, 1);
INSERT INTO order_items VALUES (6, 003, 108, 2);
INSERT INTO order_items VALUES (7, 004, 103, 5);
INSERT INTO order_items VALUES (8, 004, 107, 10);
INSERT INTO order_items VALUES (9, 005, 105, 2);
INSERT INTO order_items VALUES (10, 006, 101, 4);
INSERT INTO order_items VALUES (11, 006, 102, 2);
INSERT INTO order_items VALUES (12, 007, 106, 3);
INSERT INTO order_items VALUES (13, 007, 104, 2);
INSERT INTO order_items VALUES (14, 008, 108, 1);
INSERT INTO order_items VALUES (15, 009, 107, 20);
INSERT INTO order_items VALUES (16, 009, 101, 1);
INSERT INTO order_items VALUES (17, 010, 102, 3);
INSERT INTO order_items VALUES (18, 011, 105, 1);
INSERT INTO order_items VALUES (19, 012, 106, 2);
INSERT INTO order_items VALUES (20, 012, 103, 4);
INSERT INTO order_items VALUES (21, 013, 104, 3);
INSERT INTO order_items VALUES (22, 014, 108, 2);
INSERT INTO order_items VALUES (23, 014, 102, 1);
INSERT INTO order_items VALUES (24, 015, 101, 2);
INSERT INTO order_items VALUES (25, 015, 107, 5);
COMMIT;
-- 3. ASSIGNMENT QUERIES (ALL)
--FROM ONE TO THREE IS JOIN QUERIES
-- Q1: INNER JOIN
SELECT o.order_id, c.customer_name, c.city, o.order_date
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
ORDER BY o.order_id;

-- Q2: JOIN (Order Items + Products)
SELECT oi.order_item_id, p.product_name, p.category, p.price, oi.quantity
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
ORDER BY oi.order_item_id;

-- Q3: LEFT JOIN
SELECT c.customer_id, c.customer_name, c.city, o.order_id, o.order_date
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
ORDER BY c.customer_id, o.order_id;

--HERE IS CTE QUERY
-- Q1: CTE for Above Average Spend
WITH CustomerSpend AS (
    SELECT c.customer_id, c.customer_name, NVL(SUM(oi.quantity * p.price), 0) AS total_spent
    FROM customers c
    LEFT JOIN orders o ON c.customer_id = o.customer_id
    LEFT JOIN order_items oi ON o.order_id = oi.order_id
    LEFT JOIN products p ON oi.product_id = p.product_id
    GROUP BY c.customer_id, c.customer_name
)
SELECT customer_id, customer_name, total_spent
FROM CustomerSpend
WHERE total_spent > (SELECT AVG(total_spent) FROM CustomerSpend)
ORDER BY total_spent DESC;
--FROM 1 TO 4 IS WINDOW FUNCTION

-- Q1: RANK Customers by Spend
WITH CustomerTotal AS (
    SELECT c.customer_id, c.customer_name, NVL(SUM(oi.quantity * p.price), 0) AS total_spent
    FROM customers c
    LEFT JOIN orders o ON c.customer_id = o.customer_id
    LEFT JOIN order_items oi ON o.order_id = oi.order_id
    LEFT JOIN products p ON oi.product_id = p.product_id
    GROUP BY c.customer_id, c.customer_name
)
SELECT customer_id, customer_name, total_spent,
       DENSE_RANK() OVER (ORDER BY total_spent DESC) AS spend_rank
FROM CustomerTotal;

-- Q2: ROW_NUMBER for Orders
SELECT c.customer_name, o.order_id, o.order_date,
       ROW_NUMBER() OVER (PARTITION BY o.customer_id ORDER BY o.order_date, o.order_id) AS order_number
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
ORDER BY o.customer_id, order_number;

-- Q3: Running Total Revenue
WITH DailyOrderRevenue AS (
    SELECT o.order_date, SUM(oi.quantity * p.price) AS daily_revenue
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
    GROUP BY o.order_date
)
SELECT order_date, daily_revenue,
       SUM(daily_revenue) OVER (ORDER BY order_date) AS running_total_revenue
FROM DailyOrderRevenue
ORDER BY order_date;

-- Q5: LAG Days Between Orders
WITH OrderDifferences AS (
    SELECT c.customer_name, o.order_id, o.order_date,
           LAG(o.order_date) OVER (PARTITION BY o.customer_id ORDER BY o.order_date) AS previous_order_date,
           o.order_date - LAG(o.order_date) OVER (PARTITION BY o.customer_id ORDER BY o.order_date) AS days_between_orders
    FROM orders o
    JOIN customers c ON o.customer_id = c.customer_id
)
SELECT customer_name, order_id, order_date, previous_order_date, days_between_orders
FROM OrderDifferences
WHERE previous_order_date IS NOT NULL
ORDER BY customer_name, order_date;
