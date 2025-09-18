 # 📘 SQL Day 4: Data Types & Foreign Keys

Today's lesson covers two fundamental concepts: **Data Types**, which define the kind of data a column can hold, and **Foreign Keys**, which create relationships between tables.

---

## 1. 🔢 Common SQL Data Types

A data type is a rule that specifies the type of data a column can store. Using the correct data type is crucial for data integrity and optimizing storage.

#### Example: `users` and `books` tables

Our `users` and `books` tables use several important data types:

```sql
CREATE TABLE users(
  user_id INT PRIMARY KEY AUTO_INCREMENT,
  username VARCHAR(100) NOT NULL,
  email VARCHAR(50) UNIQUE,
  phone_no BIGINT,
  is_valid BOOLEAN DEFAULT FALSE,
  address TEXT,
  birthdate DATE 
);

CREATE TABLE books(
  book_id INT PRIMARY KEY,
  book_name VARCHAR(255) NOT NULL,
  author VARCHAR(100),
  price DECIMAL(8,2),
  is_available BOOLEAN NOT NULL
);
```

| Data Type | Description | Example from our tables |
| :--- | :--- | :--- |
| `INT` | Whole numbers. | `user_id`, `book_id` |
| `VARCHAR(n)`| Variable-length string with a max length of `n`. | `username`, `email` |
| `TEXT` | For long-form text strings. | `address` |
| `BIGINT` | For very large whole numbers. | `phone_no` |
| `DECIMAL(p,s)`| Fixed-point number, ideal for currency. `p`=total digits, `s`=digits after decimal. | `price DECIMAL(8,2)` |
| `DATE` | Stores a date (YYYY-MM-DD). | `birthdate` |
| `BOOLEAN` | Stores `TRUE` or `FALSE` values. | `is_valid`, `is_available` |

---

## 2. 🔗 What is a Foreign Key?

A **Foreign Key** is a field (or collection of fields) in one table that uniquely identifies a row of another table. It's used to create a link between two tables and enforce rules about the data.

- The table containing the foreign key is the **child table**.
- The table containing the candidate key (usually a `PRIMARY KEY`) is the **parent table**.

This creates a **parent-child relationship** and ensures **referential integrity**.

#### Syntax
```sql
CREATE TABLE child_table (
    column1 datatype,
    ...
    FOREIGN KEY (child_column) REFERENCES parent_table(parent_column)
);
```

#### Example: Linking `purchase` to `users` and `books`

The `purchase` table links a user to a book they bought.
- `u_id` is a foreign key that references `user_id` in the `users` table.
- `b_id` is a foreign key that references `book_id` in the `books` table.

This means you can only insert a `purchase` record if the `u_id` and `b_id` already exist in the `users` and `books` tables, respectively.

```sql
CREATE TABLE purchase(
 transaction_id VARCHAR(12) PRIMARY KEY,
 b_id INT,
 u_id INT,
 FOREIGN KEY(b_id) REFERENCES books(book_id),
 FOREIGN KEY(u_id) REFERENCES users(user_id)
);
```

### ⚠️ Important Rule
A `FOREIGN KEY` must point to a column that is either a `PRIMARY KEY` or has a `UNIQUE` constraint in the parent table.

This is why the following code would fail, because `username` is not a primary key (though it could work if it were `UNIQUE`):

```sql
-- This will cause an error!
CREATE TABLE buys(
  b_id INT PRIMARY KEY,
  buyed_user VARCHAR(100),
  FOREIGN KEY(buyed_user) REFERENCES users(username) -- Fails because username is not a PRIMARY or UNIQUE key
);
```

---

### ✅ Summary of Concepts Learned

| Concept | Description |
| :--- | :--- |
| **Data Types** | Define the type of data for each column (`INT`, `VARCHAR`, `DATE`, etc.). |
| **Foreign Key** | A key used to link two tables together, enforcing referential integrity. |
| **Referential Integrity** | Ensures that relationships between tables remain consistent. You can't have a child record without a parent record. |

