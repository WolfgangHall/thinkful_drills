#1. What are the three longest trips on rainy days?
SELECT
    trips.duration,
    trips.start_date,
    trips.trip_id
FROM
    trips
JOIN
    weather
# consulted solutions for this ON statement
ON
    DATE(trips.start_date) = weather.Date
WHERE
    weather.Events = 'Rain'
ORDER BY 1 DESC
LIMIT 3


#2. What is the average number of open docks in each station on days where it is raining in that zip code?
# consulted solutions
WITH rain_stations AS (
    SELECT
        w.Date,
        w.ZIP,
        s.station_id
    FROM weather w
    JOIN trips t
        ON t.zip_code = w.ZIP
    JOIN stations s
        ON s.name = t.start_station
    WHERE
        w.PrecipitationIn != 0
    GROUP BY 1,2,3
)

SELECT
      AVG(st.docks_available),
      r.station_id
FROM
      status st
JOIN
      rain_stations r
ON
    st.station_id = r.station_id AND
    Date(st.timestamp) = r.Date
GROUP BY 2


#3. Which station is empty most often?
# consulted solutions
SELECT
    status.station_id,
    COUNT(*)
FROM
    status
WHERE
    status.bikes_available = 0
GROUP BY 1
ORDER BY 2 DESC
