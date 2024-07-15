-- Refunds have a negative amount, so the total amount should always be >= 0.
-- Therefore return records where this isn't true to make the test fail.
select
    salesorderid,
    salesorderdetailid,
    sum(linetotal) as total_amount
from {{ ref('stg_raw_data__salesorderdetail') }}
group by 1,2
having not(total_amount >= 0)