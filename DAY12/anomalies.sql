-- Normalization is the process of organizing columns and tables in a relational database 
-- to minimize data redundancy. A key part of normalization is understanding different types of keys.

-- Primary key
-- A constraint that uniquely identifies each record in a table.
-- It must contain UNIQUE values and cannot contain NULL values.
-- A table can have only ONE primary key.

-- CREATE TABLE users (
 --   user_id INT PRIMARY KEY, -- user_id is the primary key
  --  username VARCHAR(50) NOT NULL,
   -- email VARCHAR(100)
-- );

-- In the 'users' table, 'user_id' uniquely identifies each user.

-- foreign key
-- A key used to link two tables together. It is a field in one table that refers to the PRIMARY KEY in another table.
-- This enforces referential integrity.

-- CREATE TABLE orders (
 --   order_id INT PRIMARY KEY,
   -- user_id INT,
    -- order_date DATE,
    -- FOREIGN KEY (user_id) REFERENCES users(user_id) -- user_id is a foreign key
-- );

-- In the 'orders' table, 'user_id' links to the 'users' table, ensuring an order belongs to an existing user.

-- candidate key
-- An attribute or set of attributes that can uniquely identify a row. A table can have multiple candidate keys.
-- One is chosen as the primary key, and the others are called alternate keys.

-- CREATE TABLE employees (
  --   employee_id INT PRIMARY KEY,      -- Candidate Key 1 (Chosen as Primary Key)
   --  ssn VARCHAR(20) UNIQUE NOT NULL,  -- Candidate Key 2 (Alternate Key)
    -- email VARCHAR(100) UNIQUE NOT NULL, -- Candidate Key 3 (Alternate Key)
    --  full_name VARCHAR(100)
-- );

-- In the 'employees' table, 'employee_id', 'ssn', and 'email' are all candidate keys
-- because each one can uniquely identify an employee.

--  Composite Key
-- A primary key that consists of two or more columns.
-- This is used when no single column can uniquely identify a record, but a combination of columns can.

-- CREATE TABLE enrollments (
   -- student_id INT,
    -- course_id INT,
    -- enrollment_date DATE,
    -- PRIMARY KEY (student_id, course_id) -- This is a composite key
    -- FOREIGN KEY (student_id) REFERENCES students(student_id),
    -- FOREIGN KEY (course_id) REFERENCES courses(course_id)
-- );

-- In the 'enrollments' table, a student can enroll in many courses, and a course can have many students.
-- The combination of 'student_id' and 'course_id' is unique for each enrollment record.

-- Unique Key
-- A constraint that ensures that all values in a column are different.
-- It's similar to a PRIMARY KEY, but a table can have multiple UNIQUE keys,
-- and a UNIQUE key column can (in most database systems) store one NULL value.

-- CREATE TABLE products (
--    product_id INT PRIMARY KEY,
 --   product_code VARCHAR(50) UNIQUE, -- Ensures every product has a unique code
 --   product_name VARCHAR(100) NOT NULL
-- );

-- INSERT INTO products (product_id, product_code, product_name) VALUES (1, 'SKU123', 'Laptop');
-- This would fail because 'SKU123' is already used:
-- INSERT INTO products (product_id, product_code, product_name) VALUES (2, 'SKU123', 'Mouse');

-- This is allowed (in most SQL versions) as a UNIQUE constraint can accept one NULL
-- INSERT INTO products (product_id, product_code, product_name) VALUES (3, NULL, 'Keyboard');
-- This would fail because you can only have one NULL
-- INSERT INTO products (product_id, product_code, product_name) VALUES (4, NULL, 'Monitor')


create database normlization;
use normlization;

create table employees(
 emp_id int primary key,
 emp_name varchar(50),
 salary decimal(10,2)
);

insert into employees 
 values(111,"Swastik",20000),
       (112,"Pravin",70000);              
       
select emp_name from employees where emp_id = 112;

-- 🔹 What is Functional Dependency?

-- A functional dependency exists when one column (or a set of columns) uniquely determines another column in a table.

-- In short:
-- 👉 If you know the value of column A, you can find exactly one value of column B.
-- We write this as:
-- A → B (A determines B).
	

-- 🔹 Functional Dependency:
-- One column (or set of columns) uniquely determines another column.
-- Example: student_id → student_name

-- 🔹 Partial Dependency:
-- A non-prime attribute depends on PART of a composite primary key,
-- not on the whole key.

-- Example Table: Enrollment
-- (student_id, course_id) is the PRIMARY KEY

-- student_id → student_name          (Partial dependency ❌)
-- course_id → course_name, instructor (Partial dependency ❌)
-- (student_id, course_id) → grade     (Full dependency ✅)

-- Problem:
-- Partial dependency causes redundancy and update anomalies.

-- 🔹 Normalization:
-- Partial dependency violates 2NF.
-- To remove it, split the table into smaller ones.

-- Example Fix:

-- Students Table
-- student_id (PK), student_name

-- Courses Table
-- course_id (PK), course_name, instructor

-- Enrollment Table
-- student_id (FK), course_id (FK)
-- Together (student_id, course_id) is PK





-- ANOMALIES

-- 1 . INSERT ANOMALY
-- Suppose we want to insert a NEW course: C103 (Python Core, taught by "Khan").
-- But we don’t have any student enrolled yet.

-- Problem: Enrollment table requires both student_id AND course_id
-- So we CANNOT insert course info unless at least one student is enrolled.



-- UPDATE ANOMALY

-- 🔹 UPDATE ANOMALY
-- Definition:
-- An update anomaly occurs when the same piece of information
-- is stored in multiple rows. 
-- To update it, we must change it everywhere.
-- If we forget one row, the database becomes inconsistent.

-- ❌ Example (Denormalized Table)
-- Enrollment(student_id, course_id, student_name, course_name, instructor)
-- Primary Key = (student_id, course_id)

-- Suppose course_id = 'C101' is taught by instructor 'Sharma'.
-- In the Enrollment table, 'Sharma' is repeated in many rows.
-- If Sharma changes his name to 'Dr. Sharma',
-- we must update ALL rows where course_id = 'C101'.

-- Problem:
-- If one row is missed, some rows say 'Sharma' and others 'Dr. Sharma'.
-- This leads to inconsistent data = UPDATE ANOMALY.

-- ✅ Solution (Normalization to 2NF/3NF)
-- Create a separate Courses table:
-- Courses(course_id PRIMARY KEY, course_name, instructor)
-- Now instructor is stored once for each course.
-- Updating the instructor requires changing only ONE row.


-- 3 ] DELETION ANOMALY

-- 🔹 DELETION ANOMALY

-- Definition:
-- A deletion anomaly occurs when deleting one piece of data
-- accidentally causes the loss of other valuable data.

-- ❌ Example (Denormalized Table)
-- Enrollment(student_id, course_id, student_name, course_name, instructor)
-- Primary Key = (student_id, course_id)

-- Suppose course_id = 'C101' (SQL Basics) is taught by 'Sharma'.
-- Only one student (student_id = 1) is enrolled in that course.

-- If we delete student_id = 1 from Enrollment:
-- DELETE FROM Enrollment WHERE student_id = 1 AND course_id = 'C101';

-- Problem:
-- Along with removing the student's record,
-- we also lose all information about the course 'C101' and instructor 'Sharma'.
-- That means we lost course details just because no students are enrolled.
-- This is a DELETION ANOMALY.

-- ✅ Solution (Normalization to 2NF/3NF)
-- Separate the data into multiple tables:
-- Students(student_id PRIMARY KEY, student_name)
-- Courses(course_id PRIMARY KEY, course_name, instructor)
-- Enrollment(student_id, course_id)  -- junction table

-- Now deleting a student enrollment does NOT del



