SELECT
	member_casual,
	COUNT(*) AS rides_between_30_and_45
FROM dbo.cyclistic_tripdata_2021_2022
WHERE ( 
	DATEDIFF(MINUTE, started_at, ended_at) >= 30 AND 
	DATEDIFF(MINUTE, started_at, ended_at) < 44
	)
GROUP BY member_casual