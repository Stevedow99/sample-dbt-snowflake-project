{% macro log_env_var_info() %}

  {% set env_var_set = env_var('DBT_ENV_NAME') %}

  {% set message = "Running in the '" ~ target_name ~ "' dbt target." %}

  {{ log('=================================================', info=True) }}
  {{ log('=================================================', info=True) }}
  {{ log('=================================================', info=True) }}
  {{ log('=================================================', info=True) }}

  {{ log(env_var_set, info=True) }}

  {{ log('=================================================', info=True) }}
  {{ log('=================================================', info=True) }}
  {{ log('=================================================', info=True) }}
  {{ log('=================================================', info=True) }}

{% endmacro %}