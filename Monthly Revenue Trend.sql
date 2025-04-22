--  Monthly Revenue Trend

select 
month(order_date) as order_month ,
sum(sales_amount) as Total_Revenue,
sum(sum(sales_amount)) over(order by month(order_date)) as Running_sales
from fact_sales 
group by month(order_date) 
order by month(order_date) ;

