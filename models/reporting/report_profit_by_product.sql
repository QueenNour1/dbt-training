select
    productid,
    productidname,
    category,
    subcategory,
    sum(orderprofit) as profit
from {{ ref('stg_orders') }}
group by 
    productid,
    productidname,
    category,
    subcategory