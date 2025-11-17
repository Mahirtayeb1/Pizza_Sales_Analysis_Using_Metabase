-- top 5 selling pizzas
WITH ranked_pizzas AS (
    SELECT 
        pt.name,
        COUNT(DISTINCT od.order_id) AS ordered,
        RANK() OVER (ORDER BY COUNT(DISTINCT od.order_id) DESC) AS order_rank
    FROM order_details od
    LEFT JOIN pizzas p ON od.pizza_id = p.id
    LEFT JOIN pizza_types pt ON p.pizza_type_id = pt.id
    GROUP BY pt.name
)
SELECT *
FROM ranked_pizzas
WHERE order_rank <= 5
ORDER BY order_rank;



