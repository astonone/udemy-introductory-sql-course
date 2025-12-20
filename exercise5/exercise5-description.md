# Exercise 5 — Inner Join

## Task Description

This exercise introduces the concept of **INNER JOIN** and demonstrates how to combine data from multiple tables based on a related column.

---

## Step 1 — Select a Specific Band

Select all columns from the `band` table where the band name is **'Led Zeppelin'**.

### Requirements:
- Filter rows using `name = 'Led Zeppelin'`
- Return all columns from the `band` table

---

## Step 2 — Join Bands with Albums

Modify the previous query by adding an **INNER JOIN** with the `album` table using the `band_id` column.

### Requirements:
- Join `band` and `album` tables on `band_id`
- Return **all columns from both tables**
- Ensure that the result includes data from:
    - the `band` table
    - the `album` table
- Understand that the result set will contain multiple rows — one for each album of the band

---

## Tables Used

- `band`
- `album`

---

## Goal

Practice:
- Writing `INNER JOIN` queries
- Joining tables using foreign keys
- Selecting columns from multiple tables
- Understanding how joins affect the result set
