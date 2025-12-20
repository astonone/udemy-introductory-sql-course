-- step 1
select *
    from band
where name = 'Icarus';

-- step 2
select *
    from band
where name = 'Icarus'
and   year is null;
