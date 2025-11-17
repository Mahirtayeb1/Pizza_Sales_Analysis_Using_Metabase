Select 
	pt.name,
	count(distinct od.order_id) as ordered,
	Round(sum(od.quantity * p.price)) as Revenue
from order_details od
left join pizzas p on od.pizza_id = p.id
left join pizza_types pt on p.pizza_type_id = pt.id
group by 1
order by 2 desc


