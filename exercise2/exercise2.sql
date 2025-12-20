-- step 1
select *
    from album
where band_id in (select band_id
                 from band
                 where name = 'Led Zeppelin');
