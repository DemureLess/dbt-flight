{% snapshot dim_fligths_airports %}

    {{
        config(
            target_schema = 'snapshots',
            strategy = 'check',
            unique_key = ['airport_code'],
            check_cols = ['airport_name', 'city', 'coordinates', 'timezone'],
            dbt_valid_to_current = "'9999-12-31'::date"
        )
    }}

SELECT
  airport_code,
  airport_name,
  city,
  coordinates,
  timezone
FROM {{ ref('stg_flights__airports') }}

{% endsnapshot %}