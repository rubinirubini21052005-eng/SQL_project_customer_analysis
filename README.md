# SQL_project_customer_analysis
data analytics project showcasing customer behavior analysis using postegresql,pgadmin


Analyzed customer transactions to understand purchase patterns, revenue, top products, and repeat vs new customers using SQL queries.

## Dataset Description
- **Customers Table:** customer_id, name, gender, age, city, state, signup_date
- **Products Table:** product_id, product_name, category, price
- **Orders Table:** order_id, customer_id, order_date, order_status, total_amount
- **Order Items Table:** order_item_id, order_id, product_id, quantity, item_price
- **Payments Table:** payment_id, order_id, payment_method, payment_status

## Tools Used
- PostgreSQL / pgAdmin
- SQL

## Key Insights
- Total customers: 3
- Top customer by spending: Rubi
- Most popular product: T-Shirt
- Repeat vs New customers: 1 Repeat / 2 New

## Business Recommendations
- Focus marketing on top cities like Chennai
- Encourage repeat purchases with loyalty offers
- Promote popular products like T-Shirt and Jeans
- Ensure smooth payment options for customers

## SQL Script
- `Customer_Behavior_Analysis.sql`
