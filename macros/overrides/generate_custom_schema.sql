{% macro generate_schema_name(custom_schema_name, node) -%}

    {%- set default_schema = target.schema -%}
    {%- if custom_schema_name is none -%}

        this_is_always_my_schema

    {%- else -%}

        this_is_always_my_schema

    {%- endif -%}

{%- endmacro %}