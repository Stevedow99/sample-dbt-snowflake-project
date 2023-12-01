{%- macro get_data_from_query(sql_to_run_and_return_results, model_to_select_from=none) -%}


    {%- if model_to_select_from != none -%}

        {# if we reference a dbt model we use this #}
        {%- set query_to_warehouse -%}
            {{ sql_to_run_and_return_results }} from {{ref(model_to_select_from)}}
        {%- endset -%}

    {%- else -%}

        {# if it's a basic query with hard coding we use this #}
        {%- set query_to_warehouse -%}
            {{ sql_to_run_and_return_results }}
        {%- endset -%}

    {%- endif -%}

    {%- set query_results = run_query(query_to_warehouse) -%}


    {# Return the results if we execute #}
    {%- if execute -%}
        {# this sets them #}
        {%- set results_output = query_results -%}

        {# this returns them #}
        {{results_output}}

    {%- endif -%}

    

{%- endmacro -%}
