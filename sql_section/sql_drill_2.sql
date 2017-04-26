1. What was the hottest day? Where was that?
SELECT
    Date,
    max(MaxTemperatureF) highest_temp,
    ZIP
FROM
    weather


2. How many trips started at each station?
SELECT
    start_station,
    COUNT(*) start_station_count
FROM
    trips
GROUP BY
    start_station


3. What is the shortest trip that happened?
SELECT
    trip_id,
    min(duration) shortest_duration
FROM
    trips


4. What is the average trip duration, by end station?
SELECT
    end_station,
    AVG(duration)
FROM
    trips
GROUP BY end_station
