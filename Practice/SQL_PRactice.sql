use ecommerce_db;

# Q1. Display all customers.
select * from customers;

#Show customer names and cities only. 
select name,city from customers;

# Find customers from Chennai.
select * from customers where city = "Chennai";

select * from customers where city in ("Chennai","mumbai");

# Q4. Display products costing more than 5000.

select product_name,price from products where price > 5000 order by price;

# Show products ordered by price descending.

select * from products order by price desc;

# Count total customers.

select count(*) from customers;

#  Find average product price.

select AVG(price) as Average_Product_Price from products;

# Q8. Find highest-priced product.
select product_name,max(price) as highest_priced_product from products group by product_name order by highest_priced_product desc LIMIT 1;

# Q9. Find total revenue from orders.
select sum(total_amount) as Revenue from orders;

#Q10. Find average order value.
select AVG(total_amount) from orders;

# Q11. Count customers in each city.
select city,count(*) from customers group by city;

# Count products in each category.

select category,count(*) from products group by category;

# Find average product price by category.

select category,AVG(price) as Average_Price from products group by category;

#  Find categories having more than 50 products.

select category,count(*) from products group by category having count(*) > 50;

#Find customers with more than one order.

select customer_id,count(order_id) from orders group by customer_id having count(order_id) > 1;

# Show customer name and order details

select * from customers;
select * from orders;

select c.name,o.order_id,o.order_date,o.total_amount
from customers c
inner join orders o
on c.customer_id = o.customer_id order by c.name;

# Show products purchased in each order.
select * from orders;
select * from products;
select * from order_items;


select p.product_id,p.product_name,p.category,o.total_amount
from products p
inner join order_items oi
on oi.product_id = p.product_id
inner join orders o
on o.order_id = oi.order_id;

# Q18. Show order payment status.

select o.order_id,p.payment_status
from orders o
inner join payments p
on o.order_id = p.order_id;

#  Show customer names and payment methods.

select c.name,p.payment_method from customers c 
inner join orders o 
on c.customer_id = o.customer_id
inner join payments p
on o.order_id = p.order_id;

# Show full order details.
select c.name,       o.order_id,       pr.product_name,       oi.quantity,       pay.payment_status
from customers c
inner join orders o
on c.customer_id =o.customer_id
inner join order_items oi
on oi.order_id = o.order_id
inner join products pr
on pr.product_id = oi.product_id
inner join payments pay
on pay.order_id = o.order_id;


# Q21. Find products priced above average.
select * from products where price > (select avg(price) from products);

# Find Find customers who made the highest-value order.

select customer_id from orders where total_amount = (select max(total_amount) from orders);

SELECT * FROM customers WHERE customer_id = (   SELECT customer_id    FROM orders    ORDER BY total_amount DESC    LIMIT 19);


#Q24. Find products never ordered.

select * from products where product_id not in  (select product_id from order_items);

#Find orders above average order amount.

select * from orders where total_amount > (select avg(total_amount) from orders);

# Q26. Rank products by price.

select product_name,category,price,
rank() over(order by price desc) as Rankk
from products;

# Find Top 3 Expensive product

select * from products order by price desc limit 3;

select * from (select *,rank() over(order by price desc) as Rankk from products) t where rankk <=3;

#  Running total of sales.

select *,sum(total_amount) over(order by order_date) from orders;

SELECT order_date,
       total_amount,
       SUM(total_amount)
       OVER(ORDER BY order_date) AS running_total
FROM orders;

# Rank customers by spending.

select *,rank() over(order by total_amount desc) from orders;

SELECT customer_id,
       SUM(total_amount) AS spending,
       RANK() OVER(
           ORDER BY SUM(total_amount) DESC
       ) AS rank_no
FROM orders
GROUP BY customer_id;

# Create a procedure to display all customers from a given city.


drop procedure disp_cust_city;

DELIMITER $$

create procedure disp_cust_city(in p_city varchar(50))
begin
select * from customers  where p_city =city;
end $$
DELIMITER ;

call disp_cust_city("Chennai");


#1. Display customer names along with their order IDs and order dates.

select * from customers;
select * from orders;


select c.name,c.customer_id,o.order_date
from customers c 
inner join orders o
on c.customer_id = o.customer_id;


#Find all completed payments with customer names.

select * from payments;
select * from customers;

select c.name,p.payment_method,p.payment_status
from customers c 
inner join orders o
on c.customer_id = o.customer_id
inner join payments p

# 6. Find customers who have never placed an order.

select * from customers c
left join orders o
on c.customer_id = o.customer_id
where o.order_id is Null;


#7. List all customers and their orders (including customers with no orders).

select c.name, o.order_id
from customers c 
left join orders o
on c.customer_id = o.customer_id;

# 14. Display all customers and orders whether a match exists or not.

select c.name,o.order_id
from customers c 
left join orders o
on c.customer_id = o.customer_id

union
select c.name,o.order_id
from customers c 
right join orders o
on c.customer_id = o.customer_id;

# 20. Generate all customer-payment method combinations.
select c.name,p.payment_method
from customers c
cross join payments p;