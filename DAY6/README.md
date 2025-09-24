# 📘 SQL Day 6: Data Manipulation Language (DML)

Today's lesson focuses on **DML (Data Manipulation Language)**. These commands are used to manage and manipulate the data stored within your database tables. The core DML commands are `INSERT`, `UPDATE`, and `DELETE`.

---

## 1. ➕ `INSERT` Statement

The `INSERT` statement is used to add new rows (records) of data into a table.

#### Syntax
```sql
INSERT INTO table_name (column1, column2, ...)
VALUES (value1, value2, ...);
```

#### Example: Adding new cars
This query adds multiple new car records to the `cars` table.

```sql
INSERT INTO cars (car_model, car_color, car_price, purchase_date)
VALUES
    ('Fortuner', 'Black', 750000, '2026-03-11'),
    ('Verna', 'Black', 750000, '2027-04-18'),
    ('Defender', 'White', 300000, '2022-03-10');
```

---

## 2. ✏️ `UPDATE` Statement

The `UPDATE` statement is used to modify existing records in a table.

**⚠️ Important:** Always use a `WHERE` clause with `UPDATE`. If you omit it, **all rows in the table will be updated!**

#### Syntax
```sql
UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition;
```

#### Example: Changing a car's price
This query finds the car with the model 'Defender' and updates its price.
```sql
UPDATE cars 
SET car_price = 35000000 
WHERE car_model = 'Defender';
```

---

## 3. 🗑️ `DELETE` Statement

The `DELETE` statement is used to remove existing records from a table.

**⚠️ Important:** Just like `UPDATE`, always use a `WHERE` clause with `DELETE`. If you omit it, **all rows in the table will be deleted!**

#### Syntax
```sql
DELETE FROM table_name WHERE condition;
```

#### Example: Removing a car by its purchase date
```sql
DELETE FROM cars WHERE purchase_date = '2025-09-23';
```

---

## 🛡️ A Note on Safe Updates (`SQL_SAFE_UPDATES`)

MySQL has a "Safe Update Mode" (`SQL_SAFE_UPDATES=1`) that prevents you from running `UPDATE` or `DELETE` statements unless you specify which rows to modify using a key column in the `WHERE` clause (or provide a `LIMIT`). This is a safety feature to prevent accidental mass data changes.

If you need to update or delete based on a non-key column, you can temporarily disable this mode. It's a best practice to re-enable it afterward.

```sql
-- Disable safe update mode
SET SQL_SAFE_UPDATES = 0;

-- Your UPDATE or DELETE query here...
UPDATE cars SET car_color = 'White' WHERE car_id = 6;

-- Re-enable safe update mode
SET SQL_SAFE_UPDATES = 1;
```

---

### ✅ Summary of DML Concepts

| Keyword  | Description                               |
| :------- | :---------------------------------------- |
| `INSERT` | Adds new rows of data to a table.         |
| `UPDATE` | Modifies existing data within a table.    |
| `DELETE` | Removes rows of data from a table.        |
