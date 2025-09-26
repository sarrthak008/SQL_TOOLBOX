# 📘 SQL Day 8: Date and Time Functions

Today's lesson covers the essential **Date and Time functions** in MySQL. These functions are crucial for handling temporal data, from calculating age and filtering records by date ranges to formatting dates for reports.

---

## 1. 🕒 Getting the Current Date & Time

| Function | Description | Example |
| :--- | :--- | :--- |
| `CURDATE()` | Returns the current date as `'YYYY-MM-DD'`. | `SELECT CURDATE();` |
| `NOW()` | Returns the current date and time as `'YYYY-MM-DD HH:MM:SS'`. | `SELECT NOW();` |
| `CURRENT_TIME()` | Returns the current time as `'HH:MM:SS'`. | `SELECT CURRENT_TIME();` |

---

## 2. 🧩 Extracting Parts of a Date

You can easily pull specific components from a date value.

| Function | Description | Example |
| :--- | :--- | :--- |
| `YEAR(date)` | Extracts the year. | `SELECT YEAR('2025-09-27');` |
| `MONTH(date)` | Extracts the month (1-12). | `SELECT MONTH('2025-09-27');` |
| `DAY(date)` | Extracts the day of the month (1-31). | `SELECT DAY('2025-09-27');` |

---

## 3. 🗓️ Date Arithmetic

Performing calculations with dates is a common requirement.

#### `DATE_ADD()` and `DATE_SUB()`
These functions add or subtract a specified interval from a date.

**Syntax:**
`DATE_ADD(date, INTERVAL value unit)`
`DATE_SUB(date, INTERVAL value unit)`

The `unit` can be `DAY`, `MONTH`, `YEAR`, `HOUR`, `MINUTE`, `SECOND`, etc.

**Examples:**
```sql
-- Get the date 2 days from now
SELECT DATE_ADD('2025-09-27', INTERVAL 2 DAY);

-- Get the date 2 months ago
SELECT DATE_SUB('2025-09-27', INTERVAL 2 MONTH);
```

#### `DATEDIFF()`
Calculates the number of days between two dates (`date1` - `date2`).
```sql
-- Calculate the number of days between two dates
SELECT DATEDIFF('2025-10-23', '2025-09-27');
```

#### `LAST_DAY()`
Returns the last day of the month for a given date. This is very useful for end-of-month reports.
```sql
-- Find the last day of February 2025
SELECT LAST_DAY('2025-02-10'); -- Result: '2025-02-28'
```

---

## 4. 🔄 Formatting and Converting

#### `DATE_FORMAT(date, format)`
This is one of the most powerful functions, allowing you to display a date in any string format you need.

**Example:**
```sql
-- Format a date into a more readable string
SELECT DATE_FORMAT('2025-04-28', '%W, %M %D, %Y');
-- Result: 'Sunday, April 28th, 2025'
```

**Common Format Specifiers:**
- `%Y`: Year (e.g., 2025)
- `%y`: Year, 2-digit (e.g., 25)
- `%M`: Full month name (e.g., April)
- `%m`: Month as a number (01-12)
- `%D`: Day with suffix (e.g., 1st, 2nd)
- `%d`: Day of the month (01-31)
- `%W`: Full weekday name (e.g., Sunday)

#### `STR_TO_DATE(string, format)`
The inverse of `DATE_FORMAT`. It converts a string into a proper MySQL date value, provided you tell it the format of the input string.
```sql
-- Convert a string in 'YYYY-MM-DD' format to a date
SELECT STR_TO_DATE('2025-09-27', '%Y-%m-%d');
```
