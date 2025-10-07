# 📘 SQL Day 12: Normalization and Data Anomalies

This lesson explains the core concepts behind database normalization, focusing on why it's necessary by exploring **data anomalies**. Normalization is the process of organizing tables and columns in a relational database to minimize data redundancy and improve data integrity.

---

## 1. 🔗 What is Functional Dependency?

A **functional dependency** is a core concept in normalization. It exists when the value of one attribute (or a set of attributes) in a table uniquely determines the value of another attribute.

We write this relationship as **A → B**, which reads as "**A determines B**".

-   **A** is the determinant.
-   **B** is the dependent.

**Example:** In a `students` table, if you know the `student_id`, you can uniquely determine the `student_name`.

```
student_id → student_name
```

---

## 2. 👎 The Problem: A Denormalized Table

Let's consider a single, denormalized table that stores student enrollment information. This design mixes student, course, and enrollment details together.

**`Enrollment` Table:**

| student_id | course_id | student_name | course_name  | instructor |
| :--------- | :-------- | :----------- | :----------- | :--------- |
| 101        | C1        | Sarthak      | SQL Basics   | Sharma     |
| 101        | C2        | Sarthak      | Python Intro | Khan       |
| 102        | C1        | Krushna      | SQL Basics   | Sharma     |

The primary key for this table is a composite key: `(student_id, course_id)`.

This design suffers from significant data redundancy (`Sarthak`, `SQL Basics`, `Sharma` are all repeated) and leads to three major problems known as **data anomalies**.

---

## 3. 💣 Data Anomalies

Anomalies are problems that occur in poorly designed databases, leading to inconsistent or lost data when you try to insert, update, or delete records.

### A. Insertion Anomaly

An **insertion anomaly** occurs when you cannot add a new piece of information to the database because other, unrelated information is missing.

**Problem:** How do we add a new course, `C3 (Advanced Java)`, taught by `Gupta`, if no students have enrolled in it yet?

-   We can't add a row to the `Enrollment` table because the `student_id` (part of the primary key) would be `NULL`, which is not allowed.
-   This means we cannot store information about a new course until at least one student enrolls.

### B. Update Anomaly

An **update anomaly** occurs when updating a single piece of data requires updating multiple rows. If you miss even one row, the data becomes inconsistent.

**Problem:** The instructor for `C1 (SQL Basics)`, `Sharma`, gets a promotion and is now `Dr. Sharma`.

-   To reflect this change, we must find and update **every single row** where `course_id` is `C1`.
-   If we only update one row and forget the others, the database will be inconsistent. Some records will say the instructor is `Sharma`, while others say `Dr. Sharma`.

### C. Deletion Anomaly

A **deletion anomaly** is the unintentional loss of data that occurs when you delete a different piece of data.

**Problem:** Student `102 (Krushna)` is the only student enrolled in `C1 (SQL Basics)`. What happens if Krushna drops the course and we delete that enrollment record?

-   When we delete the last row for `course_id` `C1`, we not only lose the fact that Krushna was enrolled, but we also lose all information about the course itself—that `C1` is `SQL Basics` and is taught by `Sharma`.
-   The course details are unintentionally deleted just because the last student left.

---

## 4. ✅ The Solution: Normalization

To fix these anomalies, we normalize the database by splitting the denormalized table into smaller, well-structured tables. This eliminates redundancy.

#### `Students` Table
| student_id (PK) | student_name |
| :-------------- | :----------- |
| 101             | Sarthak      |
| 102             | Krushna      |

#### `Courses` Table
| course_id (PK) | course_name  | instructor |
| :------------- | :----------- | :--------- |
| C1             | SQL Basics   | Sharma     |
| C2             | Python Intro | Khan       |

#### `Enrollments` Table (Junction Table)
| student_id (FK) | course_id (FK) |
| :-------------- | :------------- |
| 101             | C1             |
| 101             | C2             |
| 102             | C1             |

With this normalized design:
-   **Insertion:** We can add a new course to the `Courses` table without needing a student.
-   **Update:** To change an instructor's name, we only need to update **one row** in the `Courses` table.
-   **Deletion:** Deleting an enrollment from the `Enrollments` table does not delete the student or course information from their respective tables.

---

## 5. 📉 What is Partial Dependency?

The anomalies in our original table were caused by **partial dependencies**. A partial dependency occurs when a non-key attribute depends on only a part of a composite primary key, not the whole key.

In our denormalized `Enrollment` table with primary key `(student_id, course_id)`:
-   `student_name` depends only on `student_id`. (**Partial Dependency**)
-   `course_name` and `instructor` depend only on `course_id`. (**Partial Dependency**)

**Rule:** A table is in **Second Normal Form (2NF)** if it has no partial dependencies. By splitting the table, we eliminated the partial dependencies and achieved 2NF.