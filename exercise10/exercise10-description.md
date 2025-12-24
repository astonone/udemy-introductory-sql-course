# Exercise 10 — Inserting, Updating, and Deleting Data

## Task Description

This exercise focuses on modifying data in the database: **INSERT**, **UPDATE**, and **DELETE**.

Since we will be changing data, it is crucial to create a backup first.

---

## Step 1 — Create a Backup Table

Before making any changes, create a backup of the `band_extended` table.

### Requirements:
- Create a new table named `band_extended_backup` based on `band_extended`.
- Verify that the backup table was created successfully.
- The backup table should contain **82,928 rows**.

> **Note:** If you make a mistake in later steps, you can restore the data using:
> ```sql
> DELETE FROM band_extended;
> INSERT INTO band_extended SELECT * FROM band_extended_backup;
> ```
> (Do not run these restore commands now, only if needed).

---

## Step 2 — Verify Data Consistency

The `band_extended` table has a column `n_albums` which stores the total number of albums for each band.
We want to verify that this number matches the actual count of rows in the `album` table.

### Requirements:
- Calculate the **sum** of `n_albums` in the `band_extended` table.
- Calculate the **total count** of rows in the `album` table.
- Ensure that these two numbers are **equal**.

---

## Step 3 — Update Data (UPDATE)

Modify the data for the band **Metallica** in the `band_extended` table.

### Requirements:
- Find the row for **Metallica**.
- Change the value in the `n_albums` column from `11` to `NULL`.
- Ensure that **only one row** is updated.
- Verify the update by selecting the row for Metallica.
- Check the total sum of `n_albums` again. It should now be **11 less** than the sum found in Step 2.

---

## Step 4 — Insert Data (INSERT)

Add a new band to the `band_extended` table.

### Requirements:
- Insert a new row with the following values:
    - `band_id`: `-100`
    - `name`: `'My Test Music Group'`
    - `year`: `2000`
    - `comment`: `'My Comment'`
    - `n_albums`: `25`
    - `n_songs`: `54`
- Verify that the new row exists using a `SELECT` query.
- Check the total row count in the table. It should now be **82,929** (one more than before).

---

## Step 5 — Delete Data (DELETE)

Remove the band **Queen** from the `band_extended` table.

### Requirements:
- Delete the row where the band name is **Queen**.
- Verify that the row is gone using a `SELECT` query (it should return 0 rows).
- Check the total row count in the table. It should now be **82,928** (back to the original count).

---

## Tables Used

- `band_extended`
- `band_extended_backup` (created in Step 1)
- `album`

---

## Goal

Practice:
- Creating tables from existing data (`CREATE TABLE AS`)
- Updating records (`UPDATE`)
- Inserting new records (`INSERT`)
- Deleting records (`DELETE`)
- Verifying data changes
