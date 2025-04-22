-- Product Category-wise Monthly Revenue


select p.category,month(s.order_date) Month_number,monthname(s.order_date) Month_name,
sum(s.sales_amount) Total_revenue
from fact_sales s join dim_products p
on s.product_key = p.product_key
group by p.category,monthname(s.order_date),month(s.order_date)
order by p.category,month(s.order_date),monthname(s.order_date)