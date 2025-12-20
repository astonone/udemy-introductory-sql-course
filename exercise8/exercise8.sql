-- step 1
select band_id
    from album
where name = 'Now';

-- step 2
select band_id
    from album
where name = 'The Collection';

-- step 3
select band_id
    from album
where name = 'Now'
    intersect
select band_id
    from album
where name = 'The Collection';

-- step 4
select *
    from band
where band_id in (select band_id
                    from album
                  where name = 'Now'
                    intersect
                  select band_id
                    from album
                  where name = 'The Collection');
