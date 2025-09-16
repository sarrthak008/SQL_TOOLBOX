create database college;

use college;

create table students(
   student_id int primary key,
   name varchar(100) not null,
   class varchar(50) not null,
   address varchar(200),
   added timestamp default current_timestamp
 );
 
 -- add a new column 
 
 -- ALTER TABLE....
 
 -- rename attribute name 
 alter table students rename column class_teacher to c_tacher;
 
 -- modify column  change data type varchar to the int 
 
 alter table students modify class int ;
 
 -- drop cloumn 
 alter table students drop column c_tacher;
 
 -- TRUNCATE TABLE -- delete all data from table...
 

 -- lets insert data in the table 
  desc students;
 
 insert into students(student_id,name,class,address)
   values(1,"sarthak",15,"morve"),
         (2,"siddhart",14,"morve,khandala"),
         (3,"krushna",13,"morve,pune"),
         (4,"pavan",12,"mumbai"),
         (5,"gurunath",11,"delhi"),
         (6,"tejas",10,"jammu"),
         (7,"limbaji",9,"kashmir");

select * from students;

-- delete one row from students tabel
delete from students where student_id = 1;

-- delete all data from students table 
truncate table students;

-- delete table 
drop table students;

-- delete database 
drop database college;

 
 
