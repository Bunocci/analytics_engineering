#write csv file
with open("orders.csv","w") as file:
    file.write("order_id,product,quantity,price\n")
    file.write("1001,laptop,2,2500000\n")
    file.write("1002,Mouse,5,50000\n")
    file.write("1003,Keyboard,3,120000\n")
    file.write("1004,Monitor,2,850000\n")
    file.write("1005,Laptop,3,2500000\n")
#read csv file
import csv
with open("orders.csv","r") as file:
    reader = csv.DictReader(file)
    orders = []
    for row in reader:
        order={
            "order_id":int(row["order_id"]),
            "product":row["product"],
            "quantity":int(row["quantity"]),
            "price": float(row["price"])
            }
        orders.append(order)
        print(order)
#revenue calculation for one order        
def calculate_order_total(order):
    order_total=order["quantity"]*order["price"]
    return order_total
total=calculate_order_total(order)
print(f"Single order total: {total}")
#total revenue calculation for all orders
def calculate_total_revenue(orders):
    total_revenue = 0
    for order in orders:
        total_revenue+=calculate_order_total(order)
    return total_revenue
final_total=calculate_total_revenue(orders)
print(f"Total Revenue: {final_total}")
