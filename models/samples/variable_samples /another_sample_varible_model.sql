{{ config(
    tags=["finance"]
) }}

Select

1 as one,

'{{ var("config1")["name"] }}' as test_field
