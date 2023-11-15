with base as (
  select *
  from {{ ref('stg_tpch_orders') }}
)

, sampled as (
  select *
  from base
  where rand() < 0.01 -- Adjust the sampling rate as needed
)

select *
from sampled
where total_price < 0