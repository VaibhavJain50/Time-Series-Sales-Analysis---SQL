-- Customer Segmentation by Order Volume

with cte as (
select customer_key,
count(order_number) Total_orders
 from fact_sales
 group by customer_key
 ),
Customer_segments as(
 select customer_key,
 total_orders,
 case 
	when total_orders <= 10 then 'Bronze'
    when total_orders <=20 then 'Silver'
    when total_orders <=40 then 'Gold'
    else 'Diamond'
end  Segment
from cte
order by total_orders desc)

select segment,
count(segment) No_of_Cx
from Customer_segments
group by segment
order by count(segment) desc