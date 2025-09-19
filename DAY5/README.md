# 📘 SQL Day 5: Data Query Language (DQL)

Today's lesson is all about **DQL (Data Query Language)**, which is used to retrieve data from your database. The primary command for DQL is `SELECT`. We'll explore how to filter, sort, and format the data you retrieve.

---

## 1. 📜 The `SELECT` Statement

The `SELECT` statement is used to query the database and retrieve data that matches criteria that you specify.

#### Selecting All Columns
Use the asterisk (`*`) to select all columns from a table.
```sql
SELECT * FROM employees;
```

#### Selecting Specific Columns
Specify the column names to retrieve only the data you need.
```sql
SELECT first_name, last_name, hire_date FROM employees;
```

#### Selecting Unique Values
The `DISTINCT` keyword returns only unique (different) values.
```sql
SELECT DISTINCT(department) FROM employees;
```

---

## 2. 🔍 Filtering with `WHERE`

The `WHERE` clause is used to filter records and extract only those that fulfill a specified condition.

| Operator | Description | Example |
| :--- | :--- | :--- |
| `=` | Equal to | `WHERE first_name = "sarthak"` |
| `AND` | Displays a record if all conditions are TRUE | `WHERE department = "python" AND first_name = "jaydip"` |
| `OR` | Displays a record if any of the conditions are TRUE | `WHERE department = "python" OR first_name = "jaydip"` |
| `IN` | Allows you to specify multiple values in a `WHERE` clause | `WHERE department IN ("java", "web dev")` |
| `BETWEEN` | Selects values within a given range (inclusive) | `WHERE hire_date BETWEEN "2022-01-02" AND "2024-01-01"` |
| `IS NOT NULL`| Checks for non-null values | `WHERE department IS NOT NULL` |

---

## 3. 🧩 Pattern Matching with `LIKE`

The `LIKE` operator is used in a `WHERE` clause to search for a specified pattern in a column.

- `%` (percent sign) represents zero, one, or multiple characters.
- `_` (underscore) represents a single character.

#### Examples:
```sql
-- Find any values that start with "s"
SELECT first_name FROM employees WHERE first_name LIKE "s%";

-- Find any values that have "a" as the second character
SELECT first_name FROM employees WHERE first_name LIKE "_a%";

-- Find any values that have "e" in any position
SELECT last_name FROM employees WHERE last_name LIKE "%e%";
```

---

## 4. 🔢 Sorting and Limiting Results

#### `ORDER BY`
The `ORDER BY` keyword is used to sort the result-set in ascending or descending order.
```sql
-- Sort by first_name in ascending order (default)
SELECT * FROM employees ORDER BY first_name ASC;

-- Sort by first_name in descending order
SELECT * FROM employees ORDER BY first_name DESC;
```

#### `LIMIT`
The `LIMIT` clause is used to specify the number of records to return.
```sql
-- Get the top 3 employees when sorted by name descending
SELECT * FROM employees ORDER BY first_name DESC LIMIT 3;
```

---

## 5. 🎭 Conditional Logic with `CASE`

The `CASE` statement goes through conditions and returns a value when the first condition is met (like an if-then-else statement).

#### Syntax
```sql
SELECT *, 
   CASE
     WHEN employee_id < 2 THEN "early members"
     WHEN employee_id < 4 THEN "mid members"
     ELSE "late joiner"
   END AS join_status 
FROM employees;
```
This will add a new temporary column `join_status` to the result set with the calculated value.

---

### ✅ Summary of DQL Concepts

| Keyword | Description |
| :--- | :--- |
| `SELECT` | Retrieves data from a database. |
| `DISTINCT` | Returns only unique values. |
| `WHERE` | Filters records based on a condition. |
| `LIKE` | Searches for a pattern in a column. |
| `ORDER BY` | Sorts the result set. |
| `LIMIT` | Restricts the number of rows returned. |
| `CASE` | Applies conditional logic to results. |
