-- step 1
select *
    from album
where band_id = 388
order by year;

-- step 2
select year, count(year)
    from album
where band_id = 388
group by year
order by year;

-- step 3
select *
    from calendar_year
where year >= 1969 and year <= 1982;

-- step 4
select *
    from calendar_year as ca
    left outer join album as a on ca.year = a.year and a.band_id = 388 -- LEFT JOIN is equivalent to LEFT OUTER JOIN
where ca.year >= 1969 and ca.year <= 1982
order by ca.year;

-- step 5
select ca.year, count(a.album_id)
    from calendar_year as ca
    left outer join album as a on ca.year = a.year and a.band_id = 388
where ca.year >= 1969 and ca.year <= 1982
group by ca.year
order by ca.year;

