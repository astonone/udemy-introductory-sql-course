-- step 1
create table band_extended_backup as
    select * from band_extended;

select count(*)
    from band_extended_backup;

-- step 2
select
    sum(n_albums)
    from band_extended;

select
    count(*)
    from album;

-- step 3
update band_extended set n_albums = null where name = 'Metallica';

-- step 4
insert into
    band_extended
        (band_id, name, year, comment, n_albums, n_songs)
    values
        (-100, 'My Test Music Group', 2000, 'My Comment', 25, 54);

select * from band_extended where band_id = -100;

select count(*) from band_extended;

-- step 5
delete from band_extended where name = 'Queen';
select * from band_extended where name = 'Queen';
select count(*) from band_extended;
