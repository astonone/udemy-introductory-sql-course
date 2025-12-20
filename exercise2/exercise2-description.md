# Exercise 2 — Subqueries

## Task Description

This exercise builds on **Exercise 1** and introduces the concept of SQL subqueries.

Previously, two separate queries were written:
1. A query that selects rows from the `band` table where the `name` column equals **'Led Zeppelin'**.
2. A query that selects albums from the `album` table using the `band_id` obtained in the first query.

In this exercise, these two queries must be combined into a **single SQL statement**.

---

## Step 1 — Combine Queries Using a Subquery

Select rows from the `album` table where the `band_id` matches the `band_id` values from the `band` table for bands with the name **'Led Zeppelin'**.

### Requirements:
- Use a subquery to retrieve the relevant `band_id` values.
- Filter albums based on the result of the subquery.
- Return all matching albums.

---

## Tables Used

- `band`
- `album`

---

## Goal

Practice:
- Writing subqueries
- Nesting queries inside `WHERE` clauses
- Replacing multi-step logic with a single SQL query
- Working with relationships between tables without explicit joins
