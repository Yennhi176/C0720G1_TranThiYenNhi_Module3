use classicmodels;

-- select status from orders
-- group by status

-- select status, count(*) as 'so luong status'
-- from orders
-- group by status

select status,sum(quantityOrdered * priceEach) as amount
from orders
inner join orderdetails on orders.ordernumber = orderdetails.ordernumber
group by status