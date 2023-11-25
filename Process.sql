-- calculating ride_lentgh--

ALTER TABLE  [cyclistic_bike_share].[dbo].[cyclistic_bike] 
ADD ride_length INT;


UPDATE [cyclistic_bike_share].[dbo].[cyclistic_bike]
SET ride_length = 
DATEDIFF(MINUTE,started_at, ended_at)FROM [cyclistic_bike_share].[dbo].[cyclistic_bike] 

--identifying started weekdays--

ALTER TABLE  [cyclistic_bike_share].[dbo].[cyclistic_bike] 
ADD started_week_day INT

UPDATE [cyclistic_bike_share].[dbo].[cyclistic_bike]
SET started_week_day = DATEPART(WEEKDAY, started_at) FROM [cyclistic_bike_share].[dbo].[cyclistic_bike] 


--identifying started month--


ALTER TABLE  [cyclistic_bike_share].[dbo].[cyclistic_bike] 
ADD started_month INT

UPDATE [cyclistic_bike_share].[dbo].[cyclistic_bike]
SET started_month = DATEPART(MONTH, started_at) FROM [cyclistic_bike_share].[dbo].[cyclistic_bike] 

--identifying started hour--


ALTER TABLE  [cyclistic_bike_share].[dbo].[cyclistic_bike] 
ADD started_hour INT

UPDATE [cyclistic_bike_share].[dbo].[cyclistic_bike]
SET started_hour = DATEPART(HOUR, started_at) FROM [cyclistic_bike_share].[dbo].[cyclistic_bike] 

select * FROM [cyclistic_bike_share].[dbo].[cyclistic_bike] 

--identifying ended weekdays--

ALTER TABLE  [cyclistic_bike_share].[dbo].[cyclistic_bike] 
ADD ended_week_day INT

UPDATE [cyclistic_bike_share].[dbo].[cyclistic_bike]
SET ended_week_day = DATEPART(WEEKDAY, ended_at) FROM [cyclistic_bike_share].[dbo].[cyclistic_bike] 

--identifying ended month--

ALTER TABLE  [cyclistic_bike_share].[dbo].[cyclistic_bike] 
ADD ended_month INT

UPDATE [cyclistic_bike_share].[dbo].[cyclistic_bike]
SET ended_month = DATEPART(MONTH, ended_at) FROM [cyclistic_bike_share].[dbo].[cyclistic_bike] 

--identifying ended hour--

ALTER TABLE  [cyclistic_bike_share].[dbo].[cyclistic_bike] 
ADD ended_hour INT

UPDATE [cyclistic_bike_share].[dbo].[cyclistic_bike]
SET ended_hour = DATEPART(HOUR, ended_at) FROM [cyclistic_bike_share].[dbo].[cyclistic_bike]  


--average ride_lentgh by rideable_type

SELECT rideable_type, member_casual, AVG(ride_length) AS average_ride_length
FROM [cyclistic_bike_share].[dbo].[cyclistic_bike] 
GROUP BY rideable_type,
member_casual

-- Riders by member and casual users --

SELECT 
COUNT(ride_id) AS no_of_riders,
member_casual
FROM [cyclistic_bike_share].[dbo].[cyclistic_bike] 
GROUP BY 
member_casual;

-- Rideable-type by members and casual users --

SELECT
COUNT(ride_id) AS no_of_riders,
rideable_type,
member_casual
FROM [cyclistic_bike_share].[dbo].[cyclistic_bike] 
GROUP BY 
rideable_type,
member_casual
ORDER BY 
COUNT(ride_id) DESC;

-- Mostly used start station by member and casual users --

SELECT TOP 10
COUNT(ride_id) AS no_of_riders,
start_station_name,
member_casual
FROM [cyclistic_bike_share].[dbo].[cyclistic_bike] 
GROUP BY 
start_station_name,
member_casual
ORDER BY 
COUNT(ride_id) DESC;

-- Mostly used end station by member and casual users --

SELECT TOP 10
COUNT(ride_id) AS no_of_riders,
end_station_name,
member_casual
FROM [cyclistic_bike_share].[dbo].[cyclistic_bike] 
GROUP BY 
end_station_name,
member_casual
ORDER BY 
COUNT(ride_id) DESC;

-- Started time analysis by member and casual users --

-- Month analysis --

SELECT
COUNT(ride_id) AS no_of_users,started_month,
member_casual
FROM [cyclistic_bike_share].[dbo].[cyclistic_bike] 
GROUP BY 
member_casual,
started_month
ORDER BY COUNT(ride_id) DESC;

-- Day analysis --

SELECT
COUNT(ride_id) AS no_of_users, started_week_day, member_casual
FROM [cyclistic_bike_share].[dbo].[cyclistic_bike] 
GROUP BY 
member_casual,
week_day
ORDER BY COUNT(ride_id) DESC;

-- Hour analysis --

SELECT
COUNT(ride_id) AS no_of_users,started_hour,member_casual
FROM [cyclistic_bike_share].[dbo].[cyclistic_bike] 
GROUP BY 
member_casual,
started_hour
ORDER BY COUNT(ride_id) DESC;

-- Ended time analysis by member and casual users --
-- Month analysis --

SELECT
COUNT(ride_id) AS no_of_users, ended_month, member_casual
FROM [cyclistic_bike_share].[dbo].[cyclistic_bike] 
GROUP BY 
member_casual,
ended_month
ORDER BY COUNT(ride_id) DESC;

-- Day analysis --

SELECT
COUNT(ride_id) AS no_of_users, ended_week_day, member_casual
FROM [cyclistic_bike_share].[dbo].[cyclistic_bike] 
GROUP BY 
member_casual,
ended_week_day
ORDER BY COUNT(ride_id) DESC;

-- Hour analysis --

SELECT
COUNT(ride_id) AS no_of_users, ended_hour, member_casual
FROM [cyclistic_bike_share].[dbo].[cyclistic_bike] 
GROUP BY 
member_casual,
ended_hour
ORDER BY COUNT(ride_id) DESC;

SELECT * FROM [cyclistic_bike_share].[dbo].[cyclistic_bike] 


