/* 
This queries the cyclistic tripdata rounded geo table.
It then returns only the highest station_ttl for each station name.

Rejects Hubbard Bike-checking (LBS-WH-TEST) as this is a testing location 
and should not be shown as a customer accessed location.

Shows station name, id, latitude, and longitude.
*/
SELECT 
	station_max.start_station_name,
	station_max.start_station_id,
	ROUND(AVG(station_max.start_lat),3) AS latitude,
	ROUND(AVG(station_max.start_lng),3) AS longitude,
	MAX(station_max.station_ttl) AS max_ttl
FROM (
	SELECT
		[start_station_name],
		[start_station_id],
		[start_lat],
		[start_lng],
		COUNT(start_station_name) AS station_ttl
	FROM dbo.cyclistic_tripdata_2021_2022
	WHERE (start_station_id != 'Hubbard Bike-checking (LBS-WH-TEST)')
	GROUP BY
		[start_station_name],
		[start_station_id],
		[start_lat],
		[start_lng]
	) AS station_max
GROUP BY 
	station_max.start_station_id,
	station_max.start_station_name /*,
	station_max.start_lat_rnd,
	station_max.start_lng_rnd */