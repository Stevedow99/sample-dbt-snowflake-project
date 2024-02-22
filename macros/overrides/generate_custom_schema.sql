{% macro generate_schema_name(custom_schema_name, node) -%}

    {%- set default_schema = target.schema -%}

    {% if env_var("DBT_ENV_NAME") in ('DEV', 'CI') %}

            {{ default_schema }}

    {% elif env_var("DBT_ENV_NAME") == 'PRD' %}

        {%- if custom_schema_name is none -%}

            {{ default_schema }}

        {%- else  -%}

            {{ default_schema ~ '_' ~ custom_schema_name | trim }}

        {%- endif -%}

    {%- endif -%}

{%- endmacro %}