{% macro generate_alias_name(custom_alias_name=none, node=none) -%}

    {%- if custom_alias_name is none -%}
        {%- set table_name = node.name -%}
    {%- else -%}
        {%- set table_name = custom_alias_name | trim -%}
    {%- endif -%}

    {%- set env_name = env_var('DBT_ENV_NAME', target.name) | lower -%}
    {%- set custom_schema = node.unrendered_config.get('schema') if node is not none and node.unrendered_config is not none else none -%}

    {% if env_name in ('prd', 'prod', 'production', 'ci') and custom_schema is not none %}

        {{ custom_schema | trim ~ "__" ~ table_name }}

    {% else %}

        {{ table_name }}

    {%- endif -%}

{%- endmacro %}
