use mydb;

create table employee(
  emp_id int primary key,
  emp_name varchar(50) not null,
  dept_name varchar(50),
  salary decimal(10,2) not null,
  hire_date date default (current_date)
);

INSERT INTO employee (emp_id, emp_name, dept_name, salary) VALUES
(1,  'Amit Sharma',      'IT',         55000.00),
(2,  'Neha Verma',       'HR',         42000.00),
(3,  'Rohit Singh',      'Finance',    60000.00),
(4,  'Priya Nair',       'Marketing',  48000.00),
(5,  'Suresh Iyer',      'IT',         70000.00),
(6,  'Anita Joshi',      'Finance',    52000.00),
(7,  'Vikas Kumar',      'HR',         45000.00),
(8,  'Meera Das',        'Sales',      39000.00),
(9,  'Arjun Mehta',      'IT',         75000.00),
(10, 'Ritika Kapoor',    'Marketing',  47000.00),
(11, 'Karan Malhotra',   'Finance',    65000.00),
(12, 'Sneha Kulkarni',   'HR',         43000.00),
(13, 'Rajesh Gupta',     'Sales',      41000.00),
(14, 'Divya Reddy',      'IT',         72000.00),
(15, 'Manish Pandey',    'Finance',    58000.00),
(16, 'Pooja Saxena',     'Marketing',  49000.00),
(17, 'Aditya Jain',      'IT',         68000.00),
(18, 'Shalini Mishra',   'Sales',      40000.00),
(19, 'Nikhil Bansal',    'Finance',    61000.00),
(20, 'Kavya Menon',      'HR',         44000.00);

-- using = 
select emp_name, salary from employee where emp_id = 15;

-- using != 
-- usig <=
-- using >=
select * from employee where salary <= 44000.00;


-- LIKE 
select emp_name ,emp_id from employee where emp_name like "%i";
select emp_name ,emp_id from employee where emp_name like "_a%";
select emp_name ,emp_id from employee where emp_name like "k%";

-- BETWEEN 
select * from employee where salary between 44000.00 and 50000.00;

-- IN 
select * from employee where dept_name in("HR","IT","Sales");

-- USING <=> (NULL-SAFE EQUALS)
select 1 <=> null; -- Returns 0 (False)
select null <=> null; -- Returns 1 (True)


insert into employee(emp_id,emp_name,salary) values(21,"sarthak navale",11112.90);
-- USING   IS NULL;
select * from employee where dept_name is null;



