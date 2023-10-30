{% set hit_date_query %}
select distinct
NATION_KEY
from {{ ref('stg_tpch_customers') }}
order by 1
{% endset %}

{% if execute %}
{% set results = run_query(hit_date_query) %}
{% set hit_dates = results.columns[0].values() %}
{% else %}
{% set hit_date = [] %}
{% endif %}

select *
from {{ ref('stg_tpch_customers') }}
 where hit_date in (
  {% for dates in hit_dates %}
  '{{dates}}'
  {% if not loop.last %}
  ,
  {% endif %}
  {% endfor %}
  )