SELECT
	DATEPART(MONTH, started_at) AS month_number,
	month_of_trip,
	member_casual,
	COUNT(*) AS ride_total_by_month
FROM dbo.cyclistic_tripdata_2021_2022
GROUP BY DATEPART(MONTH, started_at), month_of_trip, member_casual
ORDER BY DATEPART(MONTH, started_at)