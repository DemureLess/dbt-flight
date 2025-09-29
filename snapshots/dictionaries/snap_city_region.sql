{% snapshot snap_city_region %}

    {{
        config(
            target_schema = 'snapshots',
            strategy = 'timestamp',
            unique_key = ['city'],
            updated_at = 'updated_at',
            invalidate_hard_deletes = true,

            snapshot_meta_column_names={
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