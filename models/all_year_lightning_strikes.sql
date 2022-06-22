with all_year_lightning_strikes as (
    select * from `bigquery-public-data`.noaa_lightning.lightning_1987
    
    union all

    select * from `bigquery-public-data`.noaa_lightning.lightning_1988

    union all

    select * from `bigquery-public-data`.noaa_lightning.lightning_1989
)

select * from all_year_lightning_strikes