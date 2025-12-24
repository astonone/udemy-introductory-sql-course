# Exercise 11 — Conditional Operator CASE

## Task Description

This exercise focuses on using the **CASE** operator to implement conditional logic within SQL queries.

---

## Step 1 — Flagging Self-Titled Albums

Perform an **INNER JOIN** between the `album` and `band` tables.

### Requirements:
- Select the following columns:
    - `album_id` and `name` from the `album` table.
    - `band_id` and `name` from the `band` table.
- Add a calculated column using `CASE` that returns:
    - **1** if the album name is exactly the same as the band name (the band that released it).
    - **0** otherwise.

---

## Step 2 — Counting Self-Titled Albums

Based on the logic from Step 1, calculate the total number of albums where the album name matches the band name.

### Requirements:
- You can use the query from Step 1 as a subquery or simply use the `SUM()` function on the calculated column (or `COUNT` with a filter).
- The result should be a single number.

---

## Step 3 — Albums Matching Any Band Name

Write a new query that selects albums from the `album` table whose names match the name of **any** musical band in the `band` table (not necessarily the band that released the album).

### Requirements:
- Count the total number of such albums.
- Compare this result with the count obtained in Step 2.

---

## Tables Used

- `album`
- `band`

---

## Goal

Practice:
- Using `INNER JOIN`
- Implementing conditional logic with `CASE`
- Comparing values across joined tables
- Aggregating conditional results
