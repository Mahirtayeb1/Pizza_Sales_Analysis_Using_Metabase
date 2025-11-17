-- SELECT 
-- 	--*
-- 	p.size,
-- 	sum(od.quantity) as items_sold,
-- 	Round(sum(quantity * price)) as Total_Revenue
	
-- FROM order_details od
-- LEFT JOIN pizzas p ON od.pizza_id = p.id
-- LEFT JOIN pizza_types pt ON p.pizza_type_id = pt.id
-- group by 1
-- order by 2 desc


SELECT *
FROM (
    SELECT 
        pizzas.size,
        SUM(order_details.quantity) AS items_sold,
        ROUND(SUM(order_details.quantity * pizzas.price)) AS total_revenue
    FROM order_details
    LEFT JOIN pizzas ON order_details.pizza_id = pizzas.id
	left join pizza_types on pizza_types.id = pizzas.pizza_type_id
	Left join orders on order_details.order_id = orders.id
	WHERE 1=1
      [[ AND {{date_filter}} ]]
	  [[ AND {{Category}} ]]
    GROUP BY pizzas.size

    UNION ALL

    SELECT 
        'Total' AS size,
        SUM(order_details.quantity) AS items_sold,
        ROUND(SUM(order_details.quantity * pizzas.price)) AS total_revenue
    FROM order_details
    LEFT JOIN pizzas ON order_details.pizza_id = pizzas.id
	left join pizza_types on pizza_types.id = pizzas.pizza_type_id
	Left join orders on order_details.order_id = orders.id
	WHERE 1=1
      [[ AND {{date_filter}} ]]
	  [[ AND {{Category}} ]]
) AS combined

ORDER BY 
    CASE WHEN size = 'Total' THEN 2 ELSE 1 END,
    total_revenue DESC;
