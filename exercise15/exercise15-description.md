# Exercise 15 — Ranking and Numbering

## Task Description

This exercise focuses on **ranking functions** in SQL, specifically assigning sequential numbers to rows within groups.
We will work with the `album` table to find the first few albums released by specific bands.

---

## Step 1 — Numbering Albums per Band

Write a query to select all albums for the bands **Metallica** (`band_id = 93`) and **Queen** (`band_id = 192`).

### Requirements:
- Select columns: `band_id`, `name` (album name), `year`.
- Sort the results by `band_id`, and then by `year` within each band.
- Add a calculated column `album_num` that assigns a sequential number to each album based on its release year.
    - The numbering should restart for each band (partition by band).
    - If two albums were released in the same year, assign them distinct numbers (the order between them doesn't matter).
- Use the `ROW_NUMBER()` window function.

---

## Step 2 — Top 3 Albums

Based on the query from Step 1, filter the results to show only the **first three albums** for each of the two bands.

### Requirements:
- Use the `album_num` column calculated in the previous step.
- Filter rows where `album_num` is less than or equal to 3.
- Since window functions cannot be used directly in the `WHERE` clause, you will need to use a **subquery** or a **CTE**.
- The result should contain exactly 6 rows (3 for Metallica, 3 for Queen).

---

## Step 3 — Ranking Years by Productivity (ROW_NUMBER vs RANK vs DENSE_RANK)

Now let's compare different ranking functions. We want to find the years with the most album releases across all bands.

### Requirements:
- First, calculate the count of albums released in each year (`count(*)`) and group by `year`. Filter out years where `year` is NULL.
- Add three calculated columns to rank the years based on the album count (descending):
    1.  `row_num`: using `ROW_NUMBER()`
    2.  `rank_num`: using `RANK()`
    3.  `dense_rank_num`: using `DENSE_RANK()`
- Observe the differences between these functions when multiple years have the same album count (ties).
- Finally, filter the result to show only the **top 3 ranks** according to `DENSE_RANK()`.
    - *Note:* This might return more than 3 rows if there are ties.

---

## Tables Used

- `album`

---

## Goal

Practice:
- Using `ROW_NUMBER()` to assign unique IDs within groups (`PARTITION BY`)
- Filtering by window function results (Top-N per group problem)
- Understanding the difference between `ROW_NUMBER`, `RANK`, and `DENSE_RANK`
