{{
    config(
        schema='revenue'
    )
}}

select
    date_trunc(month, order_date) as order_month,
    sum(gross_item_sales_amount) as gross_revenue,
    {{ get_data_from_query( sql_to_run_and_return_results = "select 1" ) }} as one

from {{ ref('fct_order_items') }}
    group by 
        order_month,
        one
    order by 
        order_month,
        one