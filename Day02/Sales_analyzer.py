orders = [50000, 75000, 120000, 30000, 200000]
#number of orders
count = 0
for order in orders:
    count +=1
print (f"number of orders: {count}")

#total_revenue
total = 0
for order in orders:
    total = total + order
print(f"Total_revenue: {total}")

#Average order value
average=total/count
print(f"Average order value: {average}")

#Highest order value
biggest_order = 0
for order in orders:
    if order > biggest_order:
        biggest_order=order
print(f"Biggest order:{order}")

#lowest order value
smallest_order = orders[0]
for order in orders:
    if order < smallest_order:
        smallest_order=order
print(f"Smallest order:{smallest_order}")

