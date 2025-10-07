use joins;

create table products(
p_id int primary key auto_increment,
p_name varchar(100),
p_price int 
);

insert into products(p_name,p_price)
 values("Maggy",60),
       ("tea powder",40),
       ("Sugar bag",100), 
       ("Wheat flour", 45),
      ("Cooking oil", 120),
      ("Salt packet", 25),
      ("Milk", 30),
      ("Bread", 35),
      ("Butter", 70),
      ("Cheese", 95),
      ("Eggs (dozen)", 85),
      ("Biscuits", 50),
      ("Cold drink", 65),
      ("Detergent", 150),
      ("Soap", 40),
      ("Shampoo", 110),
      ("Toothpaste", 90);
      
select * from products;
      
create table customers(
c_id int primary key,
c_name varchar(100),
buy_id int
);


insert into customers (c_id, c_name, buy_id) values
(1, 'Ramesh', 1),
(2, 'Suresh', 10),
(3, 'Priya', 12);

-- drop table customers;

-- joins without using foreign key 
select products.p_name ,customers.c_name 
from products left join customers on 
products.p_id = customers.buy_id;


select products.p_name ,customers.c_name 
from products inner join customers on 
products.p_id = customers.buy_id;

select products.p_name ,customers.c_name 
from products right join customers on 
products.p_id = customers.buy_id;




-- JOIN ON THREE TABLEs

create table students(
 roll_no int primary key,
 name varchar(100)
);

insert into students 
values(1,"Nisha"),
	  (2,"Poonam"),
	  (3,"Dipika"),
	  (4,"Vaishanavi");



create table teachers(
t_id int primary key,
t_name varchar(100)
);

insert into teachers 
values(111,"Rathi sir"),
      (112,"Patil sir"),
      (113,"Sathe Mam");


create table courses(
 c_id int primary key,
 c_name varchar(200),
 joined_student int,
 mentor int,
 foreign key(joined_student) references students(roll_no),
 foreign key(mentor) references teachers(t_id)
);


insert into courses
values(1001,"JAVA",1,113),
      (1002,"PYTHON",2,111),
      (1003,"NODE JS",3,112);

-- Using table aliases (s, c, t) and column aliases makes the query more readable.
select s.name as student_name, c.c_name as course_name, t.t_name as teacher_name 
from students s 
inner join courses c on s.roll_no = c.joined_student 
inner join teachers t on c.mentor = t.t_id;

select * from courses;
