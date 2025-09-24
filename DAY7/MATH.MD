# 📘 SQL Day 7: Built-in Math Functions

This guide covers the common built-in **numeric (math) functions** in MySQL. These functions are essential for performing calculations directly within your SQL queries.

---

## 1. 🔄 Rounding and Truncating Functions

| Function | Description | Example | Result |
| :--- | :--- | :--- | :--- |
| `CEIL()` / `CEILING()` | Rounds a number **up** to the nearest integer. | `SELECT CEIL(10.04);` | `11` |
| `FLOOR()` | Rounds a number **down** to the nearest integer. | `SELECT FLOOR(4.99);` | `4` |
| `ROUND(x, d)` | Rounds a number `x` to `d` decimal places. | `SELECT ROUND(2.7012, 2);` | `2.70` |
| `TRUNCATE(x, d)` | Truncates a number `x` to `d` decimal places without rounding. | `SELECT TRUNCATE(10.2383, 2);` | `10.23` |

---

## 2. 🧮 Arithmetic Functions

| Function | Description | Example | Result |
| :--- | :--- | :--- | :--- |
| `ABS(x)` | Returns the absolute (non-negative) value of `x`. | `SELECT ABS(-11);` | `11` |
| `MOD(x, y)` | Returns the remainder of `x` divided by `y` (modulo). | `SELECT MOD(10, 3);` | `1` |
| `POWER(x, y)` / `POW(x, y)` | Returns `x` raised to the power of `y`. | `SELECT POWER(10, 2);` | `100` |
| `SQRT(x)` | Returns the square root of `x`. | `SELECT SQRT(25);` | `5` |
| `SIGN(x)` | Returns the sign of `x` (-1 for negative, 0 for zero, 1 for positive). | `SELECT SIGN(-12);` | `-1` |

---

## 3. 🎲 Other Useful Functions

#### `RAND()`
Returns a random floating-point value between 0 (inclusive) and 1 (exclusive). You can combine it with other functions to generate random integers within a range.

```sql
-- Generate a random integer between 0 and 999
SELECT FLOOR(RAND() * 1000) AS random_number;
```

#### `PI()`
Returns the value of PI (π).

```sql
-- Result: 3.141593
SELECT PI();
```

---

## 4. 📐 Trigonometric Functions

SQL also supports standard trigonometric functions. They operate with radians.

```sql
-- Cosine of PI/2 (which is 0)
SELECT COS(PI()/2);

-- Cotangent of PI/2 (which is also close to 0)
SELECT COT(PI()/2);
```

---

### ✅ Summary of Math Functions

| Keyword | Description |
| :--- | :--- |
| `ABS()` | Returns the absolute value. |
| `CEIL()` | Rounds up to the nearest integer. |
| `FLOOR()` | Rounds down to the nearest integer. |
| `ROUND()` | Rounds to a specified number of decimal places. |
| `MOD()` | Returns the remainder of a division. |
| `POWER()` | Raises a number to the power of another. |
| `SQRT()` | Calculates the square root. |
| `RAND()` | Generates a random number. |
| `SIGN()` | Returns the sign of a number. |
| `TRUNCATE()`| Cuts off decimal places without rounding. |

