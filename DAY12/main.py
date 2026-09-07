from sales import calculate_order_total,calculate_tax,calculate_final_amount 


amount=calculate_order_total(700000, 10)
tax=calculate_tax(amount,0.18)
total=calculate_final_amount(amount,tax)

print(amount)
print(tax)
print(total)