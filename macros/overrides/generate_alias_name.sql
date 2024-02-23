{% macro generate_alias_name(custom_alias_name=none, node=none) -%}

    {%- if custom_alias_name is none -%}
        {%- set table_name = node.name -%}
    {%- else -%}
        {%- set table_name = custom_alias_name | trim -%}
    {%- endif -%}

    {% if env_var("DBT_ENV_NAME") in ('PRD', 'CI') %}
    
        {#- Get the custom schema name -#}
        {%- set schema_prefix = node.unrendered_config.schema | trim %}

        {{ schema_prefix ~ "__" ~ table_name }}

    {% elif env_var("DBT_ENV_NAME") == 'DEV' %}

        {{ table_name }}
        
    {%- endif -%}
{%- endmacro %}