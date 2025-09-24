create database dml;
use dml;

-- dml DATA MANUPLATION LANGUAGE .

-- INSERT
-- UPDATE
-- DELETE


-- 1. INSERT - used to insert values into table

create table cars(
  car_id int auto_increment primary key,
  car_model varchar(100) not null,
  car_color varchar(50) not null,
  car_prise bigint not null,
  purchese_date date
);

insert into cars(car_model,car_color,car_prise,purchese_date)
            values("Fortuner","Black",750000,'2026-03-11'),
				  ("Verna","Black",750000,'2027-04-18'),
                  ("Defendor","white",300000,'2022-03-10'),
                  ("Wagnor","Red",500000,'2028-07-01'),
                  ("BMW","Blue",275000,'2040-07-01'),
                  ("Creta","Black",500000,'2020-07-01'),
                  ("Thar","Blue",130000,'2023-07-01'),
                  ("Puch","gray",250000,'2020-07-01'),
                  ("Nexon","Black",375000,'2040-03-06'),
                  ("BMW x5","Voilate Blue",1300000,'2050-07-01');
                  

-- 2. UPDATE

update cars set car_prise = 35000000 where car_model =  "Defendor";
-- remove safe update error 

-- USE FOLLWING QUERY TO REMOVE SAFE UPDATE 
SET SQL_SAFE_UPDATES = 0 ;

update cars set car_prise = 35000000 where car_model =  "Defendor";

update cars set purchese_date = "2025-09-23" where car_model =  "Thar";

update cars set car_color = "white" where car_id = 6;


-- DELETE
delete from cars where purchese_date = "2025-09-23";

	-- AGAIN SET SAFE UPDATE TRUE ;
	SET SQL_SAFE_UPDATES = 1;

select * from cars;


create table Bikes(
 bike_id int auto_increment primary key,
 bike_name varchar(50) not null,
 engine_capacity varchar(50) not null,
 bike_color varchar(20) not null,
 owner_name varchar(50) not null
);

alter table Bikes add column prise int not null;

insert into Bikes(bike_name,engine_capacity,bike_color,owner_name,prise)
            values("Shine","120cc","Black","Krishna jagtap",150000),
            ("Pulsar","150cc","Red","Rohan Patil",135000),
			("Apache","160cc","Blue","Amit Shinde",142000),
			("Unicorn","150cc","Black","Suresh Pawar",128000),
            ("Splendor","100cc","Silver","Mahesh Deshmukh",85000),
            ("Dio","110cc","Yellow","Pranav Kulkarni",78000),
            ("Activa","125cc","White","Siddharth More",92000),
            ("Bullet","350cc","Green","Ajay Chavan",190000),
			("Jupiter","110cc","Gray","Rutuja Joshi",89000),
			("FZ","150cc","Orange","Tejas Mane",140000),
			("Access","125cc","Blue","Sneha Bhosale",87000);
            
update Bikes set owner_name = "Sarthak Navale" where owner_name = "Sneha Bhosale";

delete from Bikes where owner_name = "Sarthak Navale";

SET SQL_SAFE_UPDATES = 1;


