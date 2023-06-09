{% snapshot orders_snapshot %}

{{
    config(
      target_schema='snapshots',
      unique_key='primary_key',
      strategy='timestamp',
      updated_at='datetime_modified',
      post_hook=["INSERT INTO {{ this }} SELECT * FROM {{ ref('stale_keys_temp_model') }} "]
  
    )
}}

select * from {{ ref('fresh_keys_temp_model') }}

{% endsnapshot %}