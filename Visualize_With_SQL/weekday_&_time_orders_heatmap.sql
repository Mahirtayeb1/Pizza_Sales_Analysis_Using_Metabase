select 
	TRIM(To_char(date, 'day')) as day, 
	To_char(time, 'HH12 AM') as times,
	count(id) as No_of_orders
from orders
where 1=1
[[ and TRIM(To_char(date, 'day')) <> {{day}} ]]

-- [[ where TRIM(To_char(date, 'day')) <> {{day}}]] 
group by 1,2
order by 2;
