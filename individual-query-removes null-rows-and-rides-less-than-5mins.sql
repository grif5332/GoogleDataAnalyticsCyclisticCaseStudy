SELECT 
	[ride_id],
	[rideable_type],
	[started_at],
	[ended_at],
	DATEADD(SECOND, DATEDIFF(SECOND, started_at, ended_at), CONVERT(time(0), '00:00')) AS ride_length,
	DATENAME(WEEKDAY, started_at) AS day_of_week, -- adds col for named day of the week,
	DATENAME(MONTH, started_at) AS month_of_trip,
	[start_station_name],
	[start_station_id],
	[end_station_name],
	[end_station_id],
	[start_lat],
	[start_lng],
	[end_lat],
	[end_lng],
	[member_casual]
  FROM [dbo].[2022-07-divvy-tripdata]
  WHERE ( -- this set will remove all rows with nulls.
	ride_id IS NOT NULL AND
	rideable_type IS NOT NULL AND
	started_at IS NOT NULL AND
	ended_at IS NOT NULL AND
	start_station_name IS NOT NULL AND
	start_station_id IS NOT NULL AND
	end_station_name  IS NOT NULL AND
	end_station_id  IS NOT NULL
	) 
		AND
		DATEDIFF(MINUTE, started_at, ended_at) > 5 -- removes rides less than 5 minutes
		AND
		start_station_name != '351' -- removes the station 351 (unknown)
ORDER BY started_at