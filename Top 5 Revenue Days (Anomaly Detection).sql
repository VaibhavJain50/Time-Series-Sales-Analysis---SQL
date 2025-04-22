-- Top 5 Revenue Days (Anomaly Detection)

select dayname(order_date) `Day`,
sum(sales_amount) Total_Revenue
from fact_sales
group by dayname(order_date)
order by sum(sales_amount) desc,dayname(order_date)
limit 5;