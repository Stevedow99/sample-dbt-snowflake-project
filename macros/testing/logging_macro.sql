{% macro log_message(message) %}

  {{ log(message, info=True) }}

{% endmacro %}



{% macro log_target_info() %}
  {% set target_name = target.name %}
  {% set message = "Running in the '" ~ target_name ~ "' dbt target." %}

  {{ log('=================================================', info=True) }}
  {{ log('=================================================', info=True) }}
  {{ log('=================================================', info=True) }}
  {{ log('=================================================', info=True) }}
  {{ log(message, info=True) }}
  {{ log('=================================================', info=True) }}
  {{ log('=================================================', info=True) }}
  {{ log('=================================================', info=True) }}
  {{ log('=================================================', info=True) }}

{% endmacro %}