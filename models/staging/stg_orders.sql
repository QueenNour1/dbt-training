select 
{{ dbt_utils.surrogate_key(['o.orderid', 'c.customerid','p.productid']) }} as sk_orders,
o.orderid,
o.orderdate,
o.shipdate,
o.shipmode ,
o.ORDERSELLINGPRISE - o.ORDERCOST as orderprofit,
o.ORDERSELLINGPRISE,
o.ORDERCOST,
c.customerid,
c.customername,
c.segment,
c.country,
p.productid,
p.category,
p.productidname ,
p.subcategory,
{{ markup('ORDERSELLINGPRISE', 'ORDERCOST') }} as markup
from {{ ref('raw_orders') }} as o
left join {{ ref('raw_customer') }} as c
on o.customerid = c.customerid
left join {{ ref('raw_product') }} as p
on o.productid = p.productid

