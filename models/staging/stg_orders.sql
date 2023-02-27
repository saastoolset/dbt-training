select
    o.orderid,
    o.orderdate,
    o.shipdate,
    o.shipmode,
    o.ordersellingprice - o.ordercostprice as orderprofit,
    o.ordersellingprice,
    o.ordercostprice,
    c.customername,
    c.customerid,
    c.segment,
    c.state,
    p.category,
    p.productname,
    p.productid,
    p.subcategory

from {{ ref("raw_orders") }} as o
left join {{ ref("raw_customers") }} as c on o.customerid = c.customerid
left join {{ ref("raw_product") }} as p on o.productid = p.productid
