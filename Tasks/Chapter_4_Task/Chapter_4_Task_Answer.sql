use sales_management;

# Task 1 - Aggregate Functions.
# 1.1. Count the Total Number of Customers

select count(*) as Total_Customers from customers;

# 1.2. Find the Average Credit Limit of Customers 

select avg(creditLimit) as AverageCreditLimit from customers;

# 1.3. Find the Highest Payment Amount Received 

select max(amount) as Max_Amount from payments;

# Task 2 - Aggregate Functions with WHERE.

# 2.1. Find the Total Payment Amount Received from Customer 2001

select sum(amount) as Total_Payment from payments where customerNumber = 2001;

# 2.2.Find the Average Credit Limit of Customers from Delhi

select avg(creditLimit) as Average_Limit from customers where city =  "Delhi";

# 2.3. Find the Maximum Buy Price of Products in the Classic Cars Product Line

select max(buyPrice) as Maximum_Price  from products where productLine = "Classic Cars";

# Task 3 - Aggregate Functions with GROUP BY.

# 3.1. Count the Number of Customers in Each City 

select city,count(*) as Total_Customers from customers group by city;

#  3.2. Calculate the Average Credit Limit by State

select state,avg(creditLimit) as Average_Limit from customers  group by State Order By State ;

# 3.3.Count Employees in Each Office

select officeCode,count(*) as Total_Count from employees group by officeCode;

# Task 4 - Subqueries .

# 4.1.Find Customers Whose Credit Limit is Higher Than the Average Credit Limit

select customerNumber,customerName,creditLimit  from customers where creditLimit > ( select Avg(creditLimit) from customers);

# 4.2.Find Products Costing More Than the Average Buy Price

select productName,buyPrice from products  where buyPrice > (select avg(buyPrice) from products);

# 4.3. Find Employees Working in the Same Office as the Sales Manager 

select employeeNumber,firstName,lastName from employees where officeCode = (select officeCode from employees where employeeNumber=1002);


