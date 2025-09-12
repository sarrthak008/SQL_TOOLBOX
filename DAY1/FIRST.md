# 📘 SQL Basics – Day 1

This file explains the key SQL topics learned today with **syntax and examples**.  
Practiced on **MySQL Workbench** and **TiDB**.

---

## 1. 🔍 Show Databases
Used to list all available databases in the SQL server.

```sql
SHOW DATABASES;

```


## 2. 🗄️ Create a Database
Creates a new database to store tables.

```sql
CREATE DATABASE mydb;

```
## 3. 📂 Use a Database
Selects the database you want to work on.

```sql
USE mydb;

```

## 4.📋 Create Table

A table stores data in rows and columns.

```sql
--General Syntax: 
CREATE TABLE table_name (
    column1 datatype constraints,
    column2 datatype,
    ...
);

```

#### Example: Create user table

```sql 
CREATE TABLE user (
    user_no INT PRIMARY KEY,
    name VARCHAR(100),
    age TINYINT NOT NULL,
    location VARCHAR(100),
    user_bio TEXT
);

 ```

## 5. 🧐 Describe Table

Used to check table structure (columns, data types, constraints).

```sql 
DESCRIBE user;
-- or
DESC user;

```

## 6. ✍️ Insert Data into Table

Used to add rows (records) into a table.

```sql 
---Syntax:
INSERT INTO table_name (column1, column2, ...)
VALUES (value1, value2, ...);
```

### Example 1: Insert single record

```sql 
INSERT INTO user (user_no, name, age, location, user_bio)
VALUES (1, "sarthak", 21, "pune", "hello i am sarthak");
```

### Example 2: Insert multiple records

```sql 
INSERT INTO user (user_no, name, age, location, user_bio)
VALUES
    (2, "krushna", 21, "pune", "hello i am krushna"),
    (3, "prathmesh", 24, "nagpur", "hello i am prthmesh"),
    (4, "vaibhav", 21, "pune", "hello i am vaibhav");

```

### Example 3: Insert without specifying column names
(must follow table column order)

```sql
INSERT INTO user
VALUES
    (5, "jaydeep", 21, "pune", "hello i am jaydeep"),
    (6, "avinash", 21, "pune", "hello i am avinash"),
    (7, "pratik", 21, "mumbai", "hello i am pratik");
```

## 7. 🔍 Select Data

Used to retrieve and display table records.

```sql
SELECT * FROM user;

```

* →  *selects all columns.

* Can also select specific columns:

```sql
SELECT name, location FROM user;
```


✅ Summary of Concepts Learned

```
SHOW DATABASES → list all databases

CREATE DATABASE → create a new database

USE → select database

CREATE TABLE → design table with columns and constraints

DESCRIBE / DESC → view table structure

INSERT INTO → insert single or multiple rows

SELECT → display records

```
