{% snapshot snap_city_region %}

    {{
        config(
            target_schema = 'snapshots',
            strategy = 'timestamp',
            unique_key = ['city'],
            updated_at = 'updated_at',
            dbt_valid_to_current = "'9999-12-31'::date",

            hard_delete = "new_record",

            snapshot_meta_column_name={
                "dbt_is_deleted": "dbt_is_deleted"
            }
        )
    }}


SELECT
  city,
  region,
  updated_at
FROM
  {{ ref('city_region') }}


{% endsnapshot %}