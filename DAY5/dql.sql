CREATE DATABASE IF NOT EXISTS dql;
USE dql;

create table employees(
employee_id int,
first_name varchar(100),
last_name varchar(100),
department varchar(50),
hire_date date,
primary key(employee_id)
);

desc employees;

select * from employees;

insert into employees(employee_id,first_name,last_name,department,hire_date) 
     values(1,"sarthak","navale","web dev","2025-10-23"),
		   (2,"sumit","yewale","java","2023-04-10"),
           (3,"jaydip","nawale","pyhton","2022-05-13"),
           (4,"krushna","jagtap","node js","2021-09-04"),
           (5,"prathmesh","deogirkiar","react","2020-05-04");
           
-- select 
select * from employees;


-- with selected filds
select first_name,last_name,hire_date from employees;

-- distinct()
select distinct(department) from employees;

-- where 
select * from employees where first_name = "sarthak";
select hire_date from employees where first_name = "sarthak";

select * from employees where department = "java";

 -- in
select * from employees where department in("java","web dev");

-- and
select * from employees where department = "python" and first_name = "jaydip";

-- or
select * from employees where department = "pyhton" or first_name = "jaydip";

-- between
select * from employees where hire_date between "2022-01-02"and "2024-01-01";

-- like 
select first_name from employees where first_name like "s%";

-- check second alphbate
select first_name from employees where first_name like "_a%";

select last_name from employees where last_name like "%e%";

select last_name from employees where last_name like "%e%";


-- order by

-- assending
select *from employees order by first_name;
select *from employees order by first_name asc;

-- desc 
select *from employees order by first_name desc;

-- limit
select *from employees order by first_name desc limit 3;


-- IS NOT NULL
select * from employees where department IS not null;

-- casee / when / else 

-- SELECT column,
--    CASE 
--      WHEN condition1 THEN result1
--      WHEN condition2 THEN result2
--      ELSE result3
--    END AS new_column_name
-- FROM table_name;

select * , 
   case
     when employee_id < 2  then "early members"
     when employee_id < 4  then "mid members"
     else "late joiner"
   end as join_satus 
   end as join_status 
from employees;


