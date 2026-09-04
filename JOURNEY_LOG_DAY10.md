# JOURNEY LOG — DAY 10

## Topic
**File Handling, CSV, JSON & Basic Data Pipelines**

## Goal
Learn how Python reads data from files, converts raw data into useful Python structures, performs calculations, and writes results back to files.

## 1. Text File Handling

Learned how to work with text files using `open()`.

### Reading

```python
with open("products.txt", "r") as file:
    content = file.read()
    print(content)
```

### Writing

```python
with open("report.txt", "w") as file:
    file.write("Daily Sales Report\n")
    file.write("Total orders: 5\n")
    file.write("Total Revenue: 7500000\n")
```

### File modes

- `r` — read
- `w` — write/overwrite
- `a` — append

Using `with open(...) as file:` is preferred because Python automatically closes the file.

## 2. CSV Files

Learned that CSV files are commonly used for tabular data.

```python
import csv

with open("orders.csv", "r") as file:
    reader = csv.DictReader(file)
    orders = []

    for row in reader:
        order = {
            "order_id": int(row["order_id"]),
            "product": row["product"],
            "quantity": int(row["quantity"]),
            "price": float(row["price"])
        }
        orders.append(order)
```

Important: CSV values are initially strings, so numeric fields must be converted with `int()` or `float()`.

## 3. Reusable Functions With File Data

Built:

```python
def calculate_order_total(order):
    order_total = order["quantity"] * order["price"]
    return order_total
```

And:

```python
def calculate_total_revenue(orders):
    total_revenue = 0

    for order in orders:
        total_revenue += calculate_order_total(order)

    return total_revenue
```

Key lesson: write logic once and reuse it through functions.

## 4. JSON Files

JSON is commonly used for storing and exchanging structured data.

### Writing

```python
import json

with open("orders.json", "w") as file:
    json.dump(orders, file, indent=4)
```

### Reading

```python
with open("orders.json", "r") as file:
    orders = json.load(file)
```

Important: `json.dump()` writes to the file and returns `None`.

Incorrect:

```python
orders = json.dump(orders, file)
```

Correct:

```python
json.dump(orders, file, indent=4)
```

## 5. JSON Analysis Output

Created:

```python
analysis = [{
    "order total": total,
    "total revenue": final_total
}]

with open("analysis.json", "w") as file:
    json.dump(analysis, file, indent=4)
```

This uses calculated variables instead of hardcoded results.

## 6. Data Analysis Results

For the JSON exercise:

- Laptop: `2 × 2,500,000 = 5,000,000`
- Mouse: `2 × 50,000 = 100,000`
- Keyboard: `5 × 150,000 = 750,000`
- **Total Revenue = 5,850,000**
- First order total = **5,000,000**

## 7. Basic Data Pipeline

Today's major concept:

```text
FILE
  ↓
RAW DATA
  ↓
READ
  ↓
CONVERT
  ↓
PYTHON LISTS / DICTIONARIES
  ↓
FUNCTIONS
  ↓
ANALYZE
  ↓
RESULTS
  ↓
JSON OUTPUT
```

This is the beginning of real data-pipeline thinking.

## 8. Debugging Lessons

### DictReader vs writing
`csv.DictReader()` is for reading CSV files. `csv.DictWriter()` is appropriate for writing CSV data.

### json.dump()
Do not assign the result of `json.dump()` back to your variable.

### Variables vs structures
An order total is a number, while an order is a dictionary. Comparisons must use compatible values.

## 9. Analytics Engineering Relevance

Today's work introduced:

- Raw data ingestion
- Data type conversion
- Data transformation
- Reusable business logic
- Structured outputs
- CSV and JSON sources
- Basic pipeline thinking

Long-term:

```text
SOURCE DATA
    ↓
INGEST
    ↓
CLEAN
    ↓
TRANSFORM
    ↓
STORE
    ↓
TEST
    ↓
ANALYZE
    ↓
REPORT
```

These concepts will later connect with SQL, databases, Git/GitHub, dbt, data warehouses, orchestration and production pipelines.

## 10. Day 10 Status

**COMPLETED **

Skills practiced:

- [x] `open()`
- [x] Reading/writing/appending files
- [x] `with open(...)`
- [x] CSV and `csv.DictReader`
- [x] Data type conversion
- [x] JSON, `json.load()`, `json.dump()`
- [x] Functions with file data
- [x] Revenue calculations
- [x] Basic data pipeline thinking

## Next: DAY 11

**Exceptions & Robust Error Handling**

Topics:

- `try`
- `except`
- `else`
- `finally`
- `raise`
- Invalid user input
- Missing files
- Invalid data
- Meaningful errors
- Reliable data pipelines