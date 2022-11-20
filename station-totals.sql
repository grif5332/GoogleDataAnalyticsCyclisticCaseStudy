SELECT
	start_station_name,
	COUNT(*) AS station_ttl
FROM dbo.cyclistic_tripdata_2021_2022
GROUP BY start_station_name