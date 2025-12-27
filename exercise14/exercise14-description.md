# Exercise 14 — Sunny Days (Gaps and Islands)

## Task Description

This is a challenging exercise that solves a classic SQL problem known as **"Gaps and Islands"**.
We want to find the **maximum number of consecutive sunny days**.

Imagine we have weather records for a city. We need to identify periods of constant weather and count how long they lasted.

---

## Step 1 — Data Preparation

Create and populate the `weather` table.

```sql
CREATE TABLE weather
(
    the_date     DATE,
    weather_type VARCHAR
);

INSERT INTO weather
VALUES (date '2023-01-01', 'Sunny'),
       (date '2023-01-02', 'Snow'),
       (date '2023-01-03', 'Sunny'),
       (date '2023-01-04', 'Sunny'),
       (date '2023-01-05', 'Sunny'),
       (date '2023-01-06', 'Cloudy'),
       (date '2023-01-07', 'Sunny'),
       (date '2023-01-08', 'Sunny'),
       (date '2023-01-09', 'Snow'),
       (date '2023-01-10', 'Snow'),
       (date '2023-01-11', 'Snow'),
       (date '2023-01-12', 'Snow');
```
*(Note: The values are translated to English: 'Солнечно' -> 'Sunny', 'Снег' -> 'Snow', 'Облачно' -> 'Cloudy')*

---

## Step 2 — Previous Day's Weather

For each day, select the current weather and the weather of the **previous day**.

### Requirements:
- Use a window function (`LAG`) to access the previous row's `weather_type`.
- Order by `the_date`.

---

## Step 3 — Detect Changes (The "Flag")

Add a calculated column `difference` (or `is_change`) that acts as a flag:
- **1**: if the weather changed compared to the previous day (or if it's the first day).
- **0**: if the weather is the same as the previous day.

### Requirements:
- Use a `CASE` expression based on the result of Step 2.
- Handle the first row (where previous weather is NULL) as 0 or 1 (logic suggests 0 for the very first start, or 1 to start a group, but the task says: "if previous is unknown, then 0").

---

## Step 4 — Assign Group IDs (Cumulative Sum)

Calculate the **cumulative sum** of the `difference` column.
Name this new column `cumulative` (or `group_id`).

### Requirements:
- Use a window function to calculate the running total of the `difference` flags.
- Order by `the_date`.
- **Logic:** This running total effectively assigns a unique ID to each consecutive block of identical weather. Every time the weather changes, the flag is 1, and the sum increases, starting a new group ID.

---

## Step 5 — Count Days per Group

Group the data by the generated `cumulative` ID (and `weather_type`).
Count the number of days in each group.

### Requirements:
- Use a subquery (or CTE) to wrap the previous step.
- `GROUP BY` the group ID.
- Select the `weather_type` (it's constant within the group) and `count(*)` as `number_of_days`.
- Sort by the group ID.

---

## Step 6 — Max Consecutive Sunny Days

Finally, filter only the groups where the weather was **'Sunny'**.
Find the **maximum** value of `number_of_days`.

### Requirements:
- The result should be a single number (e.g., 3).

---

## Tables Used

- `weather` (created in Step 1)

---

## Goal

Practice:
- Solving "Gaps and Islands" problems
- Using `LAG()` to compare rows
- Using Running Totals to create group identifiers
- Multi-level aggregation (Window functions -> Group By -> Max)
