use normlization;
-- 1NF  no repeating groups or arrays 

create table student(
id int primary key,
name varchar(50),
courses varchar(300)
);

insert into student
values(1,"Sarthak","Java"),
      (1,"sarthak","Pyhton"); -- gives the error
      
      -- 🔹 FIRST NORMAL FORM (1NF)

-- Rules of 1NF:
-- 1. Each column must contain atomic (indivisible) values.
-- 2. No multiple values or repeating groups in a single column.
-- 3. Each row must be unique.
-- 4. Each column must contain values of the same type.

-- ❌ Example (Not in 1NF)
-- student_id | student_name | courses
--     1      | Ravi         | SQL, Java
--     2      | Priya        | Python, HTML
-- Problem: 'courses' column has multiple values.

-- ✅ Fix (Convert to 1NF)
-- student_id | student_name | course
--     1      | Ravi         | SQL
--     1      | Ravi         | Java
--     2      | Priya        | Python
--     2      | Priya        | HTML
-- Now each column has atomic values, no repeating groups, 
-- and the table is in 1NF.


create table student1NF(
 id int,
 name varchar(50),
 course varchar(20)
);

insert into student1NF
values(1,"Sarthak","Java"),
      (1,"sarthak","Pyhton");

select * from student1NF;



-- 2NF second Normalization 
-- 🔹 SECOND NORMAL FORM (2NF)

-- Definition:
-- A table is in 2NF if:
-- 1. It is already in 1NF.
-- 2. There is NO PARTIAL DEPENDENCY.
--    (i.e., no non-prime attribute should depend on part of a composite primary key).

-- 👉 Non-prime attribute = a column that is NOT part of any candidate key.

-- ❌ Example (Violates 2NF)
-- Enrollment(student_id, course_id, student_name, course_name, instructor)
-- Primary Key = (student_id, course_id)

-- Problems:
-- student_name depends only on student_id  (partial dependency ❌)
-- course_name, instructor depend only on course_id (partial dependency ❌)
-- This causes redundancy and anomalies.

-- ✅ Convert to 2NF (Remove Partial Dependency)

-- Students Table
-- student_id (PK), student_name

-- Courses Table
-- course_id (PK), course_name, instructor

-- Enrollment Table
-- student_id (FK), course_id (FK)
-- Together (student_id, course_id) is PK

-- Now:
-- • student_name depends fully on student_id
-- • course_name and instructor depend fully on course_id
-- • Enrollment only maps students to courses
-- No partial dependency → Table is in 2NF

create table student2NF(
id int primary key,
name varchar(50)
);

insert into student2NF 
values (11,"Ravan"),
	   (12,"Ram");
       
       
create table courses(
c_id int primary key,
c_name varchar(100)
);

insert into courses
values(101,"Java"),
	  (102,"Pyhton");
      


-- 3NF 
-- 🔹 THIRD NORMAL FORM (3NF)

-- Definition:
-- A table is in 3NF if:
-- 1. It is already in 2NF.
-- 2. There is NO TRANSITIVE DEPENDENCY.
--    (i.e., non-prime attributes should NOT depend on other non-prime attributes)

-- ❌ Example (Violates 3NF)
-- Students(student_id, student_name, dept_id, dept_name)
-- Primary Key = student_id

-- Problem:
-- dept_name depends on dept_id (non-prime attribute)
-- student_id → dept_id → dept_name (transitive dependency ❌)
-- This causes redundancy and update anomalies.

-- ✅ Convert to 3NF (Remove Transitive Dependency)

-- Students Table
-- student_id (PK), student_name, dept_id (FK)

-- Departments Table
-- dept_id (PK), dept_name

-- Now:
-- • student_name depends only on student_id
-- • dept_name depends only on dept_id
-- • No transitive dependency → Table is in 3NF


create table student3NF(
id int primary key,
name varchar(100)
);


INSERT INTO student3NF (id, name) VALUES 
(1, 'Ravi'),
(2, 'Priya'),
(3, 'Amit'),
(4, 'Neha'),
(5, 'Saurabh');

create table courses3NF(
c_id int primary key,
c_name varchar(100)
);

INSERT INTO courses3NF (c_id, c_name) VALUES
(101, 'SQL Basics'),
(102, 'Java Core'),
(103, 'Python Core'),
(104, 'HTML & CSS'),
(105, 'JavaScript Advanced');

create table enrollmets(
s_id int,
c_id int,
foreign key(s_id) references student3NF(id),
foreign key(c_id) references courses3NF(c_id)
);

insert into enrollmets
values(1,101),
      (2,105),
	  (1,102);

delete from enrollmets where s_id = 1 and c_id = 101;
select * from enrollmets;




