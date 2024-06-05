 select
    customerid
 from {{ ref('dim_customer') }}
 group by customerid
 having count(*) > 1