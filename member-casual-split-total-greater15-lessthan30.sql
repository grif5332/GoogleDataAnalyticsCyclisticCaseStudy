SELECT
	member_casual,
	COUNT(*) AS rides_between_15_and_30
FROM dbo.cyclistic_tripdata_2021_2022
WHERE ( 
	DATEDIFF(MINUTE, started_at, ended_at) >= 15 AND 
	DATEDIFF(MINUTE, started_at, ended_at) < 29
	)
GROUP BY member_casual