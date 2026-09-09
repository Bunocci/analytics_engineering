# Mini-project: Command-Line E-Commerce Sales Analyzer. Input orders.csv; output revenue, order count and more...

#write a csv file with order data
with open ("orders.csv","w") as file:
    file.write("order_id,customer,product,quantity,price\n")
    file.write("2001,Bruno,laptop,2,3000000\n")
    file.write("2002,Alice,Mouse,5,60000\n")
    file.write("2003,John,Keyboard,2,150000\n")
    file.write("2004,Bruno,Monitor,2,900000\n")
    file.write("2005,Alice,flashdisk,5,80000\n")
#read the csv file and store the data in a list of dictionaries    
import csv
with open ("orders.csv","r") as file:
    reader =csv.DictReader(file)
    orders=[]
    for row in reader:
        order={
            "order_id":int(row["order_id"]),
            "customer":row["customer"],
            "product":row["product"],
            "quantity":int(row["quantity"]),
            "price":float(row["price"]),
            
            }
        orders.append(order)
print(orders)
#calculate total for the first order
def calculate_order_total(order):
    order_total=order["quantity"] * order["price"]
    return order_total
total=calculate_order_total(orders[0])
print(total)
#calculate total revenue for all orders
def calculate_total_revenue(orders):
    total_revenue=0
    for order in orders:
        total_revenue+=calculate_order_total(order)
    return total_revenue
final_total=calculate_total_revenue(orders)
print(f"Total Revenue: {final_total}")
#calculate total number of orders
def order_count(orders):
    count=0
    for order in orders:
        count+=1
    return count
total_count=order_count(orders)
print(f"Order Count: {total_count}")
#calculate the top product by revenue
def top_product(orders):
    top_product_total=0
    top_product_name=""
    for order in orders:
        order_total=calculate_order_total(order) 
        if order_total>top_product_total:
            top_product_total=order_total
            top_product_name=order["product"]
    return top_product_name
top=top_product(orders)
print(f"Top product: {top}")
#calculate the average order value
def average_order_value(final_total, total_count):
    average_order=final_total/total_count
    return average_order
average=average_order_value(final_total, total_count)
print(f"Average Order Value: {average}")
#calculate total revenue per customer
def customer_totals(orders):
    customer_totals={}
    for order in orders:
        customer = order["customer"]
        order_total=calculate_order_total(order)
        customer_totals[customer]=customer_totals.get(customer,0)+order_total
    return customer_totals
customer_totalz=customer_totals(orders)
print(f"customer_initials = {customer_totalz}")
#calculate the top customer by revenue
def top_customer(orders):
    top_customer_total=0
    top_customer_name=""
    
    for customer, total in customer_totalz.items():
        if total>top_customer_total:
            top_customer_total=total
            top_customer=customer
    return top_customer
customer_top=top_customer(orders)
print(f"Top Customer: {customer_top}")       
