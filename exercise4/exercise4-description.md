# Exercise 4 — Aggregation

## Task Description

This exercise focuses on SQL aggregation and grouping.  
It continues the exploration of cases where multiple records share the same value.

Previously, we discovered that there are several musical bands with the same name (for example, *Icarus*). In this exercise, we will find other similar cases and also analyze album counts.

---

## Step 1 — Count Bands with the Same Name

Select rows from the `band` table, group the data by band name, and count how many rows exist for each band name.

### Requirements:
- Group rows by `name`
- Calculate the number of bands for each name
- Note that without an explicit `ORDER BY`, the result order is not guaranteed

---

## Step 2 — Filter Repeated Names

Extend the previous query to return **only** those band names that appear **two or more times**.

### Requirements:
- Use aggregation filtering
- Return only names with a count greater than or equal to 2

---

## Step 3 — Sort by Count

Add sorting to the query so that the results are ordered by the count of bands **in descending order**.

### Requirements:
- Sort by the aggregated count column
- Highest values should appear at the top of the result set

---

## Step 4 — Find Bands with the Most Albums

Apply a similar aggregation approach to find bands with the highest number of albums.

### Part 1:
- Select rows from the `album` table
- Group data by `band_id`
- Count the number of albums for each band
- Sort the results by album count in descending order

### Part 2:
- Take the `band_id` with the highest album count
- Find the corresponding band name in the `band` table using a separate query

### Part 3 (Advanced):
- Solve the same task using **a single SQL query**
- Use subqueries to combine data from `band` and `album`

---

## Tables Used

- `band`
- `album`

---

## Goal

Practice:
- Aggregate functions (`COUNT`)
- `GROUP BY`
- `HAVING`
- Sorting aggregated results with `ORDER BY`
- Subqueries with aggregation
