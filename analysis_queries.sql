-- TOTAL SALES
SELECT 
    SUM(total_amount) AS Total_sales
FROM sales;


-- TOTAL ORDERS
select count(distinct sales_id ) as Total_order
from sales ;


-- AVERAGE ORDERS VALUE
SELECT 
    SUM(total_amount) / COUNT(sales_id) AS avg_order_value
FROM sales;


-- TOTAL COST (Overall)
select sum(p.cost_price * s.quantity) as Total_cost
from sales as s
join product as p 
on s.product_id = p.product_id;


-- TOP 5 HIGHEST SELLING PRODUCTS (By Sales Value)
SELECT 
    p.product_name,
    SUM(s.total_amount) AS total_sales
FROM sales s
JOIN product p ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sales DESC
LIMIT 5;


-- YEAR WISE TOTAL COST
SELECT d.year,
sum(p.cost_price * s.quantity) as Total_cost
from sales as s
join product as p  on s.product_id = p.product_id
join date_dim as d  on s.product_id = p.product_id
group by d.year
order by d.year;


-- TOP 10 HIGHEST SELLING PRODUCTS (By YEAR)
SELECT 
    d.year,
    p.product_name,
    SUM(s.total_amount) AS total_sales
FROM sales s
JOIN product p ON s.product_id = p.product_id
JOIN date_dim d ON s.date_id = d.date_id
GROUP BY d.year, p.product_name
ORDER BY total_sales DESC
limit 10;

-- MONTH WISE TOTAL SALES
select d.month_name,
sum(total_amount)as total_sales
from sales s
join date_dim d
on s.date_id = d.date_id
group by d.month_name
order by month_name;





