# Exercise 9 — Functions and Operators

## Task Description

This exercise focuses on using SQL **functions and operators** for string processing, filtering, and aggregation.

The tasks involve searching substrings, handling case sensitivity, extracting parts of strings, and analyzing name distributions.

---

## Step 1 — Case-Sensitive Search

Find all musical bands whose names contain the word **`magic`** written entirely in lowercase.

### Requirements:
- The substring `magic` must appear anywhere in the band name
- Match must be **case-sensitive**
- Sort the result by band name

---

## Step 2 — Case-Insensitive Search

Find all musical bands whose names contain the word **`magic`**, regardless of letter case.

Examples of valid matches:
- `Automagic`
- `Blue Magic`
- `MAGIC`
- `Magic`

### Requirements:
- The search must be **case-insensitive**
- Sort the result by band name
- The query should return **77 bands**

---

## Step 3 — Names Starting with an Uppercase Letter

Select musical artists from the `person` table whose names start with an **uppercase English letter**.

### Requirements:
- Use a string function to inspect the first character
- Count how many such artists exist
- Compare this number with the total number of rows in the `person` table

---

## Step 4 — Count Artists by First Letter

For each uppercase English letter, count how many artists have names starting with that letter.

### Requirements:
- Group artists by the first letter of their name
- Count the number of artists per letter
- Sort the result so that letters with the highest counts appear first

---

## Step 5 — Most Popular First Names

Select musical artists that meet **both** conditions:
- The name starts with an uppercase English letter
- The name contains a space character

For each such artist:
- Extract the substring from the start of the name up to the first space  
  (e.g. `Bob Ashley` → `Bob`)

### Requirements:
- Treat the extracted substring as the artist’s first name
- Count how many artists share the same first name
- Sort the result by popularity (descending)
- Optionally analyze the rarest names

---

## Tables Used

- `band`
- `person`

---

## Goal

Practice:
- String search and pattern matching
- Case-sensitive vs case-insensitive comparisons
- String extraction functions
- Grouping and aggregation
- Analyzing textual data distributions
