# JOURNEY LOG — DAY 07

## Analytics Engineering / Junior Data Engineering Journey

**Day:** 07  
**Focus:** Python Functions — Business Logic & Mini E-Commerce Project  
**Status:** Completed ✅

---

# 1. Day 07 Objective

Today's goal was to move beyond basic function syntax and learn how to use functions to solve realistic business problems.

The focus was on:

- Reusable functions
- Function composition
- Passing lists and dictionaries into functions
- Returning calculated values
- Calling one function from another
- Processing e-commerce orders
- Calculating revenue
- Calculating discounts
- Applying product-specific discounts
- Calculating tax
- Finding the top-performing product

---

# 2. Concepts Learned
Create functions
Use parameters
Return values
Call functions
Pass lists into functions
Pass dictionaries into functions
Loop through lists of dictionaries
Match records using IDs
Reuse functions
Build calculations from multiple functions
Calculate order totals
Calculate total revenue
Calculate discounts
Apply product-specific discounts
Calculate tax
Calculate final amounts
Find the highest-revenue product
Debug function logic

## 2.1 Function debugging lessons
Encountered and corrected several mistakes involving:

Incorrect dictionary keys
Confusing orders with order
Treating variables as functions
Incorrect accumulation
Assigning a product before comparing its revenue
Forgetting to initialize tracking variables
Calling functions with the wrong arguments

## 2.2 Function Reuse

Instead of repeatedly writing the same calculation, a function can be created once and reused.

Example:

```python
def calculate_discount(amount, discount_rate):
    return amount * discount_rate