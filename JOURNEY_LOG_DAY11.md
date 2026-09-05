# JOURNEY_LOG_DAY11.md

# Day 11 — Python Exceptions & Robust Error Handling

## Status
**Completed**

## Today's Focus
Today I learned how to handle runtime errors and invalid data using Python exception handling.

Topics covered:
- `try`
- `except`
- `else`
- `finally`
- `raise`
- `ValueError`
- Robust validation of business/data inputs

---

## 1. What is an Exception?

An exception is an error that occurs while a Python program is running.

Examples:
- `ValueError` — a value has the wrong format/type for an operation
- `ZeroDivisionError` — attempting to divide by zero
- `FileNotFoundError` — trying to open a file that does not exist

Instead of allowing the whole program to crash, exceptions can be handled.

---

## 2. try and except

Basic pattern:

```python
try:
    # code that might fail
except ValueError:
    # handle the error
```

Example:

```python
for order in orders:
    try:
        quantity = int(order["quantity"])
    except ValueError:
        print(f"Order {order['order_id']}: Invalid quantity")
```

The important idea is:

> Put the operation that might fail inside `try`, then handle the expected error in `except`.

---

## 3. Why int() Can Raise ValueError

When converting strings to integers:

```python
int("5")
```

works.

But:

```python
int("five")
```

raises a `ValueError`.

This means Python itself can detect certain invalid input.

---

## 4. else

The `else` block runs only when the `try` block succeeds.

```python
try:
    quantity = int(order["quantity"])
except ValueError:
    print("Invalid quantity")
else:
    print(f"Valid quantity = {quantity}")
```

Mental model:

```text
try
 ├── success → else
 └── error   → except
```

The `else` block keeps successful processing separate from error handling.

---

## 5. finally

The `finally` block runs whether an exception occurs or not.

```python
try:
    quantity = int(order["quantity"])
except ValueError:
    print("Invalid quantity")
else:
    print(f"Valid quantity = {quantity}")
finally:
    print("Validation complete")
```

Key lesson:

> `finally` always runs.

It is especially useful for cleanup operations such as closing files or releasing resources.

---

## 6. raise

Python can raise an exception automatically, but a programmer can deliberately raise one when business rules are violated.

```python
quantity = int(order["quantity"])

if quantity < 0:
    raise ValueError("Quantity cannot be negative")
```

Here, `-3` is technically a valid integer, but it is invalid according to the business rule.

This gives two types of validation:

### Technical validation
Can Python perform the operation?

```python
int("five")
```

No → `ValueError`

### Business validation
Is the value acceptable for the application?

```python
quantity = -3
```

Technically valid integer, but invalid order quantity → `raise ValueError(...)`

---

## 7. Capturing the Error

An exception can be captured using:

```python
except ValueError as error:
```

The variable `error` contains the exception message.

Example:

```python
except ValueError as error:
    print(f"Invalid quantity: {error}")
```

This produces a more useful error message.

---

## 8. Practical Exercise

I worked with order data:

```python
orders = [
    {"order_id": 3001, "quantity": "5"},
    {"order_id": 3002, "quantity": "-3"},
    {"order_id": 3003, "quantity": "ten"},
    {"order_id": 3004, "quantity": "2"}
]
```

The logic was:

1. Loop through each order.
2. Convert the quantity to an integer.
3. Raise `ValueError` if the quantity is negative.
4. Catch `ValueError`.
5. Use `else` for valid quantities.
6. Use `finally` to indicate validation is complete.



## 9. Debugging Lessons

### Mistake 1: Checking the type after conversion

I initially tried:

```python
quantity = int(order["quantity"])

if quantity is not int:
```

This was incorrect because the conversion itself can fail before the `if` is reached.

Correct approach:

```python
try:
    quantity = int(order["quantity"])
except ValueError:
    ...
```

### Mistake 2: Printing successful output inside both try and else

I initially put the success `print()` inside `try` and also inside `else`, causing valid orders to be printed twice.

Correct approach:

```python
try:
    quantity = int(order["quantity"])
except ValueError:
    ...
else:
    print(...)
```

### Mistake 3: Incorrect message in except

I initially printed `"valid quantity"` inside `except`.

I learned that `except` is specifically for the failure path.

### Mistake 4: Not capturing the exception

I learned to use:

```python
except ValueError as error:
```

so the actual error message can be displayed.


## 11. Why This Matters for Analytics Engineering

Real data is messy.

Examples:
- quantity stored as `"five"`
- negative quantities
- missing values
- invalid dates
- malformed files
- unexpected data types
- unavailable files
- broken API responses

A production data pipeline should not blindly assume every record is valid.

Exception handling helps pipelines:
- detect bad data
- prevent unexpected crashes
- provide meaningful error messages
- separate valid records from invalid records
- enforce business rules
- make debugging easier

Broader pipeline pattern:

```text
RAW DATA
   ↓
READ
   ↓
VALIDATE
   ↓
HANDLE ERRORS
   ↓
CLEAN DATA
   ↓
TRANSFORM
   ↓
ANALYZE
```

---

## 12. Current Learning Progress

So far I have covered:

- Variables and basic Python syntax
- Conditional statements
- Loops
- Lists
- Tuples
- Sets
- Dictionaries
- Functions
- Strings
- Data cleaning
- File handling
- CSV
- JSON
- Exceptions and robust error handling

I am deliberately focusing on **understanding rather than memorization**.

I am also practicing solving exercises without immediately looking back at previous code.

---

## 13. Important Learning Insight

Needing to check previous code is normal at this stage.

The goal is not to memorize 100+ lines of Python.

The goal is to understand programming patterns well enough to reconstruct solutions.

The progression is:

```text
Recognition
    ↓
Assisted Recall
    ↓
Independent Recall
    ↓
Independent Problem Solving
```

I am currently moving from assisted recall toward independent recall.

My learning strategy:

```text
Learn
  ↓
Practice with guidance
  ↓
Attempt from memory
  ↓
Get stuck
  ↓
Debug
  ↓
Try again
  ↓
Build independently
```

---

## Day 11 Conclusion

**Day 11 completed successfully.**

I now understand the purpose and basic use of:

```python
try
except
else
finally
raise
```

I also understand the difference between Python-generated errors and business-rule validation.

Most importantly, I practiced writing the solutions myself instead of simply copying completed examples.
