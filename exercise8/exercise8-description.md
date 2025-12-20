# Exercise 8 — Set Operators (UNION, INTERSECT, EXCEPT)

## Task Description

This exercise introduces SQL **set operators** and demonstrates how to work with result sets produced by multiple queries.

The goal is to find musical bands based on the names of albums they have released and analyze intersections between different result sets.

---

## Step 1 — Find Bands with Album "Now"

Select the IDs of all musical bands that have released an album named **"Now"**.

### Requirements:
- Query the `album` table
- Filter by album name
- Select **only** the `band_id` column

---

## Step 2 — Find Bands with Album "The Collection"

Select the IDs of all musical bands that have released an album named **"The Collection"**.

### Requirements:
- Query the `album` table
- Filter by album name
- Select **only** the `band_id` column

---

## Step 3 — Find Common Bands (INTERSECT)

Find band IDs that appear in **both** result sets from Step 1 and Step 2.

### Requirements:
- Use the `INTERSECT` operator
- Each subquery must return only the `band_id` column
- The result represents bands that released **both** albums:
  - *Now*
  - *The Collection*

---

## Step 4 — Retrieve Band Names

Using the band IDs obtained in Step 3, find the corresponding band names.

### Requirements:
- Query the `band` table
- Use `IN` with a subquery
- Select all matching bands

---

## Tables Used

- `album`
- `band`

---

## Goal

Practice:
- Set operators: `INTERSECT`
- Working with multiple result sets
- Using subqueries with `IN`
- Filtering and combining query results
