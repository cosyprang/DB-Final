-- create database sales;
-- use sales;

-- Q1
select customer_name from customers c where customer_id = (select customer_id from orders 
where order_id = (select order_id from payments order by amount desc limit 1));

-- Q2
select product_name from products 
where product_id in (select product_id from order_details group by product_id having count(order_id) > 1);
  
-- Q3
-- subQuery
select customer_name from customers where customer_id in 
(select customer_id from orders where order_id in 
(select order_id from order_details where product_id in (select product_id from products where product_name = "Sugar - Brown")));
-- join + subQuery
select customer_name from customers c join orders o on c.customer_id = o.customer_id
join order_details od on o.order_id = od.order_id where od.product_id in (select product_id from products where product_name = "Sugar - Brown");

-- Q4
-- subQuery
select product_name from products where product_id in 
(select product_id from order_details where order_id in 
(select order_id from orders where customer_id in (select customer_id from customers where customer_id = '71-4595008')));
-- join + subQuery
select product_name from products p
join order_details od on od.product_id = p.product_id
join orders o on o.order_id = od.order_id
where o.customer_id in (select customer_id from customers where customer_id = '71-4595008');

-- Q5
select * from order_details;
select customer_name from customers where order_count >= 1 and customer_id in 
(select customer_id from orders where order_id in 
(select order_id from order_details where product_id in
(select product_id from products where unit_price > 50)));

-- Q6
-- join
select customer_name as name, order_count as total_orders, sum(amount) as total_payment from customers c 
join orders o on c.customer_id = o.customer_id
join payments p on o.order_id = p.order_id group by c.customer_id;

-- Q7
-- subQuery

