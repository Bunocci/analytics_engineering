# JOURNEY_LOG_DAY12.md

# Analytics Engineering Journey — Day 12

## Topic
**Modules, Packages, pip, Virtual Environments & requirements.txt**

## Status
**COMPLETED ✅**

## Today's Goal

Today I learned how to organize Python code into reusable modules and how Python projects manage external dependencies.

The focus was not only on making code work, but on understanding how a real Python project is structured.

## 1. Python Modules

A **module** is a Python file (`.py`) containing reusable code such as functions, variables, or classes.

Example:

```text
sales.py
```

A module can contain reusable functions:

```python
def calculate_order_total(price, quantity):
    return price * quantity
```

Another Python file can import and use that function.

## 2. Importing From a Module

I practiced:

```python
from sales import calculate_order_total, calculate_tax, calculate_final_amount
```

My working structure was:

```text
day12_modules/
├── sales.py
└── main.py
```

The important architectural idea was:

```text
sales.py
    ↓
Reusable business logic
    ↓
main.py
    ↓
Program that uses the logic
```

## 3. Module Separation

I initially placed both the function definitions and importing code in the same file.

I learned that the purpose of modules is to separate responsibilities.

The improved structure was:

### sales.py

```python
def calculate_order_total(price, quantity):
    return price * quantity


def calculate_tax(amount, tax_rate):
    return amount * tax_rate


def calculate_final_amount(amount, tax):
    return amount + tax
```

### main.py

```python
from sales import calculate_order_total, calculate_tax, calculate_final_amount

amount = calculate_order_total(700000, 10)
tax = calculate_tax(amount, 0.18)
total = calculate_final_amount(amount, tax)

print(amount)
print(tax)
print(total)
```

The calculations produced:

```text
Order amount = 7,000,000
Tax = 1,260,000
Final amount = 8,260,000
```

## 4. Packages

A **package** is a way of organizing related Python modules into a project structure.

A larger project can separate responsibilities into modules such as:

```text
analytics_project/
├── src/
│   ├── cleaning.py
│   ├── analysis.py
│   └── validation.py
├── data/
├── main.py
└── requirements.txt
```

## 5. pip

`pip` is Python's package installer.

It allows external Python packages to be installed into a Python environment.

```text
Python project
      ↓
Needs external library
      ↓
pip install package
      ↓
Package becomes available
```

## 6. Virtual Environments

A virtual environment gives a project its own isolated Python package environment.

Conceptually:

```text
Project A
 └── Environment A
      ├── package X
      └── package Y

Project B
 └── Environment B
      ├── package X
      └── package Z
```

This prevents different projects from unnecessarily sharing the same installed dependencies.

## 7. requirements.txt

`requirements.txt` records the Python packages and versions required by a project.

A common workflow is:

```bash
pip freeze > requirements.txt
```

Another developer can recreate the environment with:

```bash
pip install -r requirements.txt
```

I successfully generated my `requirements.txt`.

## 8. Important Project Habit

The virtual environment itself should normally **not** be committed to GitHub.

Instead, commit the project source code and dependency information:

```text
GitHub
├── source code
├── data/sample data
├── requirements.txt
├── README.md
└── .gitignore
```

The environment can be recreated from `requirements.txt`.

## 9. Debugging / Learning Lesson

I learned an important difference between:

```text
Making code work
```

and:

```text
Structuring code correctly
```

The calculations in my sales program were correct, but putting reusable functions and importing logic in the same file defeated the purpose of creating a module.

I corrected the structure by separating:

```text
sales.py → reusable functions

main.py → application logic
```

## 10. Analytics Engineering Connection

This is directly relevant to future ETL and analytics projects.

A production-style Python pipeline will eventually contain separate responsibilities such as:

```text
extract.py
    ↓
clean.py
    ↓
transform.py
    ↓
validate.py
    ↓
load.py
    ↓
main.py
```

Instead of writing one huge script, each module can have a clear responsibility.

## 11. Current Python Progress

I have now practiced:

- Variables
- Conditional statements
- Loops
- Lists
- Tuples
- Sets
- Dictionaries
- Functions
- Function parameters
- Return values
- Function composition
- Strings
- Data cleaning
- File handling
- CSV
- JSON
- Exception handling
- `try`
- `except`
- `else`
- `finally`
- `raise`
- Modules
- Imports
- Packages
- pip
- Virtual environments
- requirements.txt

## 12. Learning Philosophy

I am deliberately focusing on:

> **Understanding rather than memorization.**

The goal is to understand why code works and to become capable of reconstructing solutions independently.

My learning process is:

```text
Learn
  ↓
Understand
  ↓
Attempt
  ↓
Get stuck
  ↓
Debug
  ↓
Fix
  ↓
Try again
  ↓
Build independently
```

Checking documentation or previous code is acceptable. The goal is to reduce dependence on it gradually.

## Day 12 Conclusion

**Day 12 completed successfully. ✅**

I can now create reusable Python modules, import functions between files, understand packages, install dependencies with pip, isolate project environments with virtual environments, and record dependencies using `requirements.txt`.
