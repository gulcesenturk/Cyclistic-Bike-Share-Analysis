-- calculating ride_lentgh--


ALTER TABLE  [cyclistic_bike_share].[dbo].[cyclistic_bike] 
ADD ride_length INT;

SELECT DATEDIFF(MINUTE,started_at,ended_at) AS ride_length FROM [cyclistic_bike_share].[dbo].[cyclistic_bike] 


UPDATE [cyclistic_bike_share].[dbo].[cyclistic_bike]

SET ride_length = 
DATEDIFF(MINUTE,started_at, ended_at)FROM [cyclistic_bike_share].[dbo].[cyclistic_bike] 

SELECT * FROM [cyclistic_bike_share].[dbo].[cyclistic_bike] 

--identifying weekdays--

SELECT DATEPART(WEEKDAY, started_at) AS week_day
FROM [cyclistic_bike_share].[dbo].[cyclistic_bike] 

ALTER TABLE  [cyclistic_bike_share].[dbo].[cyclistic_bike] 
ADD week_day INT

UPDATE [cyclistic_bike_share].[dbo].[cyclistic_bike]

SET week_day = DATEPART(WEEKDAY, started_at) FROM [cyclistic_bike_share].[dbo].[cyclistic_bike] 

SELECT * FROM [cyclistic_bike_share].[dbo].[cyclistic_bike] 

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

-- Started time analysis by member and casual users --

-- Month analysis --
SELECT
COUNT(ride_id) AS no_of_users,
DATEPART(MONTH, started_at) as Started_month,
--DATEPART(WEEKDAY, started_at) as Started_day,
--DATEPART(HOUR, started_at) as started_hour,
member_casual
FROM [cyclistic_bike_share].[dbo].[cyclistic_bike] 
GROUP BY 
member_casual,
DATEPART(MONTH, started_at)
ORDER BY COUNT(ride_id) DESC;

-- Day analysis --
SELECT
COUNT(ride_id) AS no_of_users,
--DATEPART(MONTH, started_at) as Started_month,
DATEPART(WEEKDAY, started_at) as Started_day,
--DATEPART(HOUR, started_at) as started_hour,
member_casual
FROM [cyclistic_bike_share].[dbo].[cyclistic_bike] 
GROUP BY 
member_casual,
DATEPART(WEEKDAY, started_at)
ORDER BY COUNT(ride_id) DESC;

-- Hour analysis --
SELECT
COUNT(ride_id) AS no_of_users,
--DATEPART(MONTH, started_at) as Started_month,
--DATEPART(WEEKDAY, started_at) as Started_day,
DATEPART(HOUR, started_at) as started_hour,
member_casual
FROM [cyclistic_bike_share].[dbo].[cyclistic_bike] 
GROUP BY 
member_casual,
DATEPART(HOUR, started_at)
ORDER BY COUNT(ride_id) DESC;

-- Ended time analysis by member and casual users --
-- Month analysis --
SELECT
COUNT(ride_id) AS no_of_users,
DATEPART(MONTH, ended_at) as ended_month,
--DATEPART(WEEKDAY, started_at) as ended_day,
--DATEPART(HOUR, started_at) as ended_hour,
member_casual
FROM [cyclistic_bike_share].[dbo].[cyclistic_bike] 
GROUP BY 
member_casual,
DATEPART(MONTH, ended_at)
ORDER BY COUNT(ride_id) DESC;

-- Day analysis --
SELECT
COUNT(ride_id) AS no_of_users,
--DATEPART(MONTH, ended_at) as ended_month,
DATEPART(WEEKDAY, ended_at) as ended_day,
--DATEPART(HOUR, ended_at) as ended_hour,
member_casual
FROM [cyclistic_bike_share].[dbo].[cyclistic_bike] 
GROUP BY 
member_casual,
DATEPART(WEEKDAY, ended_at)
ORDER BY COUNT(ride_id) DESC;

-- Hour analysis --
SELECT
COUNT(ride_id) AS no_of_users,
--DATEPART(MONTH, ended_at) as ended_month,
--DATEPART(WEEKDAY, started_at) as ended_day,
DATEPART(HOUR, ended_at) as ended_hour,
member_casual
FROM [cyclistic_bike_share].[dbo].[cyclistic_bike] 
GROUP BY 
member_casual,
DATEPART(HOUR, ended_at)
ORDER BY COUNT(ride_id) DESC;