{{
    config(
        materialized='table'
    )
}}

{%- set year_range = get_year_range() -%}

with a as (
    {% for year in year_range %}
        select 
            *
        from `bigquery-public-data`.noaa_lightning.lightning_{{ year }}
        {% if not loop.last %} 
            union all 
        {% endif %}
    {% endfor %}
)

select * from a