# datatalksclub-de-module01
Module 1 (Docker-Terraform) from the DataTalks Data Engineering zoomcamp


Question 3

select count(*)

from public.green_nov_2025_taxi_data

where

trip_distance <= 1.0

and lpep_pickup_datetime >= '2025-11-01' and lpep_pickup_datetime < '2025-12-01'


Question 4

select lpep_pickup_datetime, trip_distance

from public.green_nov_2025_taxi_data

where trip_distance <= 100.0

order by trip_distance desc

limit 1


Question 5

select z."Zone", count(*) as ct

from green_nov_2025_taxi_data g

inner join taxi_zone_lookup z on g."PULocationID" = z."LocationID"

where DATE_PART('day', g.lpep_pickup_datetime) = 18

group by z."Zone"

order by ct desc

limit 1


Question 6

select doff."Zone", max(tip_amount) maxtip

from green_nov_2025_taxi_data g

inner join taxi_zone_lookup pu on g."PULocationID" = pu."LocationID"

inner join taxi_zone_lookup doff on g."DOLocationID" = doff."LocationID"

where pu."Zone" = 'East Harlem North'

and g.lpep_pickup_datetime >= '2025-11-01'

and g.lpep_pickup_datetime < '2025-12-01'

group by doff."Zone"

order by maxtip desc
