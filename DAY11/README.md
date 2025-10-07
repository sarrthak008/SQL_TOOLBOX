# 📘 SQL Day 11: Advanced Joins

This lesson expands on our knowledge of SQL `JOIN`s by exploring two practical and important scenarios:
1.  Performing joins on tables that are not explicitly linked by a `FOREIGN KEY`.
2.  Combining data from three or more tables in a single query.

---

## 1. 🔗 Joins Without Foreign Keys

A common question is whether a `FOREIGN KEY` constraint is required to join two tables. The answer is **no**.

A `JOIN` operation combines rows based on the matching condition you specify in the `ON` clause. The database engine simply looks for matching values between the columns.

-   **`FOREIGN KEY`**: A schema-level rule to enforce data integrity. It ensures that a value in a child table must exist in the parent table.
-   **`JOIN`**: A query-level operation to retrieve and combine data based on a logical relationship.

While it is a strong best practice to define foreign keys, their absence doesn't prevent you from joining tables.

#### Example: `products` and `customers`

In our script, the `customers` table has a `buy_id` column that logically refers to `products.p_id`, but there is no foreign key constraint.

```sql
-- The customers table links to products via buy_id
CREATE TABLE customers(
    c_id INT PRIMARY KEY,
    c_name VARCHAR(100),
    buy_id INT -- Logically relates to products.p_id
);
```

We can still perform all types of joins:

```sql
-- Find which customer bought which product (only shows matches)
SELECT p.p_name, c.c_name 
FROM products p 
INNER JOIN customers c ON p.p_id = c.buy_id;

-- List all products and show which customer bought them, if any
SELECT p.p_name, c.c_name 
FROM products p 
LEFT JOIN customers c ON p.p_id = c.buy_id;
```

---

## 2. ⛓️ Joining Three Tables

Real-world queries often require combining data from more than two tables. The logic is a simple extension of a two-table join: you chain `JOIN` clauses one after another.

A common pattern involves a **junction table** (or bridge table) that connects two other tables.

#### Example: `students`, `teachers`, and `courses`

Here, the `courses` table acts as a junction table. It links a `student` to a `teacher` (mentor) for a specific course.

-   `students` are linked to `courses` via `courses.joined_student`.
-   `teachers` are linked to `courses` via `courses.mentor`.

To get a complete report of which student is taking which course with which teacher, we join all three tables.

```sql
-- The query chains two INNER JOINs
SELECT 
    s.name, 
    c.c_name, 
    t.t_name 
FROM students s 
INNER JOIN courses c ON s.roll_no = c.joined_student 
INNER JOIN teachers t ON c.mentor = t.t_id;
```

#### How it Works:
1.  The database first joins `students` and `courses`, creating a temporary result set.
2.  It then joins that temporary result set with the `teachers` table.
3.  Finally, it selects the requested columns from the final combined result.

---

### ✅ Summary of Concepts Learned

| Concept | Description |
| :--- | :--- |
| **Join without Foreign Key** | `JOIN`s rely on the `ON` condition for matching, not on schema constraints. |
| **Three-Table Join** | Chain multiple `JOIN` clauses to connect tables sequentially, often using a junction table. |