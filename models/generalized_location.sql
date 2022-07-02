{{
    config(
        materialized='table'
    )
}}

with location_group as (
    select 
        center_point_geom,
        number_of_strikes,
        date,
        SPLIT(
            RTRIM(
                LTRIM(
                    ST_ASTEXT(center_point_geom),
                    'POINT('),
                ')'),
        ' ') as location_text
    from noaa.all_year_lightning_strikes
),

lat_long_group as (
    select
        center_point_geom,
        number_of_strikes,
        date,
        CAST(
            CAST(
                location_text[OFFSET(0)]
                as FLOAT64) as INT64) as lat_int,
        CAST(
            CAST(
                location_text[OFFSET(1)]
                as FLOAT64) as INT64) as long_int
    from
        location_group
), 

strikes_by_location as (
    select
        lat_int,
        long_int,
        SUM(number_of_strikes) as total_strikes
    from
        lat_long_group
    group by
        lat_int, long_int
)

select * from strikes_by_location