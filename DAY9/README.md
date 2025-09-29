# 📘 SQL Day 9: Subqueries

Today's lesson dives into **Subqueries**, also known as inner queries or nested queries. A subquery is a `SELECT` statement that is nested inside another SQL statement like `SELECT`, `INSERT`, `UPDATE`, or `DELETE`, or inside another subquery. They are incredibly useful for performing complex data retrieval in a single, readable query.

---

## 1. 🏗️ Setting Up the Tables

To practice subqueries, we'll use two tables: `courses` and `students`. A student is enrolled in a course, creating a relationship between the two tables via `class_id` (a foreign key).

```sql
CREATE TABLE courses(
  course_id INT PRIMARY KEY,
  course_name VARCHAR(100) NOT NULL,
  duration VARCHAR(10) NOT NULL
);

CREATE TABLE students(
 student_id INT PRIMARY KEY,
 student_name VARCHAR(100) NOT NULL,
 student_age INT,
 student_email VARCHAR(50) UNIQUE,
 class_id INT,
 FOREIGN KEY(class_id) REFERENCES courses(course_id)
);
```

---

## 2. 🎯 What is a Subquery?

A subquery is a query executed as part of another query. The result of the subquery (the "inner query") is used by the main query (the "outer query").

There are a few main types of subqueries, categorized by what they return.

### A. Single-Row Subqueries

This type of subquery returns **exactly one row and one column**. Because it returns a single value, you can use it with standard comparison operators like `=`, `>`, `<`, `<=`, etc.

#### Example: Find students in the "JAVA" course

First, we need to find the `course_id` for "JAVA". Then, we use that ID to find the students. A subquery lets us do this in one step.

```sql
-- The inner query (SELECT course_id...) returns a single value: 101.
-- The outer query then becomes: SELECT * FROM students WHERE class_id = 101;

SELECT * FROM students 
WHERE class_id = (SELECT course_id FROM courses WHERE course_name = "JAVA");
```

### B. Multiple-Row Subqueries

This subquery returns **multiple rows**. Since it returns a list of values, you cannot use standard comparison operators. Instead, you must use operators designed for lists, such as `IN`, `NOT IN`, `ANY`, or `ALL`.

#### Example: Find students in "JAVA" or "PYTHON"

Here, the inner query will return two `course_id`s (101 and 102). The `IN` operator checks if a student's `class_id` matches any value in that list.

```sql
-- The inner query returns a list of course_ids.
-- The outer query finds all students whose class_id is in that list.

SELECT * FROM students 
WHERE class_id IN (SELECT course_id FROM courses WHERE course_name IN ("JAVA", "PYTHON"));
```

---

## 3. 📊 Subqueries with Aggregate Functions

Subqueries are often used in the `WHERE` clause to filter the data that an aggregate function will operate on.

#### Example: Calculate the average age of students in the "JAVA" course

```sql
-- The subquery finds the course_id for "JAVA".
-- The outer query then calculates the average age only for students in that class.

SELECT AVG(student_age) AS avg_age 
FROM students 
WHERE class_id = (SELECT course_id FROM courses WHERE course_name = "JAVA");
```

---

### ✅ Summary of Concepts Learned

| Concept | Description | Example Operator |
| :--- | :--- | :--- |
| **Subquery** | A `SELECT` query nested inside another query. | N/A |
| **Single-Row Subquery** | An inner query that returns one row, one column. | `=`, `>`, `<` |
| **Multiple-Row Subquery**| An inner query that can return multiple rows. | `IN`, `NOT IN`, `ANY`, `ALL` |
