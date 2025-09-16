use mydb;

-- DDL (DATA DEFINATION LANGUGAE) 
-- use to define ,modify,& remove database structure like tables ,schema,indexes etc . 
-- DDL changes the structure of the database rather than its data . 

-- CREATE  -Used to create a database , tables , View etc

create table countries(
 country_id int auto_increment,
 coutry_code int primary key,
 name varchar(50) not null,
 population bigint,
 languages varchar(200),
 addded_date timestamp default current_timestamp    
);

desc countries;

-- add  new coloumn  
-- alter table
alter table countries add column preseident varchar(100) not null;

-- change datatype
-- unable to modify primary key 
-- alter table countries modify column coutry_code varchar(100);
 alter table countries modify name varchar(100);

-- RENAME TABLE NAME
alter table countries rename column name to country_name;
desc countries;

-- DELTE OR DROP COLUMN 
alter table countries drop column presedient;

-- alter table countries add column presedient varchar(100) not null;


-- insert values  
insert into countries(coutry_code,country_name,population,languages) 
values("+01","America",500000,"english,french"),
	  ("+21","Pakistan",175000,"urdu, french"),
      ("+31","Japan",350000,"English,French,Japanese"),
      ("+41","Bhutan",23892,"Hindi,Urdu"),
      ("+42","shrilaka",2389289,"Hindi,Urdu,sanskrit");
	
select * from countries;

-- delete signle row 
delete from countries where country_id = 1;

-- delete all data from table 
truncate table countries;

-- drop or delete table from database
drop table countries;


