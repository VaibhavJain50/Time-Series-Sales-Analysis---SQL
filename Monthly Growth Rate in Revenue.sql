-- Monthly Growth Rate in Revenue

with cte as (
select month(order_date),monthname(order_date) month_name,
sum(sales_amount) Revenue
from fact_sales
group by month(order_date),monthname(order_date)
order by month(order_date) 
)
select month_name,
Revenue,
concat(round(((Revenue-lag(Revenue) over())/Revenue)*100,2),'%') as Growth
from cte