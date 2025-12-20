# SQL JOIN Cheat Sheet

## INNER JOIN (JOIN)

- Returns **only matching rows**
- Rows without a match are **discarded from both tables**
- `JOIN` is equivalent to `INNER JOIN`

Used when only real intersections are needed.

---

## LEFT JOIN (LEFT OUTER JOIN)

- Returns **all rows from the left table**
- Returns **only matching rows from the right table**
- If there is no match, right table columns contain `NULL`

The left table is the **main table**.

---

## RIGHT JOIN (RIGHT OUTER JOIN)

- Returns **all rows from the right table**
- Returns **only matching rows from the left table**
- If there is no match, left table columns contain `NULL`

The right table is the **main table**.  
Logically equivalent to `LEFT JOIN` with swapped tables.

---

## FULL OUTER JOIN

- Returns **all rows from both tables**
- Matching rows are merged
- Non-matching rows are preserved with `NULL` values on the opposite side

Used to analyze differences between two datasets.

---

## CROSS JOIN

- Produces a **Cartesian product**
- Every row from the first table is combined with every row from the second table
- No join condition is applied
- Number of rows = A × B

Used rarely and intentionally.

---

## JOIN vs WHERE vs ON

- `ON` defines **join conditions**
- `WHERE` filters rows **after the join**
- For OUTER JOINs, filtering conditions usually belong in `ON`, not in `WHERE`

---

## Key Rule

> **LEFT / RIGHT / FULL define  
which table’s rows are preserved when no match exists.**
