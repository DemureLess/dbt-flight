{{ 

    config(
    materialized = 'incremental',
    incremental_strategy = 'append',
    tags = ['bookings'],

    ) 
}}

SELECT
  book_ref,
  book_date,
  total_amount
FROM {{ source('demo_src', 'bookings') }}

{% if is_incremental() %}
WHERE 'Ox' || book_ref::bigint > (SELECT MAX('Ox' || book_ref::bigint) FROM {{ this }})
{% endif %}