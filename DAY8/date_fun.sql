create database math_func;
use math_func;

-- CURDATE()
select curdate() as today;
-- 2025-09-26

-- NOW()
select now() as result;
-- 2025-09-26 09:46:34

-- CURRENT_TIME()
select current_time() as currentTime;
-- 09-47-48

-- YEAR() / MONTH() / DAY()
select year("2025-09-27") as c_year;
select month("2025-09-27") as c_month;
select day("2025-09-27") as c_day;

-- DATE_ADD(date, INTERVAL X UNIT)
select date_add('2025-09-27',interval 2 DAY);

-- DATE_SUB(date,INTERVAL x UNIT);  -- substract date 
 select date_sub('2025-09-27',interval 2 MONTH);

-- DATEDIFF(date1,date2) -- give difference in days
 select datediff('2025-10-23',curdate()) as result;

-- ST_TO_DATE("2025-09-27","%d-%m-%Y") -- write capital Y for year
select str_to_date('2025-09-27','%Y-%m-%d') as result;

-- DATE_FORMAT(DATE,FORMAT) -- 
select date_format('2025-04-28',"%W,%M %D,%Y") as result;

-- LAST_DAY()
select last_day("2025-01-25") as result;

-- TIMESTAMPDIFF(UNIT,DATETIM1,DATETIME2) -> DIFF IN UNITS  - TIME / SEC,HOUE , DAY , MONTH,YEAR 
select timestampdiff(MONTH,'2025-01-01','2025-12-30') as result;

--  ADDDATE(DATE,INTERVAL DAYS)  -> SAME AS DATE_ADD()
select adddate('2025-01-01',interval 6 month);







