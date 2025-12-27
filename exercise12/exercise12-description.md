# Exercise 12 — Window Functions (Part 1)

## Task Description

This exercise introduces **Window Functions** and advanced aggregation techniques. We will work with a new table `album_sales` containing synthetic sales data.

---

## Step 1 — Data Preparation

First, we need to create and populate the `album_sales` table with synthetic data.
Run the following SQL script to set up the environment:

```sql
CREATE TABLE album_sales
(
    album_id    INTEGER,
    name        VARCHAR,
    band_id     INTEGER,
    year        SMALLINT,
    total_sales NUMERIC
);

INSERT INTO album_sales
SELECT album_id,
       name,
       band_id,
       year,
       100000 / ((2015 - coalesce(year, 1900)) *
                 (2015 - coalesce(year, 1900))) *
       character_length(name) as total_sales
FROM album
WHERE year < 2015;
```

---

## Step 2 — Aggregation by Year

Using the `album_sales` table, calculate the total sales (`total_sales`) for each calendar year.

### Requirements:
- Group the data by `year`.
- Calculate the sum of `total_sales` for each year.
- Sort the result by total sales in **descending order** (years with the highest sales first).
- *Note:* Window functions are not needed for this step yet.

---

## Step 3 — Percentage of Total Sales

Based on the query from Step 2, calculate the percentage contribution of each year's sales to the **grand total** of sales across all years.

### Requirements:
- For each year, display:
    - The year.
    - The total sales for that year.
    - The percentage of this amount relative to the sum of sales for *all* years.
- Use a **subquery** (or a window function if you prefer, though the task suggests a subquery approach first) to calculate the grand total.
- Sort by total sales descending.
- Verify that the year 2014 accounts for approximately **53%** of all sales.

---

## Tables Used

- `album_sales` (created in Step 1)

---

## Goal

Practice:
- Creating and populating tables with calculated data
- Grouping and aggregating data (`GROUP BY`, `SUM`)
- Calculating shares/percentages using subqueries or window functions
