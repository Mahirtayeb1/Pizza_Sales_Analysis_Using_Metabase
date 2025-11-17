Select
	count(id) as "Orders",
	{{date_param}} as "date"
	
from orders
where {{Date_Filter}}
group by {{date_param}};