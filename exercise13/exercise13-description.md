# Exercise 13 — ABC Analysis (Window Functions Part 2)

## Task Description

In this exercise, we will implement **ABC Analysis** (based on the Pareto Principle) to categorize albums by their sales contribution.
The goal is to classify albums into three categories:
- **A**: Top sellers contributing to the first **80%** of total sales.
- **B**: Medium sellers contributing to the next **15%** (from 80% to 95%).
- **C**: Low sellers contributing to the remaining **5%** (from 95% to 100%).

We will analyze albums from three bands: **Metallica**, **Queen**, and **Roxette**.

---

## Step 1 — Data Preparation

First, create and populate a temporary table `album_percentages` that contains sales data and the percentage of total sales for each album of the selected bands.

Run the following SQL script:

```sql
CREATE TABLE album_percentages
(
    album_name VARCHAR,
    sales      NUMERIC,
    percentage NUMERIC
);

INSERT INTO album_percentages
SELECT album_name,
       sales,
       sales * 100.00 / sum(sales) OVER () as percentage
FROM (
         SELECT a.name as album_name, sum(a.total_sales) as sales
         FROM album_sales as a
         WHERE band_id IN (93, 192, 1811)
         GROUP BY 1
     ) as t;
```

> **Note:** In a real production environment, creating intermediate tables for analysis should be done with caution as data might become stale. For this exercise, it simplifies the process.

---

## Step 2 — Cumulative Sum

Using the `album_percentages` table, calculate the **cumulative sum** of the `percentage` column.

### Requirements:
- Use a window function to calculate the running total of percentages.
- The calculation must be ordered by `sales` in **descending order** (highest sales first).
- Name the new column `cumulative_percentage`.
- Sort the final result by `sales` descending.

---

## Step 3 — Assigning Categories (A, B, C)

Based on the cumulative percentage calculated in Step 2, assign a category to each album.

### Requirements:
- Use a `CASE` statement to determine the category:
    - **'A'**: if `cumulative_percentage` is between 0 and 80 (inclusive).
    - **'B'**: if `cumulative_percentage` is greater than 80 and less than or equal to 95.
    - **'C'**: if `cumulative_percentage` is greater than 95.
- *Note:* Since the cumulative sum represents the state *after* adding the current row, the boundary logic is simple: as soon as the running total crosses 80%, the *next* items might fall into B (depending on strict inequality). For this exercise, use the logic: `<= 80` is A, `<= 95` is B, else C.
- Use a subquery (or CTE) to handle the window function result before applying the `CASE`.
- Sort the result by sales descending.

---

## Tables Used

- `album_percentages` (created in Step 1)

---

## Goal

Practice:
- Calculating cumulative sums (Running Total) using Window Functions
- Implementing business logic (ABC Analysis) based on aggregated data
- Using `CASE` with calculated window results
