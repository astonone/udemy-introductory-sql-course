# Exercise 3 — Working with NULL Values

## Task Description

This exercise focuses on working with `NULL` values in SQL and understanding how to properly filter them.

---

## Step 1 — Select Bands by Name

Select all rows from the `band` table where the band name is **'Icarus'**.

This dataset demonstrates multiple musical groups from different years and countries that share the same name.

### Requirements:
- Filter bands by `name = 'Icarus'`.
- Return all matching rows.

---

## Step 2 — Filter NULL Values

From the previously selected bands, return **only** those rows where the `year` column contains a `NULL` value.

### Requirements:
- Filter by band name **'Icarus'**.
- Select only rows where `year` is `NULL`.
- Use proper SQL syntax for handling `NULL` values.

---

## Tables Used

- `band`

---

## Goal

Practice:
- Understanding `NULL` in SQL
- Using `IS NULL` in `WHERE` clauses
- Filtering datasets with missing values
- Avoiding common mistakes when comparing `NULL`
