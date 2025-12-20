-- step 1
select name, count(name)
    from band
group by name;

-- step 2
select name, count(name)
    from band
group by name
having count(name) >= 2;

-- step 3
select name, count(name) as band_count
    from band
group by name
having count(name) >= 2
order by band_count desc;

-- step 4
-- without subquery
select band_id, count(album_id) as album_count
    from album
group by band_id
order by album_count desc
limit 1;

select *
    from band
where band_id = 562672;

-- with subquery
select *
    from band
where band_id = (select band_id
                 from album
                 group by band_id
                 order by count(album_id) desc
                 limit 1);

