import json
orders=[
    {
        "order_id": 1001,
        "product":"Laptop",
        "quantity" :2,
        "price": 2500000
        },
    {
        "order_id": 1002,
        "product":"mouse",
        "quantity" :2,
        "price": 50000
        },
    {
        "order_id": 1003,
        "product":"keyboard",
        "quantity" :5,
        "price": 150000
        }
    ]
#write json file
with open("orders.json","w") as file:
    orders = json.dump(orders,file, indent=4)

#read json file    
with open("orders.json", "r") as file:
    
    orders=json.load(file)
    print(orders)
#revenue calculation for one order
def calculate_order_total(order):
    order_total=order["quantity"]*order["price"]
    return order_total
total=calculate_order_total(orders[0])
print(f"order total: {total}")
#total revenue calculation for all orders
def calculate_total_revenue(orders):
    total_revenue=0
    for order in orders:
        total_revenue+=calculate_order_total(order)
    return total_revenue
final_total=calculate_total_revenue(orders)
print(f"Total Revenue: {final_total}")
#write analysis to json file
analysis=[{
    "order total":total,
    "total revenue":final_total
    }]
with open("analysis.json","w") as file:
    json.dump(analysis,file)