# JOURNEY_LOG_DAY09.md

# Analytics Engineering Journey — Day 09

## Topic
**Advanced Python Strings & Data Cleaning with Dictionaries**

## Goal
Today focused on using Python strings, dictionaries, lists, cleaning, normalization, and validation to transform messy customer data into cleaner analytical data.

## What I Learned

### 1. Removing whitespace

```python
name = "  Bruno Kato  "
clean_name = name.strip()
```

`.strip()` removes leading and trailing whitespace.

### 2. Standardizing capitalization

Practiced:

```python
.lower()
.upper()
.title()
```

Examples:

```python
city = " KAMPALA "
city = city.strip().lower()

name = "bruno kato"
name = name.title()
```

### 3. Handling multiple spaces

For messy names such as:

```text
"  david   okello  "
```

I learned:

```python
name = " ".join(name.strip().split()).title()
```

This removes unnecessary spaces and standardizes capitalization.

### 4. Cleaning dictionary records

I built:

```python
def clean_customer(customer):
    name = " ".join(customer["name"].strip().split()).title()
    email = customer["email"].strip().lower()
    city = customer["city"].strip().lower()

    cleaned_customer = {
        "customer_id": customer["customer_id"],
        "name": name,
        "email": email,
        "city": city
    }

    return cleaned_customer
```

This reinforced the pattern:

**RAW RECORD → CLEAN RECORD**

### 5. Cleaning an entire dataset

```python
def clean_customers(customers):
    cleaned_customers = []

    for customer in customers:
        cleaned_customer = clean_customer(customer)
        cleaned_customers.append(cleaned_customer)

    return cleaned_customers
```

I learned how to apply a transformation function to every dictionary in a list.

### 6. Email validation

I created:

```python
def is_valid_email(email):
    if "@" in email and "." in email:
        return True
    else:
        return False
```

I integrated the result into the cleaned customer record:

```python
if is_valid_email(email):
    email_status = "valid"
else:
    email_status = "invalid"
```

### 7. Function order

I learned that Python executes code from top to bottom. A function such as `is_valid_email()` should be defined before code attempts to call it.

Otherwise, Python can raise a `NameError`.

### 8. Dictionary syntax

I debugged a missing-comma error:

Incorrect:

```python
{
    "city": city
    "email_status": email_status
}
```

Correct:

```python
{
    "city": city,
    "email_status": email_status
}
```

## Data-Cleaning Pipeline

I learned to think about cleaning as:

```text
RAW DATA
   ↓
CLEAN
   ↓
NORMALIZE
   ↓
VALIDATE
   ↓
TRANSFORM
   ↓
ANALYZE
```

Example target record:

```python
{
    "customer_id": 101,
    "name": "Bruno Kato",
    "email": "bruno@gmail.com",
    "city": "kampala",
    "email_status": "valid"
}
```

## Debugging Lessons

I corrected:

- Calling `cleaned_customer()` instead of `clean_customer()`
- Using a nonexistent `.titlelower()` method
- Missing commas in dictionaries
- Incorrect indentation when processing lists
- Understanding that function definitions must exist before calls are executed

## Analytics Engineering Connection

Real source data is often messy. It can contain:

- inconsistent capitalization
- unnecessary whitespace
- inconsistent formatting
- invalid values
- missing values
- duplicate-looking values

Data must often be cleaned and validated before it can be trusted for reporting, dashboards, transformations, or business analysis.

Today's work introduced the mindset behind a data-cleaning pipeline.

## Current Python Progress

I have now practiced:

- Variables
- Conditions
- Loops
- Lists
- Tuples
- Sets
- Dictionaries
- Functions
- Parameters
- Return values
- Function composition
- String manipulation
- `.strip()`
- `.lower()`
- `.upper()`
- `.title()`
- `.split()`
- `.join()`
- String validation
- Dictionary transformation
- List-of-dictionary processing
- Basic data cleaning
- Basic data validation
- Debugging Python errors

## Key Lesson

> **Good analytics starts with trustworthy data.**

Before calculating revenue, building dashboards, creating models, or writing SQL transformations, the underlying data needs to be understood, cleaned, validated, and standardized.

## Next Step — Day 10

**File Handling & Real Data**

Topics:

- Reading files
- Writing files
- CSV files
- JSON files
- Python's `csv` module
- Python's `json` module
- Reading orders from CSV
- Reading orders from JSON
- Converting file data into Python dictionaries
- Analyzing orders loaded from files
- Calculating revenue
- Finding top products
- Writing analysis results back to files

This is the next major step from manually created Python data toward working with external datasets.
