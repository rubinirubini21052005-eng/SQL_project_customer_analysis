CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    gender VARCHAR(10),
    age INT,
    city VARCHAR(50),
    state VARCHAR(50),
    signup_date DATE
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    order_date DATE,
    order_status VARCHAR(20),
    total_amount DECIMAL(10,2)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT REFERENCES orders(order_id),
    product_id INT REFERENCES products(product_id),
    quantity INT,
    item_price DECIMAL(10,2)
);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT REFERENCES orders(order_id),
    payment_method VARCHAR(20),
    payment_status VARCHAR(20)
);

INSERT INTO customers (customer_id, name, gender, age, city, state, signup_date) VALUES
(1, 'Rubi', 'Female', 16, 'Chennai', 'Tamil Nadu', '2024-01-05'),
(2, 'Arun', 'Male', 25, 'Bangalore', 'Karnataka', '2024-02-12'),
(3, 'Meera', 'Female', 30, 'Mumbai', 'Maharashtra', '2024-03-01');

INSERT INTO products (product_id, product_name, category, price) VALUES
(1, 'T-Shirt', 'Clothing', 499.0),
(2, 'Jeans', 'Clothing', 1299.0),
(3, 'Mobile Case', 'Accessories', 399.0);

INSERT INTO orders (order_id, customer_id, order_date, order_status, total_amount) VALUES
(1, 1, '2024-06-01', 'Delivered', 1298.0),
(2, 2, '2024-06-05', 'Delivered', 399.0),
(3, 1, '2024-06-10', 'Pending', 499.0);

INSERT INTO order_items (order_item_id, order_id, product_id, quantity, item_price) VALUES
(1, 1, 1, 1, 499.0),
(2, 1, 2, 1, 799.0),
(3, 2, 3, 1, 399.0),
(4, 3, 1, 1, 499.0);

INSERT INTO payments (payment_id, order_id, payment_method, payment_status) VALUES
(1, 1, 'Credit Card', 'Success'),
(2, 2, 'UPI', 'Success'),
(3, 3, 'Cash', 'Pending');
SELECT * FROM customers;
SELECT * FROM orders;
SELECT COUNT (*) AS total_customers FROM customers;

#total number of customer
SELECT COUNT(*) AS total_customers
FROM customers;

#orders per customer
SELECT city, COUNT(*) AS num_customers
FROM customers
GROUP BY city 
ORDER BY num_customers DESC;

#total revenue
SELECT SUM(Total_amount) AS total_revenue
FROM orders;

#oredrs with customer names
SELECT O.Order_id, c.name, o.total_amount,
o.order_status
FROM Orders o
JOIN customers c ON o.customer_id = 
c.customer_id;

#top 5 customers by total spending
SELECT c.name, SUM(o.total_amount) AS total_spent
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.name
ORDER BY total_spent DESC
LIMIT 5;

#count order per customer
SELECT c.customer_id, c.name, COUNT(o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name;

#repeat vs. new customers
SELECT 
    CASE 
        WHEN total_orders > 1 THEN 'Repeat'
        ELSE 'New'
    END AS customer_type,
    COUNT(*) AS num_customers
FROM (
    SELECT c.customer_id, COUNT(o.order_id) AS total_orders
    FROM customers c
    LEFT JOIN orders o ON c.customer_id = o.customer_id
    GROUP BY c.customer_id
) AS sub
GROUP BY customer_type;