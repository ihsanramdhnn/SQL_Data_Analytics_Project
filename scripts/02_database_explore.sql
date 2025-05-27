/*
===============================================================================
Database Exploration
===============================================================================
Purpose:
    - explore all the tables from the database such as table_name and table_type.
    - explore all the columns from all the tables in database.

Table Used:
    - INFORMATION_SCHEMA.TABLES
    - INFORMATION_SCHEMA.COLUMNS
===============================================================================
*/

-- retrieve a list of all table in database
select
table_catalog,
table_schema,
table_name,
table_type
from INFORMATION_SCHEMA.TABLES

-- retrieve all columns for all tables
select
table_name,
column_name,
data_type,
is_nullable,
character_maximum_length
from INFORMATION_SCHEMA.COLUMNS

where table_name = '...' -- to specify which table to explore 
