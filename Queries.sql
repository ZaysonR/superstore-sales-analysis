/*Which region makes the most/least profit?*/

SELECT region, 
ROUND (sum(sales), 2) AS total_sales,
ROUND (sum(profit), 2) AS total_profit
FROM orders
GROUP BY region
ORDER BY total_profit DESC;

/*Which product categories/subcategories are profitable vs losing money?*/

SELECT category, subcategory,
       ROUND(SUM(sales), 2) AS total_sales,
       ROUND(SUM(profit), 2) AS total_profit,
       ROUND(AVG(profit_margin), 3) AS avg_margin
FROM orders
GROUP BY category, subcategory
ORDER BY total_profit ASC;

/*Does giving bigger discounts hurt overall profit?*/

SELECT 
  CASE 
    WHEN discount = 0 THEN 'No Discount'
    WHEN discount <= 0.2 THEN 'Low (0-20%)'
    WHEN discount <= 0.5 THEN 'Medium (20-50%)'
    ELSE 'High (50%+)'
  END AS discount_band,
  COUNT(*) AS num_orders,
  ROUND(SUM(sales), 2) AS total_sales,
  ROUND(SUM(profit), 2) AS total_profit
FROM orders
GROUP BY discount_band
ORDER BY total_profit DESC;

/*Top 10 customers by profit*/

SELECT customer,
ROUND(sum(sales), 2) AS total_sales,
ROUND(sum(profit), 2) AS total_profit
FROM Orders
GROUP BY customer
ORDER BY total_profit DESC
LIMIT 10;

/*How do sales and profit trend over time (month by month)?*/

-- Note: order_date has inconsistent format (some dates have leading zeros, some don't)
-- so we locate the "/" separators dynamically instead of assuming fixed positions

SELECT 
  printf('%04d-%02d',
    CAST(substr(order_date, instr(order_date,'/') + instr(substr(order_date, instr(order_date,'/')+1),'/') + 1) AS INTEGER),
    CAST(substr(order_date, 1, instr(order_date,'/') - 1) AS INTEGER)
  ) AS month,
  ROUND(SUM(sales), 2) AS total_sales,
  ROUND(SUM(profit), 2) AS total_profit
FROM orders
GROUP BY month
ORDER BY month;
