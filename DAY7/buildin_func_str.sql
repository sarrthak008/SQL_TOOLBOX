
-- STRING FUNCTION IN MYSQL

CREATE DATABASE IF NOT EXISTS built_in_funcs;
USE built_in_funcs;

-- CONCAT()
SELECT CONCAT('sarthak','navale') ;
-- give table name as sarthak,navale

select concat('sarthak',' ','navale') as result;

-- 	LENGTH()

select length("sarthak") as result;

-- char_length()
select character_length("hello i am sarthak") as result;
select char_length("hello i am sarthak") as result;

-- LOWER() || LCASE()
select lower(" I AM SARTHAK & I LEARN SQL ") as result;
select lcase("I AM SARTHAK & I LEARN SQL ")  as result;

-- UPPER || UCASE
select upper("i am sarthak & i learn sql") as result;
select ucase("i am sarthak & i learn sql ")  as result;

-- SUBSTRING || SUBSTR
select substring("hello world",7,5) as result;
select substr("hello earth",1,5) as result;

-- TRIM()
select trim("  i love india  ") as result;

-- REPLACE
select replace("hello i am sarth","sarth","sarthak") as result;

-- INSTR()
select instr("I am good","am") as result;

-- REVERSE()
select reverse("sarthak") as result;

-- LPAD()  & RPAD()
select lpad("pratik",10,"@") as result;
select rpad("sarthak",10,"*") as result;

-- Nesting functions
select lpad(rpad("pratik",10,"*"),14,"@") as result;

-- LEFT() & RIGHT()

select left("sarthak",5) as result;
select right("samosa",3) as result;

-- LOCATE()
select locate("world","hello world") as result;

-- CONCAT_WS()
select concat_ws("/","2025","10","23") as result;
