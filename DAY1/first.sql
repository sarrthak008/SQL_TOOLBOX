-- SEE DATABASES;
show databases;

-- create database;
create database mydb;  

-- use datbase
use mydb;

-- table creation
-- syntax
-- create table table_name(
--  attr1 datatype constraints,
--  attr2 datatype 
--  .
--  .
--  .
-- );

-- create user table

create table user(
user_no int primary key,
name varchar(100),
age tinyint not null,
location varchar(100),
user_bio text 
);

-- describe table
describe user;
desc user;

-- insert data into table
-- syntax 
 
 insert into user(user_no,name,age,location,user_bio)values(1,"sarthak",21,"pune","hello i am sarthak");
 
 insert into user(user_no,name,age,location,user_bio)
 values(2,"krushna",21,"pune","hello i am krushna"),
       (3,"prathmesh",24,"nagpur","hello i am prthmesh"),
       (4,"vaibhav",21,"pune","hello i am vaibhav");
 
 insert into user values(5,"jaydeep",21,"pune","hello i am jaydeep"),
						(6,"avinash",21,"pune","hello i am avinash"),
                        (7,"pratik",21,"mumbai","hello i am pratik");
 select * from user;

