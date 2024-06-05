{{ config(enabled = false) }}

select
    customer_key, 
    avg(salesamount) as average_salesamount
from {{ ref('fct_sales') }}
group by 1
having count(customer_key) > 1 and average_salesamount < 1