with strikes_by_date as (
    select
        count(number_of_strikes) as nos,
        date,
    from
        `bigquery-public-data`.noaa_lightning.lightning_1987
    group by 
        date
) 

select date, nos from strikes_by_date