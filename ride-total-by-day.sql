SELECT
	DATEPART(WEEKDAY, started_at) AS week_day_number,
	day_of_week,
	member_casual,
	COUNT(*) AS ride_total_by_day
FROM dbo.cyclistic_tripdata_2021_2022
GROUP BY DATEPART(WEEKDAY, started_at), day_of_week, member_casual
ORDER BY DATEPART(WEEKDAY, started_at)