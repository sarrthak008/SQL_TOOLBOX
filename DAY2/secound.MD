### DDL (Data Definition Language)

DDL commands are the foundation of your database's architecture. They are used to **define, modify, and remove database structures** like tables and indexes. Think of them as the blueprints for your data storage. These commands affect the *structure* of the database, not the data itself.

---

### 1. `CREATE`

The `CREATE` command builds new database objects. The most common use is `CREATE TABLE`, which defines a new table with its columns, data types, and constraints.

**Key Concepts in the Example:**
*   `AUTO_INCREMENT`: Automatically generates a unique number for each new row.
*   `PRIMARY KEY`: Uniquely identifies each record in the table. It must contain unique values and cannot contain NULL values.
*   `NOT NULL`: Ensures a column cannot have a NULL value.
*   `UNIQUE`: Ensures that all values in a column are different.
*   `DEFAULT CURRENT_TIMESTAMP`: Automatically sets the current date and time when a new row is created.

**Example:**

```sql
-- Creates a table to store information about countries
CREATE TABLE countries (
    country_id INT AUTO_INCREMENT PRIMARY KEY,
    country_code VARCHAR(10) NOT NULL UNIQUE,
    country_name VARCHAR(100) NOT NULL,
    population BIGINT,
    languages VARCHAR(200),
    added_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

To view the structure you just created, you use `DESCRIBE` (or `DESC`):

```sql
DESC countries;
```

---

### 2. `ALTER`

The `ALTER TABLE` command is used to modify the structure of an existing table. It's a versatile command for evolving your database schema without having to drop and recreate it.

**1. Add a New Column**
You can add new columns as your application's needs change.

```sql
-- Adds a column to store the name of the president or head of state
ALTER TABLE countries ADD COLUMN head_of_state VARCHAR(100);
```

**2. Modify a Column's Definition**
This allows you to change a column's data type, size, or constraints.

```sql
-- Increases the maximum length of the country_name
ALTER TABLE countries MODIFY COLUMN country_name VARCHAR(150) NOT NULL;
```

**3. Rename a Column**
You can change a column's name to be more descriptive or to match new naming conventions.

```sql
-- Renames the 'languages' column to 'official_languages'
ALTER TABLE countries RENAME COLUMN languages TO official_languages;
```

**4. Drop a Column**
This permanently removes a column and all its data from the table.

```sql
-- Removes the head_of_state column from the table
ALTER TABLE countries DROP COLUMN head_of_state;
```

---

### 3. `TRUNCATE`

The `TRUNCATE TABLE` command is used to **delete all rows** from a table quickly and efficiently.

*   It's much faster than `DELETE FROM table_name;` because it doesn't log each row deletion.
*   It resets any `AUTO_INCREMENT` counters back to their starting value (usually 1).
*   **Warning:** It removes all data without exception. You cannot use a `WHERE` clause.

**Example:**

```sql
-- Removes all records from the countries table
TRUNCATE TABLE countries;
```

---

### 4. `DROP`

The `DROP TABLE` command is the most destructive DDL command. It **completely removes the table structure and all of its data** from the database.

*   **Warning:** This action is permanent and cannot be easily undone. Use it with extreme caution!

**Example:**

```sql
-- Deletes the entire 'countries' table from the database
DROP TABLE countries;
```
