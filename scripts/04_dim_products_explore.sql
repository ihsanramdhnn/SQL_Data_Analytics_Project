/*
===============================================================================
Products Table Exploration 
===============================================================================
Purpose:
    - To explore all dimension columns in products table.
    - Understanding more information in each dimension colums.

SQL Functions Used:
    - COUNT()
===============================================================================
*/

-- dim in products table
select * from gold.dim_products
--- product dim exploration
select distinct category, subcategory, product_name from gold.dim_products
order by 1,2,3

--- maintenance dim exploration
select
maintenance,
count(*) total
from gold.dim_products
group by maintenance

--- product_line dim exploration
select
product_line,
count(*)
from gold.dim_products
group by product_line
