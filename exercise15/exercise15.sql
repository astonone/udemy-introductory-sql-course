-- step 1
select *,
       row_number() over (partition by band_id
           order by year) as album_num
from album
where band_id in (93, 192)
order by band_id, year;

-- step 2
with albums_with_nums as (select *,
                                 row_number() over (partition by band_id
                                     order by year) as album_num
                          from album
                          where band_id in (93, 192)
                          order by band_id, year)
select *
from albums_with_nums
where album_num <= 3;

-- step 3
with albums_count_by_year as (select year,
                                     count(*) as album_count
                              from album
                              group by year)
   , albums_count_by_year_ranged as (select *,
                                            row_number() over (order by album_count desc) as rn,
                                            rank() over (order by album_count desc)       as rank,
                                            dense_rank() over (order by album_count desc) as d_rank
                                     from albums_count_by_year)
select *
from albums_count_by_year_ranged
where d_rank <= 3
order by album_count desc;
