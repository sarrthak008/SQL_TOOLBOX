USE built_in_funcs;
-- MATH FUNCTIONS 

-- ABS()
SELECT ABS(-11) AS result;

-- CEIL() || CELING()
-- give op as a next int 
SELECT CEIL(10.04) AS result;
SELECT CEILING(11.90) AS result;

-- FLOOR()
-- give an small nearest value 
SELECT FLOOR(4.99) AS result;

-- ROUND(x,d) -> round to d decimal places 
SELECT ROUND(2.701212, 3) AS result;

-- MOD() modulus 
SELECT MOD(10, 3) AS result;

-- POWER(x,y) || POW()

SELECT POWER(10, 5) AS result;
SELECT POW(12, 7) AS result;

-- SQRT(x) -- squrt root
SELECT SQRT(25) AS result;

-- RAND()
SELECT FLOOR(RAND() * 1000) AS result;

-- SIGN(x) -> Sign of a number 
 --  -1 if negative
 --  0 if zero 
 --  1 if positive
 
SELECT SIGN(-12) AS result;
SELECT SIGN(20) AS result;

-- TRUNCATE()
SELECT TRUNCATE(10.2323, 1) AS result;

-- PI()
SELECT PI() AS result;

-- Trigonometric Functions (SIN, COS, TAN, COT, etc.)
SELECT COT(PI()/2) AS result;
SELECT COS(PI()/2) AS result;
