-- step 1
select *
    from band
where name = 'Led Zeppelin';

-- step 2
select *
    from band as b
    inner join album as a on a.band_id = b.band_id -- JOIN is equivalent to INNER JOIN
where b.name = 'Led Zeppelin';
