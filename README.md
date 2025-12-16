# 🍕 Pizza Sales Analytics Project

## 📌 Project Overview
This project analyzes pizza sales data using SQL to extract meaningful business insights.
It focuses on revenue analysis, customer order patterns, and product performance.

This is a beginner-friendly data analytics project suitable for portfolios and interviews.

---

## 🎯 Objectives
- Analyze overall sales performance
- Identify total revenue and order trends
- Find top and bottom performing pizzas
- Understand customer buying behavior
- Support data-driven business decisions

---

## 🛠 Tools & Technologies Used
- SQL (MySQL / SQL Server)
- Microsoft Excel (basic validation)
- Power BI (for dashboard visualization)
- Git & GitHub

---

## 📂 Dataset Description
The dataset contains pizza sales transactions with the following columns:
- order_id
- order_date
- pizza_name
- pizza_category
- pizza_size
- quantity
- total_price

---

## 📊 Key Performance Indicators (KPIs)
1. Total Revenue  
2. Average Order Value  
3. Total Pizzas Sold  
4. Total Orders  
5. Average Pizzas per Order  

---

## 📈 Analysis Performed

### 🔹 Sales Trends
- Daily trend of total orders
- Monthly trend of total orders

### 🔹 Revenue Analysis
- Percentage of sales by pizza category
- Percentage of sales by pizza size

### 🔹 Product Performance
- Top 5 pizzas by revenue
- Bottom 5 pizzas by revenue
- Top & bottom pizzas by quantity sold
- Top & bottom pizzas by total orders

---

## 🧮 Sample SQL Queries

```sql
-- Total Revenue
SELECT SUM(total_price) AS Total_Revenue 
FROM pizza_sales;

-- Average Order Value
SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS Avg_Order_Value 
FROM pizza_sales;

-- Top 5 Pizzas by Revenue
SELECT TOP 5 pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC;


