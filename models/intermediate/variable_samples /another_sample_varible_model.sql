{{ config(
    tags=["finance_team"]
) }}

Select

1 as one,

'{{ var("config1")["name"] }}' as this_is_name,
'{{ 'activation' if var("config1")["something"]|length == 0 else var("config1")["something"] }}' as this_is_something

