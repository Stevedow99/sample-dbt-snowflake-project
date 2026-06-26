{{
    config(
        database='awesome_database',
        schema='awesome_schema'
    )
}}



select
    1 as id,
    'example' as status,
    current_date as created_date,
    'example-' || 1 as example_key,
    upper('sample model') as note
