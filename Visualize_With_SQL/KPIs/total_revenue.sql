Select 
	sum(order_details.quantity * pizzas.price) as Total_Revenue
from order_details
left join pizzas on order_details.pizza_id = pizzas.id
left join orders on order_details.order_id = orders.id
where {{date_filter}};