-- step 1
with recursive recursive_table as (
    select
        level_1.parent_id,
        cast(null as character varying) as parent_name,
        level_1.id,
        level_1.name,
        1 as depth,
        cast(level_1.name as character varying) as path
    from music_instrument as level_1 where level_1.id = 1

    union all

    select
        previous.id as parent_id,
        previous.name as parent_name,
        next.id,
        next.name,
        previous.depth + 1 as depth,
        previous.path || '->' || next.name as path
    from recursive_table as previous
    left join music_instrument as next on next.parent_id = previous.id

    where depth <= 100
    and next.id is not null
) select * from recursive_table order by depth, parent_name, name;

-- step 2
with artist_first_names as (
    select
        substr(name, 1, position(' ' in name) - 1) as first_name
    from person
        where
            position(substr(name, 1, 1) in 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') > 0
            and name like '% %'
) select
      first_name,
      count(*)
  from
      artist_first_names
    group by first_name
    order by 2 desc;

-- step 3
with band_album_counts as
    (
        select
            b.name as band_name,
            a.band_id,
            count(a.band_id) as album_count
        from album as a
        join band as b on b.band_id = a.band_id
        group by a.band_id, b.name
),
    average_album_count as (
        select
            avg(album_count) as average_count
        from band_album_counts
    )
    select
        band_name,
        album_count
    from band_album_counts
    where album_count > (select average_count from average_album_count)
    order by album_count desc, band_name;
