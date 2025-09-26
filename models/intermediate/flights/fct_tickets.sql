{{
    config(
    materialized = 'table'
)
}}

SELECT
  ticket_no,
  book_ref,
  passenger_id,
  passenger_name,
  contact_data
FROM {{ ref('stg_flights__tickets') }}
WHERE passenger_id::text NOT IN (SELECT passenger_id::text FROM {{ ref('stg_dict_passenger_company') }})

