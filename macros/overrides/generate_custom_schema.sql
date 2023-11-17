{% macro generate_schema_name(custom_schema_name, node) -%}

    {%- set default_schema = target.schema -%}

    {% if env_var("DBT_ENV_NAME") == 'DEV' %}


            {{ 'DEV__' ~ default_schema }}


    {% elif env_var("DBT_ENV_NAME") == 'PRD' %}

        {%- if custom_schema_name is none -%}

            {{ 'PRD__' ~ default_schema }}

        {%- else  -%}

            {{'PRD__' ~ default_schema ~ custom_schema_name | trim }}

        {%- endif -%}

    {%- endif -%}

{%- endmacro %}