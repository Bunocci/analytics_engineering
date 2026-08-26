#Mini e-commerce sales Analytics system
#customers
customers = [
    {
        "customer_id": 1,
        "name": "Bruno",
        "city": "Kampala"
    },
    {
        "customer_id": 2,
        "name": "Sarah",
        "city": "Entebbe"
    },
    {
        "customer_id": 3,
        "name": "David",
        "city": "Jinja"
    }
]
#products
products = [
    {
        "product_id": 101,
        "name": "Laptop",
        "price": 2500000,
        "stock": 10,
        "discount_rate": 0.10
    },
    {
        "product_id": 102,
        "name": "Phone",
        "price": 1200000,
        "stock": 15,
        "discount_rate": 0.05
    },
    {
        "product_id": 103,
        "name": "Tablet",
        "price": 800000,
        "stock": 8,
        "discount_rate": 0.15
    },
    {
        "product_id": 104,
        "name": "Mouse",
        "price": 50000,
        "stock": 30,
        "discount_rate": 0
    }
]
#orders
orders = [
    {
        "order_id": 1001,
        "customer_id": 1,
        "product_id": 101,
        "quantity": 2
    },
    {
        "order_id": 1002,
        "customer_id": 2,
        "product_id": 102,
        "quantity": 3
    },
    {
        "order_id": 1003,
        "customer_id": 1,
        "product_id": 104,
        "quantity": 5
    },
    {
        "order_id": 1004,
        "customer_id": 3,
        "product_id": 103,
        "quantity": 2
    }
]
#1. Calculate the total amount for each order
def calculate_order_total(order,products):
    for product in products:
        if product["product_id"]==order["product_id"]:
            #print(product["price"])
            order_total=product["price"]*order["quantity"]
    return order_total
            
        
#2. Calculate the total revenue from all orders    
order_total=calculate_order_total(orders[0],products)
print(order_total)

def calculate_total_revenue(orders, products):
    total_revenue=0
    for order in orders:
        order_total=calculate_order_total(order,products)
        total_revenue+=order_total
    return total_revenue
total_revenue=calculate_total_revenue(orders,products)
print(total_revenue)

#3. Calculate the total discount with uniform discount on all products
def calculate_total_discount(orders,products,discount_rate):
    total_revenue=calculate_total_revenue(orders,products)
    total_discount=total_revenue*discount_rate
    return total_discount
total_discount=calculate_total_discount(orders,products,0.10)
print(total_discount)

#4. Calculate the total discount with varying discounts on different products
def calculate_total_discount(orders, products):
    total_discount = 0
    for order in orders:
        for product in products:
            if product["product_id"]== order["product_id"]:
                discount_rate=product["discount_rate"]
                #order_total=calculate_order_total(order,products)
                order_total=product["price"]*order["quantity"]
                order_discount=order_total*discount_rate
                total_discount+=order_discount
    return total_discount
total_discount=calculate_total_discount(orders,products)
print(total_discount)
#5. Calculate the final amount after tax
def calculate_final_amount(orders, products, tax_rate):
    total_revenue=calculate_total_revenue(orders,products)
    total_discount=calculate_total_discount(orders,products)
    net_revenue= total_revenue - total_discount
    tax = net_revenue*tax_rate
    final_amount=net_revenue+tax
    return final_amount
final_amount=calculate_final_amount(orders, products, 0.18)
print(final_amount)
#6. Find the top product based on revenue
def final_top_product(orders, products):
    top_product=products[0]
    top_revenue=calculate_order_total(orders[0], products)
    for order in orders:
        order_total=calculate_order_total(order,products)
        for product in products:
            if product["product_id"]== order["product_id"]:
                
                if order_total>top_revenue:
                    top_revenue=order_total
                    top_product=product
                    
    return top_product
top_product=final_top_product(orders,products)
print(top_product)