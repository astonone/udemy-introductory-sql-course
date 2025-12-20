-- step 1
select band_id, name, year
    from band
where name = 'Led Zeppelin';

-- step 2
select *
    from album
where band_id = 388;
