create database joins;
use joins;

create table departments(
 department_id int primary key,
 department_name varchar(100)
);

create table employees(
 employee_id int primary key,
 name varchar(50),
 dept_id int,
 manager_id int,
 foreign key(dept_id) references departments(department_id) on delete set null
);

insert into departments(department_id,department_name)
  values(101,"Computer"),
        (102,"E&TC"),
        (103,"Machanical"),
        (104,"AIML"),
        (105,"Civil");
        
INSERT INTO employees(employee_id, name, dept_id) VALUES
(1, 'Amit Sharma', 101),      -- Manager of Priya
(2, 'Neha Patil', 102),      -- Manager of Rohan
(3, 'Rahul Deshmukh', 103),  -- Manager of Kavya
(4, 'Sneha Kulkarni', 104),  -- Manager of Aditya
(5, 'Vikram Singh', 105),    -- Manager of Pooja
(6, 'Priya Verma', 101),     -- Reports to Amit
(7, 'Rohan Mehta', 102),     -- Reports to Neha
(8, 'Kavya Joshi', 103),     -- Reports to Rahul
(9, 'Aditya Rao', 104),      -- Reports to Sneha
(10, 'Pooja Iyer', 105);     -- Reports to Vikram


-- inner , left ,right ,full , self , cross , natural 

-- 1. Inner Join 
-- Returns records that have matching values in both tables.
-- It's the most common type of join.
select employees.name , departments.department_name from employees inner join departments 
on  employees.dept_id = departments.department_id;

select employees.name , departments.department_name from employees inner join departments 
on employees.dept_id = departments.department_id;

select e.name , d.department_name from employees e inner join departments d on 
 e.dept_id = d.department_id; -- Using aliases 'e' and 'd' to make the query shorter.


-- inert more data 
insert into departments(department_id,department_name)
  values(106,"Metalurgy"),
        (107,"Cyber Security");


INSERT INTO employees(employee_id, name) 
VALUES (11, 'sarthak navale'),
	   (12, 'Krushna'),
       (13, 'Pratik');
       
-- 2. Left Outer Join (or LEFT JOIN)
-- Returns all records from the left table (employees), and the matched records from the right table (departments).
-- The result is NULL from the right side if there is no match.
-- This will show all employees, even those without a department.
select employees.name , departments.department_name from employees left join departments 
on employees.dept_id = departments.department_id;

select e.name , d.department_name from employees e left join departments d on 
 e.dept_id = d.department_id;

-- 3. Right Outer Join (or RIGHT JOIN)
-- Returns all records from the right table (departments), and the matched records from the left table (employees).
-- The result is NULL from the left side if there is no match.
-- This will show all departments, even those with no employees.
select e.name, d.department_name from employees e right join departments d on
 e.dept_id = d.department_id;

-- 4. Full Outer Join
-- Returns all records when there is a match in either the left or right table.
-- It's a combination of LEFT and RIGHT JOIN.
-- MySQL does not have a direct `FULL OUTER JOIN` keyword. We can simulate it using a `UNION` of a LEFT and RIGHT JOIN.
select e.name, d.department_name from employees e left join departments d on e.dept_id = d.department_id
UNION
select e.name, d.department_name from employees e right join departments d on e.dept_id = d.department_id;

-- 5. Self Join
-- A self join is a regular join, but the table is joined with itself.
-- To do this, we need to add manager information to the employees table.
update employees set manager_id = 1 where employee_id = 6;  -- Priya's manager is Amit
update employees set manager_id = 2 where employee_id = 7;  -- Rohan's manager is Neha
update employees set manager_id = 3 where employee_id = 8;  -- Kavya's manager is Rahul
update employees set manager_id = 4 where employee_id = 9;  -- Aditya's manager is Sneha
update employees set manager_id = 5 where employee_id = 10; -- Pooja's manager is Vikram

-- Find the name of each employee and their manager's name.
-- We use two aliases for the same 'employees' table to treat them as separate tables.
select 
  e1.name as employee_name,
  e2.name as manager_name
from employees e1
join employees e2 on e1.manager_id = e2.employee_id;

-- 6. Cross Join
-- Returns the Cartesian product of the two tables.
-- It combines every row from the first table with every row from the second table.
-- Be careful, this can produce a very large number of rows.
-- (13 employees * 7 departments = 91 rows)
select e.name, d.department_name from employees e cross join departments d;

-- 7. Natural Join
-- A `NATURAL JOIN` automatically joins tables based on all columns that have the same name in both tables.
-- It's generally not recommended because it can produce unexpected results if tables have columns with the same name by coincidence.
-- For this to work, the joining columns must have the same name. Let's create new tables for this example.

create table courses_offered(
  course_id int primary key,
  course_name varchar(100)
);

create table course_enrollments(
  enrollment_id int primary key,
  student_name varchar(50),
  course_id int -- Note the column name is the same as in courses_offered
);

insert into courses_offered values (1, 'SQL Basics'), (2, 'Advanced SQL');
insert into course_enrollments values (101, 'Sarthak', 1), (102, 'Krushna', 2), (103, 'Pratik', 1);

-- The NATURAL JOIN will automatically use the 'course_id' column to link the tables.
select student_name, course_name 
from course_enrollments
natural join courses_offered;
-- This is equivalent to:
-- SELECT student_name, course_name FROM course_enrollments e JOIN courses_offered c ON e.course_id = c.course_id;
