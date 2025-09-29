{%- set aircraft_query %}
    SELECT DISTINCT aircraft_code
    FROM dwh_flight.intermediate.fct_flights
{% endset %}

{% set aircraft_codes = run_query(aircraft_query) %}
{% if execute %}
  {% set important_aircraft_code = aircraft_codes.columns[0].values() %}
{% else %}
{% set important_aircraft_code = [] %}
{% endif %}

SELECT
  {% for aircraft_code in important_aircraft_code %}
    SUM(CASE WHEN aircraft_code = '{{ aircraft_code }}' THEN 1 ELSE 0 END) AS flights_{{ aircraft_code }} 
    {%- if not loop.last %} , {% endif %}
  {%- endfor %}
FROM dwh_flight.intermediate.fct_flights
