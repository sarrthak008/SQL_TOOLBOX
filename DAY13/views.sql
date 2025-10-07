create database view;
use  view;


-- VIEW -> VIEW IS  A VIRTUAL TABLE , BASED ON SELECT QUERY . 


-- SYNTAX
-- create view view_name as 
-- select col1,col2, from
-- table_name where condition;


create table students(
 roll_no int primary key auto_increment,
 name varchar(100) not null,
 gender enum("male","female","other"),
 email varchar(100) unique,
 class varchar(	20),
 english float(4,2),
 marathi float(4,2),
 history float(4,2),
 geography float(4,2),
 math float(4,2),
 percet float(4,2),
 result varchar(50)
);

drop table students;

INSERT INTO students (name, gender, email, class, english, marathi, history, geography, math, percet, result)
VALUES
('Aarav Patil', 'male', 'aarav.patil@example.com', '10A', 78.50, 82.00, 74.50, 80.00, 88.00, 80.60, 'Pass'),
('Isha Deshmukh', 'female', 'isha.deshmukh@example.com', '10A', 92.00, 90.50, 88.00, 91.00, 95.00, 91.30, 'Distinction'),
('Rohan Shinde', 'male', 'rohan.shinde@example.com', '10B', 65.00, 70.00, 68.50, 72.00, 60.00, 67.10, 'Pass'),
('Sneha Jadhav', 'female', 'sneha.jadhav@example.com', '10C', 85.00, 87.50, 90.00, 86.00, 92.00, 88.10, 'Distinction'),
('Omkar Pawar', 'male', 'omkar.pawar@example.com', '10A', 55.00, 58.00, 62.50, 60.00, 50.00, 57.10, 'Pass'),
('Neha Kulkarni', 'female', 'neha.kulkarni@example.com', '10B', 78.00, 75.50, 80.00, 76.00, 82.00, 78.30, 'First Class'),
('Tanmay More', 'male', 'tanmay.more@example.com', '10C', 45.00, 48.00, 50.00, 52.00, 46.00, 48.20, 'Pass'),
('Pooja Joshi', 'female', 'pooja.joshi@example.com', '10A', 94.00, 96.00, 93.50, 92.00, 97.00, 94.50, 'Distinction'),
('Rahul Sawant', 'male', 'rahul.sawant@example.com', '10B', 60.00, 63.00, 58.50, 61.00, 65.00, 61.50, 'Pass'),
('Kiran Gaikwad', 'other', 'kiran.gaikwad@example.com', '10C', 82.00, 80.00, 85.00, 83.50, 87.00, 83.50, 'First Class');

select * from students;

select name ,email,percet from students where result = "Pass";

create view passed_student as
select name , email , percet from students
where result = "Pass";

select * from passed_student;

select name,email,percet from passed_student where name like "A%";





-- COMPLEX VIEWS 

create table doctor(
  d_id int primary key,
  d_name varchar(100),
  specialization varchar(100)
);

INSERT INTO doctor (d_id, d_name, specialization)
VALUES
(101, 'Dr. Aarav Mehta', 'Cardiologist'),
(102, 'Dr. Sneha Patil', 'Dermatologist'),
(103, 'Dr. Rohan Deshmukh', 'Neurologist'),
(104, 'Dr. Priya Kulkarni', 'Pediatrician'),
(105, 'Dr. Aditya Sharma', 'Orthopedic Surgeon'),
(106, 'Dr. Neha Joshi', 'Dentist'),
(107, 'Dr. Kiran Pawar', 'Gynecologist'),
(108, 'Dr. Manish Singh', 'ENT Specialist'),
(109, 'Dr. Kavita Nair', 'Psychiatrist'),
(110, 'Dr. Rahul Patankar', 'General Physician');

create table patient(
 p_id int primary key,
 name varchar(100),
 doctor_id int,
 foreign key(doctor_id) references doctor(d_id)
);

INSERT INTO patient (p_id, name, doctor_id)
VALUES
(201, 'Riya Sharma', 101),
(202, 'Aarav Patel', 104),
(203, 'Sneha Desai', 102),
(204, 'Rohan Jadhav', 106),
(205, 'Meera Pawar', 103),
(206, 'Tanmay Kulkarni', 101),
(207, 'Priya Chavan', 105),
(208, 'Aditya Joshi', 108),
(209, 'Neha Giri', 107),
(210, 'Sahil Kamat', 109),
(211, 'Ananya Shinde', 110),
(212, 'Karan Naik', 103),
(213, 'Divya Rane', 102),
(214, 'Vikram Patil', 105),
(215, 'Kavya Wagh', 101);

select p.p_id as patient_id , p.name as patient_name ,d.d_id doctor_id, d.d_name as doctor_name,d.specialization from patient p join doctor d 
on p.doctor_id = d.d_id;

create view patiend_doctor_view as 
select p.p_id as patient_id , p.name as patient_name ,d.d_id doctor_id, d.d_name as
doctor_name,d.specialization from patient p join doctor d 
on p.doctor_id = d.d_id;

select * from patiend_doctor_view;

drop view patiend_doctor_view;




-- MATERIALIZED VIEWS

CREATE table orders(
 order_id int primary key,
 order_date date,
 amount float
);

INSERT INTO orders (order_id, order_date, amount)
VALUES
(1, '2025-01-05', 1200.50),
(2, '2025-01-10', 899.99),
(3, '2025-01-15', 450.00),
(4, '2025-01-20', 2300.75),
(5, '2025-02-01', 1500.25),
(6, '2025-02-05', 760.40),
(7, '2025-02-10', 980.00),
(8, '2025-02-18', 640.30),
(9, '2025-03-01', 2130.60),
(10, '2025-03-05', 875.00),
(11, '2025-03-10', 1200.00),
(12, '2025-03-15', 1999.99),
(13, '2025-03-20', 1560.45),
(14, '2025-03-25', 680.75),
(15, '2025-04-01', 2500.00),
(16, '2025-04-05', 890.60),
(17, '2025-04-10', 770.25),
(18, '2025-04-15', 1450.80),
(19, '2025-04-20', 1950.10),
(20, '2025-04-25', 2100.00);





