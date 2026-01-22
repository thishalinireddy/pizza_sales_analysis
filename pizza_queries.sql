
select sum(total_price) as Total_Revenue from pizza_sales;
 

SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value FROM pizza_sales;
 

select sum(quantity) as Total_Pizzas_Sold from pizza_sales;
 

SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales;
 

SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_per_order
FROM pizza_sales;
 

SELECT DAYNAME(STR_TO_DATE(order_date, '%m/%d/%Y')) AS order_day, 
       COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
WHERE order_date IS NOT NULL 
  AND STR_TO_DATE(order_date, '%m/%d/%Y') IS NOT NULL
GROUP BY DAYNAME(STR_TO_DATE(order_date, '%m/%d/%Y'))
ORDER BY total_orders DESC;
 

SELECT HOUR(order_time) AS order_hours, 
       COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY HOUR(order_time)
ORDER BY HOUR(order_time);
 

SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_category;
 


SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size
 

select pizza_category, sum(quantity) as Total_Pizzas_Sold from pizza_sales
group by pizza_category;
 

SELECT pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold desc
LIMIT 5;
 

SELECT pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC
LIMIT 5;
 

