#1. Exercise 1: text file
with open ("products.txt", "w") as file:
    file.write("Laptop\n")
    file.write("Mouse\n")
    file.write("Keyboard\n")
    file.write("Monitor\n")
    
with open("products.txt", "r") as file:
    content=file.read()
    print(content)

        
#2. write report.txt
with open("report.txt","w")as file:
    file.write("Daily Sales Report\n")
    file.write("Total orders: 5\n")
    file.write("Total Revenue: 7500000\n")
    

#3. CSV
import csv
with open("orders.csv","w") as file:
    file.write("order_id,product,quantity,price\n")
    file.write("1001,laptop,2,2500000\n")
    file.write("1002,Mouse,5,50000\n")
    file.write("1003,Keyboard,3,120000\n")
    file.write("1004,Monitor,2,850000\n")
    
#4. read & convert data types    
with open("orders.csv","r") as file:
    reader=csv.DictReader(file)
    orders=[]
    for row in reader:
        order={
            
            "order_id":int(row["order_id"]),
            "product":row["product"],
            "quantity":int(row["quantity"]),
            "price": float(row["price"])
            }
        orders.append(order)
        print(order)
#5. order revenue
def calculate_order_total(order):
    order_total=order["quantity"]*order["price"]
    return order_total
total=calculate_order_total(order)
print(f"order total: {total}")

def calculate_total_revenue(orders):
    total_revenue=0
    for order in orders:
        total_revenue+=calculate_order_total(order)
    return total_revenue
final_total=calculate_total_revenue(orders)
print(f"Total Revenue: {final_total}")

#6. product with highest revenue
def top_product(orders):
    top_order=orders[0]
    for order in orders:
        order_total=calculate_order_total(order)
   
        if order_total > calculate_order_total(top_order):
            top_order = order
    return top_order
top=top_product(orders)
print(top)
