SELECT 
	count(Id) as total_orders,
	EXTRACT(DAY FROM DATE) AS DAYS_OF_MONTH
FROM ORDERS

group by 2
order by 2
