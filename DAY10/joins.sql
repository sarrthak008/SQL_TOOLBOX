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
 foreign key(dept_id) references departments(department_id)
);

insert into departments(department_id,department_name)
  values(101,"Computer"),
        (102,"E&TC"),
        (103,"Machanical"),
        (104,"AIML"),
        (105,"Civil");
        
INSERT INTO employees(employee_id, name, dept_id) VALUES
(1, 'Amit Sharma', 101),
(2, 'Neha Patil', 102),
(3, 'Rahul Deshmukh', 103),
(4, 'Sneha Kulkarni', 104),
(5, 'Vikram Singh', 105),
(6, 'Priya Verma', 101),
(7, 'Rohan Mehta', 102),
(8, 'Kavya Joshi', 103),
(9, 'Aditya Rao', 104),
(10, 'Pooja Iyer', 105);


-- innter , left ,right ,full , self , cross , natural 

-- Inner Join 
select employees.name , departments.department_name from employees inner join departments 
on  employees.dept_id = departments.department_id;

select employees.name , departments.department_name from employees inner join departments 
on employees.dept_id = departments.department_id;

select e.name , d.department_name from employees e inner join departments d on 
 e.dept_id = d.department_id;


-- inert more data 
insert into departments(department_id,department_name)
  values(106,"Metalurgy"),
        (107,"Cyber Security");


INSERT INTO employees(employee_id, name) 
VALUES (11, 'sarthak navale'),
	   (12, 'Krushna'),
       (13, 'Pratik');
       
-- Left Outer Join
select employees.name , departments.department_name from employees left join departments 
on employees.dept_id = departments.department_id;

select e.name , d.department_name from employees e left join departments d on 
 e.dept_id = d.department_id;
 
 -- Right Join 

 select employees.name , departments.department_name from employees right join departments 
 on employees.dept_id = departments.department_id;

select e.name , d.department_name from employees e right join departments d 
on e.dept_id = d.department_id;


-- full join 

select employees.name , departments.department_name from employees right join departments 
on employees.dept_id = departments.department_id
union
select employees.name , departments.department_name from employees left join departments
on employees.dept_id = departments.department_id;



-- cross join 
select employees.name , departments.department_name from employees cross join departments;


-- self join

create table students(
id int primary key,
name varchar(100),
leaders_id int 
);

insert into students(id , name , leaders_id)
 values(1,"Avi",null),
       (2,"Sunit",1),
       (3,"Pratik",1),
       (4,"Jaydip",2),
       (5,"Sumit",2),
       (6,"Vaibhav",3);
       
select s.name as student, l.name as leaders from students s left join students l 
on s.leaders_id = l.id;
