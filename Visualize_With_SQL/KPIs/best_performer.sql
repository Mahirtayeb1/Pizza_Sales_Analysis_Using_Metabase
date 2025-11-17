-- Best Performer
WITH ranked_pizzas AS (
    SELECT 
        pt.name,
        --Round(sum(od.quantity * p.price)) AS Total_Price,
        RANK() OVER (ORDER BY sum(od.quantity * p.price) DESC) AS Revenue_Rank
    FROM order_details od
    LEFT JOIN pizzas p ON od.pizza_id = p.id
    LEFT JOIN pizza_types pt ON p.pizza_type_id = pt.id
    GROUP BY pt.name
)
SELECT 
	name
FROM ranked_pizzas
WHERE Revenue_Rank = 1
ORDER BY Revenue_Rank;