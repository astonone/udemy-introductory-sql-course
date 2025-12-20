# Exercise 7 — Self Join

## Task Description

This exercise introduces the concept of a **self join**, where a table is joined with itself to represent hierarchical relationships.

The `music_instrument` table contains instruments organized in a parent–child hierarchy.  
The goal is to explore this hierarchy step by step using self joins.

---

## Step 1 — Select a Root Instrument

Select the instrument with `id = 1` from the `music_instrument` table.

### Requirements:
- Filter by `id = 1`
- Display only the following columns:
    - `id`
    - `name`

---

## Step 2 — Find Child Instruments

Extend the query by adding an **outer self join** to find all **child instruments** of the selected instrument.

### Requirements:
- Join the `music_instrument` table with itself
- Use table aliases to distinguish parent and child rows
- Rename child columns using aliases:
    - `child_id`
    - `child_name`

---

## Step 3 — Find Grandchild Instruments

For each child instrument, find their **child instruments** (grandchildren of the root instrument).

### Requirements:
- Add another outer self join to the same table
- Use column aliases for the new level:
    - `grandchild_id`
    - `grandchild_name`
- Sort the result:
    1. by `name`
    2. by `child_name`
    3. by `grandchild_name`

This ordering helps visualize how instruments are grouped (e.g. brass, organ, woodwind).

---

## Step 4 (Optional) — Deeper Hierarchy Levels

Continue traversing the hierarchy by adding more outer self joins.

### Requirements:
- For each additional level, select:
    - `level_N_id`
    - `level_N_name`
- Repeat until all values at a certain level are `NULL`

This indicates that the hierarchy has ended and no further child instruments exist.

---

## Table Used

- `music_instrument`

---

## Goal

Practice:
- Self joins
- Working with hierarchical data
- Using table and column aliases
- Traversing multi-level parent–child relationships
- Sorting hierarchical query results
