-- Region/Country Wise Revenue Over Time

select c.country,monthname(s.order_date),
sum(s.sales_amount)
from fact_sales s join dim_customers c
on s.customer_key = c.customer_key
group by c.country,monthname(s.order_date)
order by c.country
