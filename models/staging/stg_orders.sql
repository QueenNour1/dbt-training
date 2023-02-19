select 
o.orderid,
o.orderdate,
o.shipdate,
o.shipmode ,
o.ORDERSELLINGPRISE - o.ORDERCOST as orderprofit,
o.ORDERSELLINGPRISE,
o.ORDERCOST,
c.customername,
c.segment,
c.country,
p.category,
p.productidname ,
p.subcategory
from {{ ref('raw_orders') }} as o
left join {{ ref('raw_customer') }} as c
on o.customerid = c.customerid
left join {{ ref('raw_product') }} as p
on o.productid = p.productid