Select * From pizza_sales

--1.Total Revenue: The sum of the Total  price of all pizza orders.
Select Sum(total_price) as Total_Revenue from pizza_sales
--2.Average Order Value: The average amount spent per order,calculated by dividing the total revenue by the total number of orders.
Select Sum(total_price)/ count(DISTINCT order_id) as average_order_value from pizza_sales
--3.Total Pizzas Sold
Select Sum(quantity) as total_pizza_sold from pizza_sales
--4. Total Orders
Select count(DISTINCT order_id) as total_order from pizza_sales
--5. Average Pizzas Per Order
Create view Avg_pizzas_per_order as
Select Cast(Cast(Sum(quantity) as decimal(10,2)) / 
Cast(count(DISTINCT order_id) as decimal(10,2))as decimal(10,2)) as Avg_pizzas_per_order from pizza_sales
-- Simple Create view and store simple virtual table.
--view
Select * From Avg_pizzas_per_order

--6. B. Daily Trend for Total Orders
Create View daily_trend_for_total_orders as
Select DATENAME(DW,order_date) as order_day, count(DISTINCT order_id) as Total_orders
from pizza_sales
Group BY DATENAME(DW,order_date)
-- Create View and store a simple virtual table
--view
 Select * From daily_trend_for_total_orders

 --7. . Monthly Trend for Orders
 Create View monthly_trend_for_total_orders as
 Select DATENAME(MONTH,order_date) as Month_Name, count(DISTINCT order_id) as Total_orders
 From pizza_sales
 Group BY DATENAME(MONTH,order_date)
 order by Total_orders desc
 -- Create View and store virtual table 
 --view
 Select * from monthly_trend_for_total_orders 

--8.% of Sales by Pizza Category
Create View sales_by_pizza_category as 
Select pizza_category, Sum(total_price) as Total_Sales,Sum(total_price)*100 / (Select sum(total_price) from pizza_sales)
as PCT from pizza_sales 
Where MONTH(order_date)=1 --- this is only jan month, you can chand per your requ
Group BY pizza_category  
-- View
Select * from sales_by_pizza_category

--9.% of Sales by Pizza Size
Create View sales_by_pizza_size as 
Select pizza_size, cast(Sum(total_price) as decimal(10,2)) as Total_Sales,cast(Sum(total_price)*100 / (Select sum(total_price) from pizza_sales) as decimal(10,2))
as PCT from pizza_sales   
Group BY pizza_size
-- view
Select * from sales_by_pizza_size

-- 10. Total Pizzas Sold by Pizza Category
Create View total_pizzas_sold_by_pizza_category as
SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales
WHERE MONTH(order_date) = 1
GROUP BY pizza_category
-- view
Select * from total_pizzas_sold_by_pizza_category

--11.Top 5 Pizzas by Revenue
SELECT top 5 pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC

--12.Bottom 5 Pizzas by Revenue
SELECT top 5 pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue Asc

--13.Top 5 Pizzas by Quantity
SELECT Top 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC

--14.Bottom 5 Pizzas by Quantity
SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC
 
 --15.Top 5 Pizzas by Total Orders
SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC

--16.Borrom 5 Pizzas by Total Orders
SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders ASC
