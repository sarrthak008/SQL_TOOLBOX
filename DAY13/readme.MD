# 📘 SQL Day 13: Understanding and Using Views

This lesson covers SQL `VIEW`s, which are powerful tools for simplifying query complexity, enhancing security, and providing a stable interface to underlying table structures.

## 1. What is a View?

A **View** is a virtual table based on the result-set of a `SELECT` statement.

-   **Virtual Table**: A view contains rows and columns, just like a real table. However, it does not store any data itself. The data is dynamically generated from the underlying base tables each time the view is queried.
-   **Stored Query**: You can think of a view as a stored `SELECT` query that you can interact with as if it were a table.

### Advantages of Using Views
| Advantage | Description |
| :--- | :--- |
| **Simplicity** | Hides the complexity of queries with multiple joins and complex logic. A user can query a simple view instead of writing a complicated query. |
| **Security** | Restricts access to data. You can grant users permission to a view that only exposes certain columns or rows, hiding sensitive data from the underlying tables. |
| **Consistency** | Provides a consistent and unchanging structure for front-end applications, even if the underlying base tables are restructured. |

---

## 2. Simple Views

A simple view is based on a `SELECT` query from a single table. It's often used to filter rows or select a subset of columns.

#### Example: `passed_student`

Imagine we frequently need to get a list of students who have passed. Instead of writing the `WHERE` clause every time, we can create a view.

```sql
-- Create a view for students who have passed
CREATE VIEW passed_student AS
SELECT name, email, percent 
FROM students
WHERE result = 'Pass';
```

Now, we can query this view just like a table:

```sql
-- Get all passed students
SELECT * FROM passed_student;

-- Get passed students whose name starts with 'A'
SELECT name, email FROM passed_student WHERE name LIKE 'A%';
```

---

## 3. Complex Views

A complex view is based on a `SELECT` query that involves multiple tables (using `JOIN`s), aggregate functions (`SUM`, `COUNT`), or `GROUP BY` clauses.

#### Example: `patient_doctor_view`

To get a combined list of patients and their assigned doctors, we need to join the `patient` and `doctor` tables. A view can simplify this.

```sql
-- Create a view that joins patient and doctor information
CREATE VIEW patient_doctor_view AS 
SELECT 
    p.p_id AS patient_id, 
    p.name AS patient_name,
    d.d_id AS doctor_id, 
    d.d_name AS doctor_name,
    d.specialization 
FROM patient p 
JOIN doctor d ON p.doctor_id = d.d_id;
```

Now, getting this combined information is as simple as:

```sql
SELECT * FROM patient_doctor_view;
```

---

## 4. Materialized Views (Simulation in MySQL)

A **Materialized View** is different from a standard view. Instead of being virtual, it physically stores the result set of its query on disk.

-   **Standard View**: Runs its `SELECT` query every time it's accessed. Always shows live data.
-   **Materialized View**: Stores a snapshot of the data. It's much faster to query but the data can become stale. It needs to be "refreshed" to get updated data.

**Important**: MySQL and MariaDB do not have native support for `CREATE MATERIALIZED VIEW`. However, this functionality can be simulated.

#### Simulating a Materialized View in MySQL

The common approach is to create a regular table (a "summary table") and periodically populate it with the results of a complex query.

**Use Case**: Imagine you have a massive `orders` table and you need to run a monthly sales report. Aggregating millions of rows every time is slow.

**Step 1: Create a Summary Table**
This table will store the pre-calculated results.

```sql
CREATE TABLE monthly_order_summary (
    order_month VARCHAR(7) PRIMARY KEY,
    total_amount DECIMAL(12, 2),
    order_count INT
);
```

**Step 2: Populate (or "Refresh") the Table**
Run an `INSERT`...`SELECT` statement to fill the summary table. This can be done manually or automated with a scheduled `EVENT`.

```sql
-- This query calculates the summary and stores it
INSERT INTO monthly_order_summary (order_month, total_amount, order_count)
SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS order_month,
    SUM(amount) AS total_amount,
    COUNT(order_id) AS order_count
FROM orders
GROUP BY order_month;
```

Now, querying `monthly_order_summary` is extremely fast because the aggregations are already done.

---

## 5. Managing Views

To remove a view, you use the `DROP VIEW` command.

```sql
DROP VIEW passed_student;
DROP VIEW patient_doctor_view;
```

