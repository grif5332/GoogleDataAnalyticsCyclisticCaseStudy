SELECT
	member_casual,
	COUNT(*) AS rides_under_15_min
FROM dbo.cyclistic_tripdata_2021_2022
GROUP BY member_casual