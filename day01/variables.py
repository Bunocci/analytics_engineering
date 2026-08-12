# Day 1: Python Fundamentals - Variables & Data Types

#1. String
project_name = "Analytics Engineering Journey"
Target_date = "2026-10-31"

#2. Integer
days_until_deadline = 77

# Float
daily_hours = 5.0
current_progress = 0.0

#4. Boolean
is_on_track = True

#5. Printing variables
print(project_name)
print(f"Target:{Target_date}")
print(f"Days to go: {days_until_deadline}")
print(f"progress: {current_progress}%")
print(f"Daily commitment: {daily_hours} hours")
print(f"Am I on track? {is_on_track}")

#6. Arithmetic operators
product_price = 29.99
quantity = 3
tax_rate = 0.10
subtotal = product_price * quantity
tax_amount = subtotal * tax_rate
total_order  = subtotal + tax_amount

print("--- order Summary ---")
print(f"product price: ${product_price}")
print(f"quantity: {quantity}")
print(f"subtotal: ${subtotal}")
print(f"tax amount: ${tax_amount}")
print(f"total order: ${total_order}")
