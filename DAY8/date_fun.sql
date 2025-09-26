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

-- DATE_SUB(date,INTERVAL x UNIT);
 select date_sub('2025-09-27',interval 2 MONTH);

