# 📘 SQL Day 8: Aggregate Functions

This guide covers **Aggregate Functions** in SQL. These functions perform a calculation on a set of rows and return a single summary value. They are essential for data analysis, reporting, and gaining insights from your data.

---

## 1. 📊 Core Aggregate Functions

These functions operate on all rows specified by the `WHERE` clause (or the entire table if no `WHERE` clause is present).

| Function | Description | Example |
| :--- | :--- | :--- |
| `COUNT()` | Counts the number of rows. `COUNT(*)` counts all rows, while `COUNT(column)` counts non-NULL values in that column. | `SELECT COUNT(*) FROM employee;` |
| `SUM()` | Calculates the sum of a numeric column. | `SELECT SUM(salary) FROM employee;` |
| `AVG()` | Calculates the average value of a numeric column. | `SELECT AVG(salary) FROM employee;` |
| `MIN()` | Returns the minimum value in a column. | `SELECT MIN(salary) FROM employee;` |
| `MAX()` | Returns the maximum value in a column. | `SELECT MAX(salary) FROM employee;` |

---

## 2. 🧩 Grouping Data with `GROUP BY`

The `GROUP BY` clause is one of the most powerful tools in SQL. It's used with aggregate functions to group rows that have the same values in specified columns into summary rows.

Instead of calculating one aggregate for the whole table, `GROUP BY` calculates an aggregate for **each group**.

**Common Use Cases:**
-   Find the number of employees in each department.
-   Calculate the average salary for each department.
-   Find the most recent order for each customer.

**Examples:**
```sql
-- Count the number of employees in each department
SELECT dept_name, COUNT(*) AS num_emp 
FROM employee 
GROUP BY dept_name;

-- Calculate the average salary for each department
SELECT dept_name, AVG(salary) AS avg_sal 
FROM employee 
GROUP BY dept_name;
```

---

## 3. 📜 `GROUP_CONCAT()`

This is a special aggregate function that concatenates (joins) string values from each row within a group into a single string.

**Example:**
```sql
-- List all employee names for each department, separated by commas
SELECT dept_name, GROUP_CONCAT(emp_name) 
FROM employee 
GROUP BY dept_name;
```

---

## 4.  фильтр Filtering Groups with `HAVING`

The `HAVING` clause was added to SQL because the `WHERE` keyword could not be used with aggregate functions.

-   `WHERE` filters rows **before** they are grouped and aggregated.
-   `HAVING` filters groups **after** they have been created by the `GROUP BY` clause.

You use `HAVING` to apply conditions to the output of aggregate functions.

**Examples:**
```sql
-- Find departments where the average salary is less than 50000.00
SELECT dept_name, AVG(salary) AS avg_salary 
FROM employee 
GROUP BY dept_name 
HAVING AVG(salary) < 50000.00;

-- Find departments with fewer than 10 employees
SELECT dept_name, COUNT(*) AS emp_count 
FROM employee 
GROUP BY dept_name 
HAVING COUNT(*) < 10;
```
