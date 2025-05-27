/*
===============================================================================
Ranking Analysis
===============================================================================
Purpose:
    - To rank items (e.g., products, customers) based on performance or other metrics.
    - To identify top performers or laggards.

SQL Functions Used:
    - Window Ranking Functions: RANK(), DENSE_RANK(), ROW_NUMBER(), TOP
    - Clauses: GROUP BY, ORDER BY
===============================================================================
*/

-- Which 5 products generate the highest revenue?
select * from
(select
p.product_name,
sum(f.sales_amount) as total_revenue,
ROW_NUMBER() over(order by sum(f.sales_amount) desc) as rank_product
from gold.fact_sales f
left join gold.dim_products p
on p.product_key = f.product_key
group by p.product_name)t
where rank_product <= 5

--What are the 5 worst-performing products in terms of sales?
select * from
(select
p.product_name,
sum(f.sales_amount) as total_revenue,
Rank() over(order by sum(f.sales_amount) asc) as rank_product
from gold.fact_sales f
left join gold.dim_products p
on p.product_key = f.product_key
group by p.product_name)t
where rank_product <=5

-- Top 10 customers with highest generated revenue
select * from
(
select
c.customer_key,
c.first_name,
c.last_name,
sum(f.sales_amount) as total_revenue,
dense_rank() over(order by sum(f.sales_amount) desc) as rank_customer
from gold.fact_sales f
left join gold.dim_customers c
on f.customer_key = c.customer_key
group by c.customer_key, c.first_name, c.last_name
)t
where rank_customer <=10
order by rank_customer

select top 10
c.customer_key,
c.first_name,
c.last_name,
sum(f.sales_amount) as total_revenue
from gold.fact_sales f
left join gold.dim_customers c
on f.customer_key = c.customer_key
group by c.customer_key, c.first_name, c.last_name
order by total_revenue desc

-- The 3 customers with fewest orders placed
select top 3
c.customer_key,
c.first_name,
c.last_name,
count(distinct f.order_number) as orders_placed
from gold.fact_sales f
left join gold.dim_customers c
on f.customer_key = c.customer_key
group by c.customer_key, c.first_name, c.last_name
order by orders_placed
