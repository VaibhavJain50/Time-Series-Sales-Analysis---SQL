-- Most Popular Products by Sales Quantity
 
 select p.product_name,
 sum(s.quantity) Sales_quantity
 from dim_products p join fact_sales s
 on p.product_key=s.product_key
 group by p.product_name
 order by sum(s.quantity) desc