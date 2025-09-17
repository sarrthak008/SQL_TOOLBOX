# 📘 SQL Day 3: Indexes

Today's focus is on **SQL Indexes**, a crucial concept for optimizing database query performance.

---

## 1. ⚡ What is an Index?

An index is a special lookup table that the database search engine can use to speed up data retrieval. Think of it like the index at the back of a book: instead of reading the whole book to find a topic, you look up the topic in the index and go directly to the page.

-   **Pros:** Significantly speeds up `SELECT` queries and `WHERE` clauses.
-   **Cons:** Can slow down data modification operations (`INSERT`, `UPDATE`, `DELETE`) because the index also needs to be updated.

## 2. 🤖 Automatic Indexes

Some indexes are created automatically for you. In MySQL, when you define a `PRIMARY KEY` or a `UNIQUE` constraint on a column, the database automatically creates an index on that column to enforce uniqueness and speed up lookups.

#### Example: `students` table

In our `students` table, indexes are automatically created for:
-   `s_id` (because it's the `PRIMARY KEY`)
-   `roll_no` (because it has a `UNIQUE` constraint)
-   `email` (because it has a `UNIQUE` constraint)

```sql
CREATE TABLE students(
 s_id INT PRIMARY KEY AUTO_INCREMENT,
 roll_no INT UNIQUE,
 name VARCHAR(100) NOT NULL,
 email VARCHAR(100) UNIQUE,
 courses VARCHAR(100),
 age INT,
 admission_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

## 3. 🕵️‍♂️ Analyzing Queries with `EXPLAIN`

The `EXPLAIN` command shows how the database will execute a query. It's a powerful tool to check if your queries are using indexes.

#### Before Creating an Index

When we search on a non-indexed column like `name`, the database has to scan every single row. This is called a **full table scan**.

```sql
-- This query will perform a full table scan
EXPLAIN SELECT * FROM students WHERE name = "sarthak";
```
The output will show that it had to examine all rows in the table.

## 4. ✍️ Creating an Index Manually

You can create your own indexes on columns that you frequently search on.

#### Syntax
```sql
CREATE INDEX index_name ON table_name(column_name);
```

#### Example: Creating an index on the `name` column

```sql
CREATE INDEX s_name_index ON students(name);
```

Now, if we run the `EXPLAIN` command again, we'll see that the database uses our new `s_name_index` instead of doing a full table scan, making the search much faster.

```sql
-- This query will now use the index
EXPLAIN SELECT * FROM students WHERE name = "sarthak";
```

## 5. 📋 Viewing All Indexes in a Table

To see all the indexes associated with a table, you can use the `SHOW INDEX` command.

```sql
SHOW INDEX FROM students;
```
This will list all indexes, including the automatic ones (`PRIMARY`, `roll_no`, `email`) and the ones you created manually (`s_name_index`).

## 6. 📊 What is Cardinality?

**Cardinality** refers to the uniqueness of data values in a column.

-   **High Cardinality**: The column contains a large proportion of unique values.
    -   *Examples*: `email`, `user_id`, `s_id`.
    -   **Indexes work best on high-cardinality columns.**

-   **Low Cardinality**: The column contains a lot of duplicate values (few unique values).
    -   *Examples*: `gender`, `country`, `is_active` (boolean).
    -   Indexes on low-cardinality columns are not very effective and can sometimes make performance worse. The database might choose to do a full table scan anyway if the cardinality is too low.

---

### ✅ Summary of Concepts Learned

| Command | Description |
| :--- | :--- |
| `CREATE INDEX` | Creates a new index on one or more columns. |
| `EXPLAIN` | Analyzes a query and shows its execution plan. |
| `SHOW INDEX FROM` | Lists all indexes on a specific table. |
| **Cardinality** | A measure of the uniqueness of values in a column, crucial for index effectiveness. |