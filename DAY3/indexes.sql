use mydb;
-- create indexes In Table---

create table students(
 s_id int primary key auto_increment,
 roll_no int unique,
 name varchar(100) not null,
 email varchar(100) unique,
 courses varchar(100),
 age int,
 admission_date timestamp default current_timestamp
);

desc students;

-- what is there in table --

--  s_id -> PRIMARY KEY (indexed automatically).
-- roll_no -> UNIQUE INDEX.
-- emaial -> UNIQUE INDEX.

insert into students(roll_no,name,email,courses,age) values
   (101,"sarthak","sarthak@gamil.com","java",20),
   (102,"avinash","avinash@gamil.com","python",21),
   (103,"krushna","krushna@gamil.com","web development",22),
   (104,"sarthak","sarthak12@gamil.com",".net",20);


-- Search by name 
-- select email,courses from students where name = "sarthak";   

-- How do we create an index?
-- create INDEX index_name ON table_name(column);

-- Before creating an index..
select * from students where name = "sarthak";
explain select * from students where name = "sarthak";

-- The 'rows' column in the EXPLAIN output shows 4, meaning it scanned all 4 rows (a full table scan).

create index s_name_index on students(name);
select * from students where name = "sarthak";
explain select * from students where name = "sarthak";

-- After creating the index, the 'rows' column shows a smaller number, indicating a more efficient index scan.
-- This is a more efficient way to search.


-- now lets create a index for courses column
 
create index course_index on students(courses);
select * from students where courses = "java";

create index age_index on students(age);
select name from students where age between 18 and 22;
explain select name from students where age between 18 and 22;

-- Show All Indexes
SHOW INDEX FROM students;


-- What is Cardinality in Indexes?

-- In databases, cardinality refers to the uniqueness of values in a column (or set of columns).

-- High cardinality → The column has many unique values.
-- Example: email, user_id, Aadhar number.

-- Low cardinality → The column has few distinct values.
-- Example: gender (Male/Female), status (Active/Inactive)


