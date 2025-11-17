
SELECT	
	pt.category,
	count(Distinct order_id)
FROM order_details od
left join pizzas p on p.id = od.pizza_id
left join pizza_types pt on pt.id = p.pizza_type_id
left join orders on orders.id = od.order_id
where {{category}} and {{date}}
group by 1;


