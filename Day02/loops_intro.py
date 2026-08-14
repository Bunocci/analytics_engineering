# Day 2: for_Loops

# 1. print 'Hello' 3 times using a for loop
print("Example 1: print 'Hello' 3 times using a for loop:")
for i in range(3):
    print("Hello")

#range(start, stop, step)
# 2. Count from 1 to 5
print("counting 1 to 5:")
for i in range(1, 6):
    print(f" Number: {i}")

#3. Count from 0 to 10 in steps of 2
print("\nEven numbers from 0 to 10:")
for i in range (0, 11, 2):
    print(f" Even: {i}")

#4. Countdown from 5 to 1
print("\nCountdown from 5 to 1:")
for i in range(5, 0, -1):
    print(f" Countdown: {i}")

#5.calculate the sum of numbers from 1 to 10
print("\nSum of numbers from 1 to 10:")
total = 0
for i in range(1, 11):
    total += i
print(f" Total: {total}")

#6. Iterate over a list of customers and print their names in this specific format
customers = ["John","Mary","David","Sarah","Peter"]

for customer in customers:
    print(f"Customer: {customer}")
    
 #7. Iterate over a list of prices and print them in this specific format  
prices = [50000, 100000, 75000, 200000, 15000]

for price in prices:
    print (f"price: {price}")
    
 #8. Iterate over a list of products and print the total number of products  
products = ["Laptop", "Phone", "Mouse", "Keyboard","Laptop", "Phone", "Mouse", "Keyboard","Laptop", "Phone", "Mouse", "Keyboard"]

count = 0
for product in products:
    count += 1
print(count)
    
#9. Iterate over a list of products and print them in this specific format
products=["laptop", "phone", "mouse", "keyboard"]
count = 1
for product in products:
    print(f"product {count}:{product}")
    count = count + 1
#10. Iterate over a list of sales and calculate the total sales    
sales = [15000, 25000, 30000, 50000, 10000]    
total = 0
for sale in sales:
    total = total + sale
print (total)