{% macro generate_alias_name(custom_alias_name=none, node=none) -%}

    {# 
       1. DETERMINE BASE TABLE NAME
       If a custom alias is explicitly set in the model config, use it (trimmed of whitespace).
       Otherwise, default to the standard dbt node/model name.
    #}
    {%- if custom_alias_name is none -%}
        {%- set table_name = node.name -%}
    {%- else -%}
        {%- set table_name = custom_alias_name | trim -%}
    {%- endif -%}

    {# 
       2. IDENTIFY THE ENVIRONMENT
       Fetch the environment name from the 'DBT_ENV_NAME' environment variable.
       If that variable doesn't exist, fall back to the profile's 'target.name'.
       Convert everything to lowercase to ensure matching isn't broken by case sensitivity.
    #}
    {%- set env_name = env_var('DBT_ENV_NAME') | lower -%}
    
    {# 
       3. CONDITIONAL ROUTING BASED ON ENVIRONMENT
    #}
    {% if env_name in ('PROD', 'QA') %}

        {# PRODUCTION / CI: If a custom schema is defined, prefix the table name with it (e.g., schema__table) #}
        {{ table_name }}

    {% elif env_name == 'DEV' %}

        {# DEVELOPMENT: Append the current target name to the end of the table name (e.g., table__dev_user) #}
        {{ table_name ~ "__" ~ target.name }}

    {% else %}

        {# DEFAULT: For any other environments, just output the standard table name unchanged #}
        {{ table_name }}

    {%- endif -%}

{%- endmacro %}