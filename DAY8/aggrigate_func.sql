use mydb;

-- COUNT()
 select count(*) as total_emp from employee;
 
 -- SUM()
 select sum(salary) as total_salary from employee;
 
 -- AVG()
 select avg(salary) as avg_salary from employee;
 
 -- MIN() & MAX()
select min(salary) as mim from employee;
select max(salary) as max from employee;

-- GROUP BY()
select dept_name ,count(*) as num_emp  from employee group by dept_name;
select dept_name , avg(salary) as avg_sal from employee group by dept_name;
 
 -- GROUP_CONCT()
select dept_name, group_concat(emp_name) from employee group by dept_name;
 
 
 -- GROUP BY clause with having 
 
 select dept_name ,avg(salary) as avg_salary from employee group by dept_name having avg(salary)<50000.00;
 
 select dept_name,count(*) as emp_count from employee group by dept_name having count(*) <10;
 