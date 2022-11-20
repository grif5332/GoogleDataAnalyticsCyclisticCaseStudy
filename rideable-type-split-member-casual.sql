SELECT
	rideable_type,
	member_casual,
	COUNT(*)
FROM dbo.cyclistic_tripdata_2021_2022
GROUP BY rideable_type, member_casual