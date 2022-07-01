{{
    config(
        materialized='table'
    )
}}

with strike_data as (
    select
        g.lat_int,
        g.long_ing,
        SUM(s.number_of_strikes)
    from
        noaa.all_year_lightning_strikes as s
    inner join
        noaa.generalized_location as g
    on
        s.center_point_geom = g.center_point_geom
    group by
        g.lat_int, g.long_int
)

select * from strike_data