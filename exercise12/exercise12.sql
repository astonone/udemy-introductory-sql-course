-- step 1
create table album_sales
(
    album_id    INTEGER,
    name        VARCHAR,
    band_id     INTEGER,
    year        SMALLINT,
    total_sales NUMERIC
);
insert into album_sales
select album_id,
       name,
       band_id,
       year,
       100000 / ((2015 - coalesce(year, 1900)) *
                 (2015 - coalesce(year, 1900))) *
       character_length(name) as total_sales
from album
where year < 2015;

-- step 2
select year,
       sum(total_sales)
from album_sales
group by year
order by 2 desc;

-- step 3
select year,
       sales,
       sales * 100.00 / sum(sales) over () as percentage
from (select year,
             sum(total_sales) as sales
      from album_sales
      group by year
      order by 2 desc) as year_sales;
