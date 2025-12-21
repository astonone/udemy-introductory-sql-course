-- step 1
select *
    from band
where name like '%magic%'
order by name;

-- step 2
select *
    from band
where lower(name) like '%magic%'
order by name;

-- step 3
select
    (select count(*) from person) as n_total,
    count(*) as n_az_first_letter
    from person
where position(substr(name, 1, 1) in 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') > 0;

-- step 4
select
    substr(name, 1, 1) as first_letter,
    count(*)
    from person
where position(substr(name, 1, 1) in 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') > 0
group by first_letter -- group by 1 is equivalent to group by first_letter
order by count(*) desc; -- group by 2 desc is equivalent to order by count(*) desc

-- step 5
select
    substr(name, 1, position(' ' in name) - 1) as person_name,
    count(*)
    from person
where position(substr(name, 1, 1) in 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') > 0
and name like '% %'
group by 1
order by 2 desc;

