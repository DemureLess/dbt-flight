{{
    config(
    materialized = 'table'
)
}}

select *
from {{ ref('stg_flights__tickets') }}
join {{ ref('stg_flights__flights') }} on {{ ref('stg_flights__tickets') }}.flight_id = {{ ref('stg_flights__flights') }}.flight_id

    