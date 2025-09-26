{{
    config(
        materialized = 'table'
    )
}}
SELECT passenger_id
FROM {{ ref('passenger_company') }}