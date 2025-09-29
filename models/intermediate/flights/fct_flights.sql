{{
    config(
    materialized = 'table'
)
}}

SELECT
  flight_id,
  flight_no,
  scheduled_departure,
  scheduled_arrival,
  departure_airport,
  arrival_airport,
  status,
  aircraft_code,
  actual_departure,
  actual_arrival,
  CASE 
      WHEN actual_departure IS NOT NULL AND scheduled_departure < actual_departure
      THEN actual_departure - scheduled_departure
      ELSE INTERVAL '0 seconds' 
  END as flight_departure_delay
FROM {{ ref('stg_flights__flights') }}
