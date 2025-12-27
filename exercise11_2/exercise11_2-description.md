# Exercise 12 — CTE (Common Table Expressions) and Recursion

## Task Description

This exercise focuses on using **CTE (WITH clause)** to improve query readability and **Recursive CTE** to handle hierarchical data.

---

## Step 1 — Recursive Hierarchy Traversal

In Exercise 7, we used multiple `LEFT JOIN`s to traverse the hierarchy of musical instruments. This approach is rigid and hard to maintain if the hierarchy depth changes.
Now, let's solve the same problem elegantly using **Recursive CTE**.

### Requirements:
- Use `WITH RECURSIVE` to traverse the `music_instrument` table starting from the root instrument (ID = 1, 'Wind instruments').
- The result should include:
    - `parent_id`: ID of the parent instrument (can be NULL for the root)
    - `parent_name`: Name of the parent instrument (can be NULL for the root)
    - `id`: Instrument ID
    - `name`: Instrument name
    - `depth`: The level of depth in the hierarchy (0 for root, 1 for its children, etc.)
    - `path`: A string showing the full path from the root, separated by `->` (e.g., `Wind instruments -> Woodwind`).
- Sort the result by `depth`, `parent_name`, and `name`.

---

## Step 2 — Refactoring with CTE

In Exercise 9 (Step 5), we wrote a complex query to find the most popular first names among artists. The query involved string extraction, filtering, and grouping, making it a bit hard to read.
Let's refactor it using a **CTE**.

### Requirements:
- Create a CTE named `artist_first_names` that:
    - Selects the first name from the `person` table (substring before the first space).
    - Filters only names starting with an uppercase letter and containing a space.
- In the main query:
    - Select the `first_name` and count the occurrences.
    - Group by `first_name`.
    - Order by count descending.
- The logic remains the same as in Exercise 9, but the structure should be cleaner.

---

## Step 3 — Analytics with CTE: Prolific Bands

Let's find musical bands that are more productive than average. We want to find bands that have released **more albums than the average number of albums per band**.

### Requirements:
- Create a CTE named `band_album_counts` that calculates the total number of albums for each band (using the `album` and `band` tables).
- In the main query:
    - Select `band_name` and `album_count`.
    - Filter only those bands where `album_count` is **greater than** the average album count across all bands (you can calculate this average using a subquery on the CTE).
- Sort the result by `album_count` descending, then by `band_name`.

---

## Tables Used

- `music_instrument`
- `person`
- `band`
- `album`

---

## Goal

Practice:
- Writing Recursive CTEs (`WITH RECURSIVE`)
- Traversing hierarchical data of unknown depth
- Refactoring complex queries using CTEs (`WITH`)
- Using CTEs for multi-step aggregation (count per group -> filter by average of counts)
