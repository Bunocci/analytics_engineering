# Day 1 (Extended): Order Eligibility Checker
#Using if/elif/else and logical operators

#sample order data
order_total  = 75.00
is_vip = True

print("--- Order Eligibility Checker ---")
print(f"Order Total: ${order_total:.2f}")
print(f"VIP Status: {is_vip}")

#check eligibility
if order_total > 100.00 or is_vip:
    print("Eligible for free shipping!")
elif order_total > 50.00 and is_vip:
    print("Eligible for a 10% discount")
else:
    print("Standard shipping rates apply. No discount")

print("Thank you for shopping with us!")