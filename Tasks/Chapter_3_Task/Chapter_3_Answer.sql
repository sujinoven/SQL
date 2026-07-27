use  sales_management;

# 1. Identify High-Credit Customers

select * from customers where creditLimit > 150000 ;

# 2.  Find Customers from a the State Tamil Nadu

select * from customers where state =  "Tamil Nadu" ;

# 3. Identify Products Running Low on Stock

select * from products where  quantityinStock < 100;

# 6. Retrieve the Order detatils which is Shipped already

select * from orders where status = "Shipped" 
order by requiredDate;

# 7. Find Employees Reporting to a Specific Manager
select * from employees where reportsTo = 1002;

# 8.Identify Expensive Products
select * from products where MSRP > 10000;

# 9.Retrieve orders with status 'On Hold'.
select * from orders where status = "On Hold";

# 10.Find customers who are from the Chennai City.
select * from customers where city = "chennai"; 
