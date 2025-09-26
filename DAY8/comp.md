# 📘 SQL Day 8: Comparison Functions and Operators

This guide covers the essential **Comparison Operators** in SQL. These operators are primarily used in the `WHERE` clause to filter data based on specific conditions. The examples below use the `employee` table defined in the script.

---

## 1. ⚖️ Standard Comparison Operators

These are the most common operators used for comparing values.

| Operator | Description | Example |
| :--- | :--- | :--- |
| `=` | Equal to | `WHERE emp_id = 15;` |
| `!=` or `<>` | Not equal to | `WHERE dept_name != 'IT';` |
| `>` | Greater than | `WHERE salary > 60000;` |
| `<` | Less than | `WHERE salary < 40000;` |
| `>=` | Greater than or equal to | `WHERE salary >= 70000;` |
| `<=` | Less than or equal to | `WHERE salary <= 44000;` |

**Example Query:**
```sql
-- Select all employees with a salary of 44000.00 or less
SELECT * FROM employee WHERE salary <= 44000.00;
```

---

## 2. 🧩 Pattern Matching with `LIKE`

The `LIKE` operator is used to search for a specified pattern in a column. It's incredibly useful for searching text data.

- `%` (Percent Sign): Represents zero, one, or multiple characters.
- `_` (Underscore): Represents a single character.

**Examples:**
```sql
-- Find employees whose name ends with 'i'
SELECT emp_name, emp_id FROM employee WHERE emp_name LIKE '%i';

-- Find employees whose name has 'a' as the second letter
SELECT emp_name, emp_id FROM employee WHERE emp_name LIKE '_a%';

-- Find employees whose name starts with 'K'
SELECT emp_name, emp_id FROM employee WHERE emp_name LIKE 'k%';
```

---

## 3. ↔️ Range and List Operators

#### `BETWEEN`
The `BETWEEN` operator selects values within a given range. The values can be numbers, text, or dates. The range is inclusive (it includes the start and end values).

**Example:**
```sql
-- Find employees with a salary between 44000 and 50000
SELECT * FROM employee WHERE salary BETWEEN 44000.00 AND 50000.00;
```

#### `IN`
The `IN` operator allows you to specify multiple values in a `WHERE` clause. It's a shorthand for multiple `OR` conditions.

**Example:**
```sql
-- Find employees who work in the HR, IT, or Sales departments
SELECT * FROM employee WHERE dept_name IN ('HR', 'IT', 'Sales');
```

---

## 4. 👻 Handling NULL Values

In SQL, `NULL` represents a missing or unknown value. You cannot use standard comparison operators like `=` or `!=` to check for `NULL`. Instead, you must use `IS NULL` or `IS NOT NULL`.

#### `IS NULL`
Checks if a column's value is `NULL`.

**Example:**
```sql
-- Find employees who do not have a department assigned
SELECT * FROM employee WHERE dept_name IS NULL;
```

#### `<=>` (NULL-Safe Equal Operator)
This is a special MySQL operator. It performs an equality comparison like the `=` operator, but it treats two `NULL` values as equal instead of unknown.

- `value = NULL` always returns `NULL`.
- `value <=> NULL` returns `0` (false) if `value` is not `NULL`, and `1` (true) if `value` is `NULL`.

**Examples:**
```sql
SELECT 1 <=> NULL;      -- Returns 0 (false) because 1 is not NULL
SELECT NULL <=> NULL;   -- Returns 1 (true) because both are NULL
```
This operator is useful in complex comparisons where you need to be able to directly compare `NULL` values.