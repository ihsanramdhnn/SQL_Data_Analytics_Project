/*
===============================================================================
Customers Table Exploration 
===============================================================================
Purpose:
    - To explore all dimension columns in customers table.
    - Understanding more information in each dimension colums.

SQL Functions Used:
    - COUNT(), MIN(), MAX(), DATEDIFF()
===============================================================================
*/

-- dim in customers table
select * from gold.dim_customers
--- country dim exploration
select
country,
count(*) as total
from gold.dim_customers
group by country
order by country

--- gender dim exploration
select 
gender,
count(*) as total
from gold.dim_customers
group by gender

--- marital_status dim exploration
select
marital_status,
count(*) as total
from gold.dim_customers
group by marital_status

--- age dim exploration
select 
min(birthdate) as oldest_birthdate,
datediff(year, min(birthdate),getdate()) as oldest_age,
max(birthdate) as youngest_birthdate,
datediff(year, max(birthdate),getdate()) as youngest_age,
datediff(YEAR, min(birthdate), max(birthdate)) as birthdate_range_years
from gold.dim_customers
