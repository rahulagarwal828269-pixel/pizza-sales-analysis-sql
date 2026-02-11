CREATE DATABASE Pizza_Sales;
USE Pizza_Sales;

-- Total Revenue
SELECT ROUND(SUM(total_price), 2) AS total_revenue
FROM pizza_sales;

-- Total Orders
SELECT COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales;

-- Total Pizza Sold
SELECT SUM(quantity) AS total_pizzas_sold
FROM pizza_sales;


-- Average Order values
SELECT 
  ROUND(SUM(total_price) / COUNT(DISTINCT order_id), 2) AS avg_order_value
FROM pizza_sales;


-- Revenue by Pizza Category
SELECT pizza_category, ROUND(SUM(total_price), 2) AS revenue
FROM pizza_sales
GROUP BY pizza_category
ORDER BY revenue DESC;

-- Top 10 Best-Selling Pizza
SELECT pizza_name, SUM(quantity) AS total_sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_sold DESC
LIMIT 10;


-- Revenue by Pizza Size
SELECT pizza_size, ROUND(SUM(total_price), 2) AS revenue
FROM pizza_sales
GROUP BY pizza_size
ORDER BY revenue DESC;


-- Daily Revenue Trend
SELECT order_date, ROUND(SUM(total_price), 2) AS daily_revenue
FROM pizza_sales
GROUP BY order_date
ORDER BY order_date;


-- Monthly Revenue
SELECT 
  YEAR(order_date) AS year,
  MONTH(order_date) AS month,
  ROUND(SUM(total_price), 2) AS monthly_revenue
FROM pizza_sales
GROUP BY year, month
ORDER BY year, month;


-- Orders by Hour (Peak Time Analysis)
SELECT HOUR(order_time) AS hour_of_day, COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY hour_of_day
ORDER BY hour_of_day;


-- Average Items per Order
SELECT ROUND(SUM(quantity) / COUNT(DISTINCT order_id), 2) AS avg_items_per_order
FROM pizza_sales;