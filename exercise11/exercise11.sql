-- step 1
select a.album_id, a.name as album_name,
       b.band_id, b.name as band_name,
       case
           when a.name = b.name then 1
           else 0
       end as self_titled
    from album as a
    join band as b on a.band_id = b.band_id;

-- step 2
select sum(
       case
           when a.name = b.name then 1
           else 0
       end
       )
from album as a
         join band as b on a.band_id = b.band_id;

--step 3
select sum(
       case
           when a.name in (select b.name from band as b) then 1
           else 0
       end
       )
    from album as a;
