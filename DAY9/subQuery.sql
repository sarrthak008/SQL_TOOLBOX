create database subQuery;
use subQuery;

create table courses(
  course_id int primary key ,
  course_name varchar(100) not null,
  duration varchar(10) not null
 );
 
 
 insert into courses(course_id,course_name,duration) values
   ( 101,"JAVA","6 months"),
   ( 102,"PYTHON","4 months"),
   ( 103,"DSA WITH C++","7 months"),
   ( 104,"NODE JS ","8 months"),
   ( 105,"GSAP","4 months");
   

create table students(
 student_id int primary key,
 student_name varchar(100) not null,
 student_age int,
 student_email varchar(50) unique,
 class_id int,
 foreign key(class_id) references courses(course_id)
);

insert into students(student_id,student_name,student_age,student_email,class_id)
  values(1,"Nisha",19,"nisha@gmail.com",101),
  (2,"Dipika",20,"dipika@gmail.com",104),
  (3,"Vaishnavi",21,"vaishnavi@gmail.com",105),
  (4,"Krushna",22,"krushna@gmail.com",103),
  (5,"Poonam",19,"poonam@gmail.com",102),
  (6,"Vaibhav",23,"vaibhva@gmail.com",104),
  (7,"Prathmesh",19,"prathmesh@gmail.com",103),
  (8, 'Aman', 21, 'aman@gmail.com', 103),
  (9, 'Kavita', 22, 'kavita@gmail.com', 104),
  (10, 'Raj', 23, 'raj@gmail.com', 105),
  (11, 'Priya', 19, 'priya@gmail.com', 101),
  (12, 'Anil', 20, 'anil@gmail.com', 102),
  (13, 'Seema', 21, 'seema@gmail.com', 103),
  (14, 'Deepak', 22, 'deepak@gmail.com', 104),
  (15, 'Komal', 23, 'komal@gmail.com', 105),
  (16, 'Rahul', 24, 'rahul@gmail.com', 101),
  (17, 'Sneha', 20, 'sneha@gmail.com', 102),
  (18, 'Mohit', 21, 'mohit@gmail.com', 103),
  (19, 'Ritu', 22, 'ritu@gmail.com', 104),
  (20, 'Arjun', 23, 'arjun@gmail.com', 105);

-- 1. Single-Row Subquery
-- Find all students enrolled in the "JAVA" course.
-- The inner query returns a single course_id (101), so we can use the '=' operator.
select * from students where class_id = (select course_id from courses where course_name = "JAVA");

-- 2. Multiple-Row Subquery with IN
-- Find all students enrolled in either "JAVA" or "PYTHON".
-- The inner query can return multiple course_ids, so we use the 'IN' operator.
select * from students where class_id in(select course_id from courses where course_name in("JAVA","PYTHON"));

-- 3. Subquery in a WHERE clause for an Aggregate Function
-- Calculate the average age of students in the "JAVA" course.
select avg(student_age) as avg_age from students where class_id = (select course_id from courses where course_name = "JAVA");

-- 4. Another Multiple-Row Subquery Example
-- Find the name and email of students enrolled in courses that are either "4 months" or "6 months" long.
select student_name,student_email , class_id from students where class_id in(select course_id from courses where duration in("6 months","4 months"));

-- 5. Correlated Subquery in the SELECT list
-- For each student, find the duration of their enrolled course.
-- The inner query is executed for each row of the outer query.
select student_name, student_email, (select duration from courses where courses.course_id = students.class_id) as course_duration 
from students;
