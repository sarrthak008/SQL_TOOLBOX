# 📘 SQL Day 10: Mastering Joins

This lesson provides a comprehensive guide to SQL `JOIN` clauses. `JOIN`s are used to combine rows from two or more tables based on a related column between them. Understanding the different types of joins is fundamental for querying relational databases effectively.

---

## 1. 🏗️ Table Setup

We will use two primary tables, `departments` and `employees`, to demonstrate the joins.

```sql
CREATE TABLE departments(
 department_id INT PRIMARY KEY,
 department_name VARCHAR(100)
);

CREATE TABLE employees(
 employee_id INT PRIMARY KEY,
 name VARCHAR(50),
 dept_id INT,
 manager_id INT,
 FOREIGN KEY(dept_id) REFERENCES departments(department_id) ON DELETE SET NULL
);
```

---

## 2. 🔗 Types of SQL Joins

### A. Inner Join

The `INNER JOIN` keyword selects records that have matching values in both tables. It is the most common type of join.

**Use Case:** Get a list of all employees and the name of the department they work in. Employees without a department or departments without employees will not be shown.

```sql
SELECT e.name, d.department_name 
FROM employees e 
INNER JOIN departments d ON e.dept_id = d.department_id;
```

### B. Left Join (Left Outer Join)

The `LEFT JOIN` keyword returns all records from the left table (`employees`), and the matched records from the right table (`departments`). The result is `NULL` from the right side if there is no match.

**Use Case:** Get a list of **all** employees, and show their department name if they have one. This is useful for finding employees who have not yet been assigned to a department.

```sql
SELECT e.name, d.department_name 
FROM employees e 
LEFT JOIN departments d ON e.dept_id = d.department_id;
```

### C. Right Join (Right Outer Join)

The `RIGHT JOIN` keyword returns all records from the right table (`departments`), and the matched records from the left table (`employees`). The result is `NULL` from the left side if there is no match.

**Use Case:** Get a list of **all** departments, and show the employees in them. This is useful for finding departments that currently have no employees.

```sql
SELECT e.name, d.department_name 
FROM employees e 
RIGHT JOIN departments d ON e.dept_id = d.department_id;
```

### D. Full Outer Join

A `FULL OUTER JOIN` returns all records when there is a match in either the left or the right table. It's a combination of `LEFT JOIN` and `RIGHT JOIN`.

**Note:** MySQL does not have a `FULL OUTER JOIN` keyword. We simulate it by combining a `LEFT JOIN` and a `RIGHT JOIN` with `UNION`.

**Use Case:** List every employee and every department. If an employee has a department, they will be matched. If not, one side will be `NULL`.

```sql
SELECT e.name, d.department_name FROM employees e LEFT JOIN departments d ON e.dept_id = d.department_id
UNION
SELECT e.name, d.department_name FROM employees e RIGHT JOIN departments d ON e.dept_id = d.department_id;
```

### E. Self Join

A `SELF JOIN` is a regular join where a table is joined with itself. To do this, you must use two different aliases for the same table.

**Use Case:** Find the manager for each employee. Here, we join the `employees` table to itself, matching the `manager_id` of one alias to the `employee_id` of the other.

```sql
SELECT 
  e1.name AS employee_name,
  e2.name AS manager_name
FROM employees e1
JOIN employees e2 ON e1.manager_id = e2.employee_id;
```

### F. Cross Join

A `CROSS JOIN` returns the Cartesian product of the two tables. It combines every row from the first table with every row from the second table.

**⚠️ Warning:** Use this join with caution, as it can generate a very large result set (rows in table1 * rows in table2).

**Use Case:** Generate all possible combinations of employees and departments, perhaps for a scheduling or assignment matrix.

```sql
SELECT e.name, d.department_name 
FROM employees e 
CROSS JOIN departments d;
```

### G. Natural Join

A `NATURAL JOIN` automatically joins tables based on all columns that have the same name.

**⚠️ Warning:** This is generally not recommended for production code because it can produce unexpected results if tables have columns with the same name by coincidence. An explicit `JOIN` with an `ON` clause is safer.

**Use Case:** A quick way to join tables where the foreign key column has the exact same name as the primary key column it references.

```sql
-- Example with different tables where 'course_id' is the common column
SELECT student_name, course_name 
FROM course_enrollments
NATURAL JOIN courses_offered;
```

---

### ✅ Summary of Joins

| Join Type | Purpose |
| :--- | :--- |
| **INNER JOIN** | Returns only the rows where the join condition is met in both tables. |
| **LEFT JOIN** | Returns all rows from the left table, and matched rows from the right table. |
| **RIGHT JOIN** | Returns all rows from the right table, and matched rows from the left table. |
| **FULL OUTER JOIN** | Returns all rows when there is a match in one of the tables. |
| **SELF JOIN** | Joins a table to itself to compare rows within the same table. |
| **CROSS JOIN** | Returns the Cartesian product of the two tables (all possible combinations). |
| **NATURAL JOIN** | Joins tables automatically based on columns with the same name. |