--3
select count(*) from yellow_taxi_trips
where lpep_pickup_datetime::date = date '2019-01-15'
and lpep_dropoff_datetime::date = date '2019-01-15'
;
--4
select date(lpep_pickup_datetime) from yellow_taxi_trips
WHERE trip_distance = (SELECT MAX(trip_distance) FROM yellow_taxi_trips)
;
--5 
select passenger_count, count(*)
from yellow_taxi_trips
where date(lpep_pickup_datetime) = date '2019-01-01'
and passenger_count IN (2,3)
GROUP BY 1
ORDER BY 1 ASC
;
--6
select tzldo."Zone"
from yellow_taxi_trips ytt inner join 
taxi_zone_lookup pu on ytt."PULocationID" = pu."LocationID"
inner join taxi_zone_lookup tzldo on ytt."DOLocationID" = tzldo."LocationID"
WHERE pu."Zone" = 'Astoria'
ORDER BY ytt.tip_amount DESC
LIMIT 1