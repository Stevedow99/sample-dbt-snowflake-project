{{
    config(
        materialized='raw_sql'
    )
}}

-- depends on the model {{ ref('sample_model_a') }}

EXECUTE NOTEBOOK STEVE_D_SANDBOX.ANALYTICS."dbt Cloud Analysis Notebook"(
    'dbt-cloud-rocks'
)