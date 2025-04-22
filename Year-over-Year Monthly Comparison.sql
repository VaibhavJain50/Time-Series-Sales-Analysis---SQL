-- Year-over-Year Monthly Comparison


with Sales_2013 as(
select monthname(order_date) `Month`,
sum(sales_amount) as Revenue_2013
from fact_sales
where year(order_date)=2013
group by monthname(order_date)
),
Sales_2012 as(
select monthname(order_date) `Month`,
sum(sales_amount) as Revenue_2012
from fact_sales
where year(order_date)=2012
group by monthname(order_date)
)

select S12.month,
Revenue_2012,
Revenue_2013,
concat(round(((Revenue_2013-Revenue_2012)/Revenue_2013)*100,2),'%') as Growth
from Sales_2012 S12 join Sales_2013 S13
on S12.Month=S13.Month