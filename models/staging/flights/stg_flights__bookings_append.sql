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
  WHERE book_date > (
    SELECT COALESCE(MAX(book_date), TIMESTAMP '1900-01-01 00:00:00')
    FROM {{ this }}
  )
{% endif %}