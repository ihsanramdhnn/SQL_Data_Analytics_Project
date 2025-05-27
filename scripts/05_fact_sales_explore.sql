

-- dim in sales table
select * from gold.fact_sales
--- date dim exploration
select 
MIN(order_date) as first_order, 
Max(order_date) as last_order,
DATEDIFF(MONTH,MIN(order_date),Max(order_date)) as order_range_months
from gold.fact_sales
