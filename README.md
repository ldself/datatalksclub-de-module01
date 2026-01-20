# DataTalks.Club Data Engineering Zoomcamp - Module 1 Homework

This repository contains my solutions for Module 1 (Docker & Terraform) homework from the [DataTalks.Club Data Engineering Zoomcamp](https://github.com/DataTalksClub/data-engineering-zoomcamp).

## Overview

In this homework, we prepare the environment and practice Docker and SQL. The exercises focus on working with the NYC Green Taxi dataset for November 2025 using PostgreSQL and Docker. The notebook used to answer the questions is located in `pipeline/homework.ipynb`.

## Dataset

- **NYC Green Taxi Trip Records** (November 2025)
- **NYC Taxi Zone Lookup Table**

## Solutions

### Question 3

**Task:** Count trips with distance less than or equal to 1.0 miles in November 2025.

```sql
SELECT COUNT(*)  
FROM public.green_nov_2025_taxi_data  
WHERE trip_distance <= 1.0  
  AND lpep_pickup_datetime >= '2025-11-01' 
  AND lpep_pickup_datetime < '2025-12-01';
```

### Question 4

**Task:** Find the trip with the longest distance (up to 100 miles).

```sql
SELECT lpep_pickup_datetime, trip_distance  
FROM public.green_nov_2025_taxi_data  
WHERE trip_distance <= 100.0  
ORDER BY trip_distance DESC  
LIMIT 1;
```

### Question 5

**Task:** Identify the pickup zone with the most trips on the 18th of the month.

```sql
SELECT z."Zone", COUNT(*) AS ct  
FROM green_nov_2025_taxi_data g  
INNER JOIN taxi_zone_lookup z ON g."PULocationID" = z."LocationID"  
WHERE DATE_PART('day', g.lpep_pickup_datetime) = 18  
GROUP BY z."Zone"  
ORDER BY ct DESC  
LIMIT 1;
```

### Question 6

**Task:** Find the drop-off zone with the highest tip amount for trips picked up from 'East Harlem North' in November 2025.

```sql
SELECT doff."Zone", MAX(tip_amount) AS maxtip  
FROM green_nov_2025_taxi_data g  
INNER JOIN taxi_zone_lookup pu ON g."PULocationID" = pu."LocationID"  
INNER JOIN taxi_zone_lookup doff ON g."DOLocationID" = doff."LocationID"  
WHERE pu."Zone" = 'East Harlem North'  
  AND g.lpep_pickup_datetime >= '2025-11-01'  
  AND g.lpep_pickup_datetime < '2025-12-01'  
GROUP BY doff."Zone"  
ORDER BY maxtip DESC;
```

## Technologies Used

- Docker
- PostgreSQL
- SQL
- Terraform

## Author

[ldself](https://github.com/ldself)

## License

This project is part of the DataTalks.Club Data Engineering Zoomcamp course materials.
