# Exercise 6 — Outer Join

## Task Description

This exercise introduces **OUTER JOIN** and demonstrates how to work with missing data when combining tables.

The goal is to determine how many albums **Led Zeppelin** released each year, including years when **no albums were released**.  
For years without albums, the result must explicitly show a count of **0**.

To achieve this, an additional table `calendar_year` is used to produce a continuous list of years.

---

## Step 1 — Select Albums for a Specific Band

Select all albums released by **Led Zeppelin** using `band_id = 388`.

### Requirements:
- Select rows from the `album` table
- Filter by `band_id = 388`
- Sort the result by `year` in ascending order
- Note that in some years (e.g. 1969), multiple albums were released

---

## Step 2 — Count Albums per Year

Modify the previous query to count how many albums were released **per year**.

### Requirements:
- Group results by `year`
- Count the number of albums in each year
- Sort the result by `year`

### Note:
Only years with at least one album will appear in the result at this stage.

---

## Step 3 — Create a Continuous List of Years

Select all years from the `calendar_year` table in the range **from 1969 to 1982**.

### Requirements:
- Filter by year range
- Sort the result by `year`

This query produces a continuous list of years, including years with no album releases.

---

## Step 4 — Use an Outer Join

Perform an **OUTER JOIN** between `calendar_year` and `album` using the `year` column.

### Requirements:
- Use `LEFT OUTER JOIN` or `RIGHT OUTER JOIN` so that `calendar_year` is the main table
- Select only years from 1969 to 1982 from `calendar_year`
- Select albums for `band_id = 388` from `album`
- Apply the `band_id = 388` condition **inside the JOIN condition**, not in the `WHERE` clause
- Sort the result by `calendar_year.year`

### Result:
All years from 1969 to 1982 must be present, even if no albums exist for a given year.

---

## Step 5 — Count Albums Including Zero Values

For each year, calculate how many albums were released by **Led Zeppelin**.

### Requirements:
- Group by `calendar_year.year`
- Use `COUNT(album.album_id)` instead of `COUNT(*)`
- Sort the result by `calendar_year.year`

### Note:
Using `COUNT(album_id)` ensures that years without albums correctly return a count of **0**.

---

## Tables Used

- `album`
- `band`
- `calendar_year`

---

## Goal

Practice:
- `LEFT OUTER JOIN` / `RIGHT OUTER JOIN`
- Preserving rows from the main table
- Correct placement of join conditions
- Aggregation with missing data
- Using `COUNT(column)` to handle `NULL` values
