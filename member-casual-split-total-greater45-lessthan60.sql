SELECT
	member_casual,
	COUNT(*) AS rides_between_45_and_60
FROM dbo.cyclistic_tripdata_2021_2022
WHERE ( 
	DATEDIFF(MINUTE, started_at, ended_at) >= 45 AND 
	DATEDIFF(MINUTE, started_at, ended_at) < 60
	)
GROUP BY member_casual