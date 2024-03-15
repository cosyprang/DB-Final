create database Test_query;

use Test_query;

show tables;

-- Q1
select customer_name from Customers 
	where customer_id = (select customer_id from Orders where order_id = (select order_id from Payments order by amount desc limit 1));
    
-- Q2
select product_name from Products 
	where product_id in (select product_id from Order_Details group by product_id having count(order_id) > 1);
    
-- Q3
select customer_name from Customers
	where customer_id in (select customer_id from Orders where order_id in 
    (select order_id from Order_Details where product_id in 
    (select product_id from Products where product_name = 'Sugar - Brown')));
    
-- Q4
select product_name from Products where product_id in 
	(select product_id from Order_Details where order_id in 
    (select order_id from Orders where customer_id = '71-4595008'));
    
-- Q5
select customer_name from Customers where order_count > 1 and customer_id in 
	(select customer_id from Orders where order_id in 
    (select order_id from Order_Details where product_id in 
    (select product_id from Products where unit_price > 50)));
    