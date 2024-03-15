create database Sales;

use Sales;

-- Q1
select customer_name, order_id from Customers c join orders o on o.customer_id = c.customer_id
	where order_id = (select order_id from payments
    order by amount desc 
    limit 1);
    
-- Q2
select product_name from Order_Details od
	join Products p on od.product_id = p.product_id
    group by p.product_id;
    
-- Q3
select customer_name from Customers c
	join Orders o on c.customer_id = o.customer_id
    join Order_Details od on o.order_id = od.order_id
    join Products p on od.product_id = p.product_id
    where product_name = 'Sugar - Brown';
    
-- Q4    
select product_name from Products p
	join Order_Details od on p.product_id = od.product_id
    join Orders o on od.order_id = o.order_id
    where o.customer_id in (select customer_id from Customers where customer_id = '71-4595008');

-- Q5
select customer_name from Customers c
	join Orders o on c.customer_id = o.customer_id
    join Order_Details od on o.order_id = od.order_id
    where od.product_id in (select product_id from Products where unit_price > 50 and od.quantity > 1 group by product_id);
    
-- Q6
select customer_name as name , sum(order_count) as total_orders, sum(amount) as total_payment from Customers c
	join Orders o on c.customer_id = o.customer_id
    join Payments p on o.order_id = p.order_id
    group by c.customer_id;
    
-- Q7
select customer_name as Name, o.order_id as ID, payment_method as Method from Customers c
	join Orders o on c.customer_id = o.customer_id
    join Payments p on o.order_id = p.order_id
    where p.order_id = (select p.order_id from Payments where amount > 100 group by p.order_id);
    
-- Q8
select customer_name as Name, o.order_id as ID, sum(amount) as total_payment from Customers c
	join Orders o on c.customer_id = o.customer_id
    join Payments p on o.order_id = p.order_id
    where o.order_date >= '2023-01-01' group by o.order_id;
    
