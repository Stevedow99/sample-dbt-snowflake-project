{{
    config(
        materialized='view'
    )
}}

with fresh_data as (

    select
        *,
        RANK()
            over (partition by primary_key order by datetime_modified desc)
            as ranking_field,

        {{ dbt_utils.generate_surrogate_key(['primary_key', 'datetime_modified']) }}  as dbt_scd_id,
        datetime_modified as dbt_updated_at,
        datetime_modified as dbt_valid_from,
        datetime_modified as dbt_valid_to
    from
        {{ ref('incoming_snapshot_data_example') }}
)

select *
from fresh_data
where ranking_field != 1
