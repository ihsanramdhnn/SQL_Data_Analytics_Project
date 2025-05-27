/*
===============================================================================
Measures Exploration (Key Metrics)
===============================================================================
Purpose:
    - To calculate aggregated metrics (e.g., totals, averages) for quick insights.
    - To identify overall trends or spot anomalies.

SQL Functions Used:
    - COUNT(), SUM(), AVG()
===============================================================================
*/

-- Find the total sales
select sum(sales_amount) as total_sales from gold.fact_sales

-- Find how many items are sold
select sum(quantity) as items_sold from gold.fact_sales

-- Find the average selling price
select AVG(price) as avg_price from gold.fact_sales

-- Find the total number of orders
select count(order_number) as total_orders from gold.fact_sales
select count(distinct order_number) as total_orders from gold.fact_sales

-- Find the total number of products
select count(product_name) as number_products from gold.dim_products

-- Find the total number of customers
select count(customer_key) as number_customer from gold.dim_customers

-- Find the total number of customers that has placed an order 
select count(distinct customer_key) as order_customer from gold.fact_sales

-- All key metrics
select 'Total Sales' as measure_name, sum(sales_amount) as measure_value from gold.fact_sales
union all
select 'Total Quantity' as measure_name, sum(quantity) as measure_value from gold.fact_sales
union all
select 'Average Price' as measure_name, AVG(price) as measure_value from gold.fact_sales
union all
select 'Total Orders' as measure_name, count(distinct order_number) as measure_value from gold.fact_sales
union all
select 'Total Products' as measure_name, count(product_name) as measure_value from gold.dim_products
union all
select 'Total Customer' as measure_name, count(customer_key) as measure_value from gold.dim_customers

