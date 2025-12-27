-- step 1
CREATE TABLE album_percentages
(
    album_name VARCHAR,
    sales      NUMERIC,
    percentage NUMERIC
);

INSERT INTO album_percentages
SELECT album_name,
       sales,
       sales * 100.00 / sum(sales) OVER () as percentage
FROM (SELECT a.name as album_name, sum(a.total_sales) as sales
      FROM album_sales as a
      WHERE band_id IN (93, 192, 1811)
      GROUP BY 1) as t;

-- step 2
select *,
       sum(percentage) over (
           order by sales desc
           rows between unbounded preceding
               and current row) as cumulative_percentage
from album_percentages
order by sales desc;

-- step 3
with album_percentage_with_cumulative_percentage as (select *,
                                                            sum(percentage) over (
                                                                order by sales desc
                                                                rows between unbounded preceding
                                                                    and current row) as cumulative_percentage
                                                     from album_percentages
                                                     order by sales desc)
select *,
       case
           when apwcp.cumulative_percentage >= 0 and apwcp.cumulative_percentage <= 80 then 'A'
           when apwcp.cumulative_percentage > 80 and apwcp.cumulative_percentage <= 95 then 'B'
           when apwcp.cumulative_percentage > 95 and apwcp.cumulative_percentage <= 100 then 'C'
           else 'UNKNOWN'
           end
from album_percentage_with_cumulative_percentage as apwcp;
