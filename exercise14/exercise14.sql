-- step 1
CREATE TABLE weather
(
    the_date     DATE,
    weather_type VARCHAR
);

INSERT INTO weather
VALUES (date '2023-01-01', 'Sunny'),
       (date '2023-01-02', 'Snow'),
       (date '2023-01-03', 'Sunny'),
       (date '2023-01-04', 'Sunny'),
       (date '2023-01-05', 'Sunny'),
       (date '2023-01-06', 'Cloudy'),
       (date '2023-01-07', 'Sunny'),
       (date '2023-01-08', 'Sunny'),
       (date '2023-01-09', 'Snow'),
       (date '2023-01-10', 'Snow'),
       (date '2023-01-11', 'Snow'),
       (date '2023-01-12', 'Snow');

-- step 2
select *,
       lag(weather_type, 1) over (order by the_date) as previous_weather_type
from weather;

-- step 3
with weather_with_previous_days as (select *,
                                           lag(weather_type, 1) over (order by the_date) as previous_weather_type
                                    from weather)
select *,
       (case
            when weather_type <> previous_weather_type then 1
            else 0
           end) as difference
from weather_with_previous_days;

-- step 4
with weather_with_previous_days as (select *,
                                           lag(weather_type, 1) over (order by the_date) as previous_weather_type
                                    from weather)
   , weather_with_previous_days_and_difference as (select *,
                                                          (case
                                                               when weather_type <> previous_weather_type then 1
                                                               else 0
                                                              end) as difference
                                                   from weather_with_previous_days)
select *,
       sum(difference) over (order by the_date
           rows between unbounded preceding
               and current row
           ) as cumulative
from weather_with_previous_days_and_difference;

-- step 5
with weather_with_previous_days as (select *,
                                           lag(weather_type, 1) over (order by the_date) as previous_weather_type
                                    from weather)
   , weather_with_previous_days_and_difference as (select *,
                                                          (case
                                                               when weather_type <> previous_weather_type then 1
                                                               else 0
                                                              end) as difference
                                                   from weather_with_previous_days)
   , weather_with_previous_days_and_difference_and_cumulative as (select *,
                                                                         sum(difference) over (order by the_date
                                                                             rows between unbounded preceding
                                                                                 and current row
                                                                             ) as cumulative
                                                                  from weather_with_previous_days_and_difference)
select
       cumulative,
       weather_type,
       count(weather_type) as number_of_days
from weather_with_previous_days_and_difference_and_cumulative
group by cumulative, weather_type
order by cumulative;

-- step 6
with weather_with_previous_days as (select *,
                                           lag(weather_type, 1) over (order by the_date) as previous_weather_type
                                    from weather)
   , weather_with_previous_days_and_difference as (select *,
                                                          (case
                                                               when weather_type <> previous_weather_type then 1
                                                               else 0
                                                              end) as difference
                                                   from weather_with_previous_days)
   , weather_with_previous_days_and_difference_and_cumulative as (select *,
                                                                         sum(difference) over (order by the_date
                                                                             rows between unbounded preceding
                                                                                 and current row
                                                                             ) as cumulative
                                                                  from weather_with_previous_days_and_difference)
    , sunny_periods as (select
                            cumulative,
                            weather_type,
                            count(weather_type) as number_of_days
                        from weather_with_previous_days_and_difference_and_cumulative
                        where weather_type = 'Sunny'
                        group by cumulative, weather_type
                        order by cumulative)
select max(number_of_days) from sunny_periods;

