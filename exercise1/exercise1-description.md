# Exercise 1 — Filtering Columns and Rows

## Task Description

This exercise consists of two sequential steps focused on basic SQL filtering and data retrieval.

---

## Step 1 — Filter Bands

Select rows from the `band` table where the `name` column contains the value **'Led Zeppelin'**.

### Requirements:
- Filter rows by band name.
- Return **only** the following columns:
    - `band_id`
    - `name`
    - `year`
- Pay special attention to the value of `band_id`, as it will be used in the next step.

---

## Step 2 — Find Related Albums

Using the `band_id` obtained in **Step 1**, select all corresponding rows from the `album` table.

### Requirements:
- Filter albums by the given `band_id`.
- Determine how many rows the query returns.

---

## Tables Used

- `band`
- `album`

---

## Goal

Practice:
- Filtering rows with `WHERE`
- Selecting specific columns
- Using query results as input for subsequent queries
- Understanding relationships between tables via foreign keys
