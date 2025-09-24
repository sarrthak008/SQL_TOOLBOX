# 📘 SQL Day 7: Built-in String Functions

Today's lesson explores the powerful built-in **string functions** in MySQL. These functions allow you to manipulate, format, and analyze text data directly within your SQL queries.

---

## 1. 🔗 Concatenation Functions

#### `CONCAT()`
Joins two or more strings together into a single string.

```sql
-- Result: 'sarthak navale'
SELECT CONCAT('sarthak', ' ', 'navale') AS full_name;
```

#### `CONCAT_WS()`
Stands for "Concatenate With Separator". It joins strings with a specified separator as the first argument.

```sql
-- Result: '2025/10/23'
SELECT CONCAT_WS('/', '2025', '10', '23') AS formatted_date;
```

---

## 2. 📏 Length Functions

#### `LENGTH()` and `CHAR_LENGTH()`
-   `LENGTH()` returns the length of a string in bytes.
-   `CHAR_LENGTH()` (or `CHARACTER_LENGTH()`) returns the number of characters in a string. This is often more intuitive, especially with multi-byte character sets.

```sql
-- Result: 18
SELECT CHAR_LENGTH('hello i am sarthak') AS character_count;
```

---

## 3. 🔠 Case Conversion Functions

#### `UPPER()` / `UCASE()`
Converts a string to all uppercase letters.

```sql
-- Result: 'I AM LEARNING SQL'
SELECT UPPER('i am learning sql') AS result;
```

#### `LOWER()` / `LCASE()`
Converts a string to all lowercase letters.

```sql
-- Result: 'i am learning sql'
SELECT LOWER('I AM LEARNING SQL') AS result;
```

---

## 4. ✂️ Substring and Extraction Functions

#### `SUBSTRING()` / `SUBSTR()`
Extracts a portion of a string. The arguments are `(string, start_position, length)`.

```sql
-- Result: 'world'
SELECT SUBSTRING('hello world', 7, 5) AS result;
```

#### `LEFT()` and `RIGHT()`
Extracts a specified number of characters from the left or right side of a string.

```sql
-- Result: 'sarth'
SELECT LEFT('sarthak', 5) AS result;

-- Result: 'osa'
SELECT RIGHT('samosa', 3) AS result;
```

---

## 5. 🛠️ Formatting and Utility Functions

| Function | Description | Example | Result |
| :--- | :--- | :--- | :--- |
| `TRIM()` | Removes leading and trailing spaces. | `SELECT TRIM('  hello  ')` | `'hello'` |
| `REPLACE()` | Replaces all occurrences of a substring. | `SELECT REPLACE('hello sarth', 'sarth', 'sarthak')` | `'hello sarthak'` |
| `REVERSE()` | Reverses the characters in a string. | `SELECT REVERSE('sarthak')` | `'kahtras'` |
| `LPAD()` | Pads the left side of a string with another string. | `SELECT LPAD('pratik', 10, '@')` | `'@@@@pratik'` |
| `RPAD()` | Pads the right side of a string with another string. | `SELECT RPAD('sarthak', 10, '*')` | `'sarthak***'` |
| `INSTR()` | Returns the starting position of a substring. | `SELECT INSTR('I am good', 'am')` | `3` |
| `LOCATE()` | Similar to `INSTR()`, but with arguments reversed. | `SELECT LOCATE('world', 'hello world')` | `7` |

---

### ✅ Summary of String Functions

| Keyword | Description |
| :--- | :--- |
| `CONCAT()` | Joins strings together. |
| `CHAR_LENGTH()` | Gets the number of characters in a string. |
| `UPPER()` / `LOWER()` | Changes the case of a string. |
| `SUBSTRING()` | Extracts a part of a string. |
| `TRIM()` | Removes leading/trailing whitespace. |
| `REPLACE()` | Finds and replaces a substring. |
| `REVERSE()` | Reverses a string. |
| `LPAD()` / `RPAD()` | Adds padding to a string. |

