{% macro generate_schema_name(custom_schema_name, node) -%}

    {%- set default_schema = target.schema -%}
    {%- set env_name = env_var('DBT_ENV_NAME', target.name) | lower -%}

    {% if env_name in ('dev', 'development', 'ci') %}

        {{ default_schema }}

    {% elif env_name in ('prd', 'prod', 'production') %}

        {%- if custom_schema_name is none -%}
            {{ default_schema }}
        {%- else -%}
            {{ default_schema ~ '_' ~ custom_schema_name | trim }}
        {%- endif -%}

    {% else %}

        {%- if custom_schema_name is none -%}
            {{ default_schema }}
        {%- else -%}
            {{ default_schema ~ '_' ~ custom_schema_name | trim }}
        {%- endif -%}

    {%- endif -%}

{%- endmacro %}
