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
        as ranking_field
from
    {{ ref('incoming_snapshot_data_example') }})

select
*
from fresh_data 
where ranking_field = 1
