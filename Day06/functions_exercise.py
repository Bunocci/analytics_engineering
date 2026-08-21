#Build functions for totals, discounts, tax, averages and top products
# 1. total revenue
orders = [
    {"product": "Laptop", "price": 2500000, "quantity": 2},
    {"product": "Phone", "price": 1200000, "quantity": 3},
    {"product": "Mouse", "price": 50000, "quantity": 5}
]

def calculate_total_revenue(orders):
    total_revenue=0
    for order in orders:
        total_revenue+=order["price"]*order["quantity"]
    return total_revenue

total_revenue=calculate_total_revenue(orders)
print(total_revenue)

#.2 Discount
def calculate_discount(amount, discount_rate):
    discount_amount = amount*discount_rate
    return discount_amount
discount_amount=calculate_discount(500000,0.1)
print(discount_amount)

#3. Tax
def calculate_tax(amount,tax_rate):
    total_tax=amount*tax_rate
    return total_tax
total_tax=calculate_tax(500000,0.18)
print(total_tax)
#.4 Average sales
sales = [
    100000,
    150000,
    200000,
    250000,
    300000
]

def calculate_sales(sales):
    total_sales=sum(sales)
    if len(sales)==0:
        return 0
    average_sales=total_sales/len(sales)
    
    return average_sales
average_sales=calculate_sales(sales)
print (average_sales)
    
#.5 Top product
products = [
    {"name": "Laptop", "sales": 50},
    {"name": "Phone", "sales": 80},
    {"name": "Tablet", "sales": 30},
    {"name": "Monitor", "sales": 60}
]

def find_top_product(products):
    if products==[]:
            return "Empty list"
    top_product=products[0]
    for product in products:
        if product["sales"]>top_product["sales"]:
           top_product=product
    
    return top_product
top_product=find_top_product(products)
print(top_product)
        