-- select 
-- 	case
-- 		when To_char(time, 'HH12 AM') between 5 and 11 then "Morning (5 AM - 11 AM)"
-- 		when To_char(time, 'HH12 AM') between 12 and 5 then "Afternoon (12 PM - 5 PM)"
-- 		when To_char(time, 'HH12 AM') between 6 and 8 then "Evening (5 PM - 8 PM)"
-- 		else "Night (9 PM - 12 AM)"
-- 	end as Time_Period,
-- 	count(id) as No_of_orders
-- from orders
-- where 1=1
-- [[ and TRIM(To_char(date, 'day')) <> {{day}} ]]

-- -- [[ where TRIM(To_char(date, 'day')) <> {{day}}]] 
-- group by 1
-- order by 2 desc;


SELECT 
    CASE
        WHEN EXTRACT(HOUR FROM time) BETWEEN 5 AND 11 THEN 'Morning (5 AM - 11 AM)'
        WHEN EXTRACT(HOUR FROM time) BETWEEN 12 AND 16 THEN 'Afternoon (12 PM - 4 PM)'
        WHEN EXTRACT(HOUR FROM time) BETWEEN 17 AND 20 THEN 'Evening (5 PM - 8 PM)'
        ELSE 'Night (9 PM - 4 AM)'
    END AS time_period,
    COUNT(id) AS no_of_orders
FROM orders
WHERE 1=1
    [[ AND 
        CASE
            WHEN CAST(TO_CHAR(time, 'HH24') AS INTEGER) BETWEEN 5 AND 11 THEN 'Morning'
            WHEN CAST(TO_CHAR(time, 'HH24') AS INTEGER) BETWEEN 12 AND 16 THEN 'Afternoon'
            WHEN CAST(TO_CHAR(time, 'HH24') AS INTEGER) BETWEEN 17 AND 20 THEN 'Evening'
            ELSE 'Night'
        END = {{time_period}}
    ]]
GROUP BY time_period
ORDER BY no_of_orders DESC;
