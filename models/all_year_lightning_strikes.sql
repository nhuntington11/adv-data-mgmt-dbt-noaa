{{
    config(
        materialized='table'
    )
}}

with all_year_lightning_strikes as (
    select * from `bigquery-public-data`.noaa_lightning.lightning_1987
    
    union all

    select * from `bigquery-public-data`.noaa_lightning.lightning_1988

    union all

    select * from `bigquery-public-data`.noaa_lightning.lightning_1989

    union all

    select * from `bigquery-public-data`.noaa_lightning.lightning_1990

    union all

    select * from `bigquery-public-data`.noaa_lightning.lightning_1991

    union all

    select * from `bigquery-public-data`.noaa_lightning.lightning_1992

    union all

    select * from `bigquery-public-data`.noaa_lightning.lightning_1993

    union all

    select * from `bigquery-public-data`.noaa_lightning.lightning_1994
),

final as (
    select
        sum(number_of_strikes) as sum_strikes,
        date
    from
        all_year_lightning_strikes
    group by
        date
)

select * from final