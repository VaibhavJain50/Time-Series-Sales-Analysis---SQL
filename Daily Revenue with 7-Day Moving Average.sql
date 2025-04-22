--  Daily Revenue with 7-Day Moving Average

select order_date,
sum(sales_amount) Daily_revenue,
round(avg(sum(sales_amount)) over(
		order by order_date
        rows between 6 preceding and current row
        ),2) as Rolling_Avg_7days
from fact_sales
group by order_date