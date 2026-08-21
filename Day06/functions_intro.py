#simple function that takes a name as an argument and returns a greeting message
def greet(name):
    return(f"Hello {name}, welcome to python!")
print(greet("Bruno"))

#area of rectangle function that takes length and width as arguments and returns the area
def calculate_area(length, width):
    return length*width
result=calculate_area(10, 5)
print(result)

#total cost function that takes price and quantity as arguments and returns the total cost
def calculate_total(price, quantity):
    return price*quantity
total=calculate_total(2500000,3)
print(total)

#function to display inventory
def show_inventory(inventory):

    # loop through inventory 
    for products in inventory:
        print(products)

        # print each product


inventory = [
    "Laptop",
    "Phone",
    "Tablet",
    "Keyboard",
    "Mouse"
]
show_inventory(inventory)

product = {
    "product_id": 102,
    "name": "Phone",
    "category": "Electronics",
    "price": 1200000,
    "stock": 7
}
def check_stock(product):
    
    
    if product["stock"] > 0:
        return f"{product['name']} is available! Stock: {product['stock']} "
    else:
        return "Out of stock"
print(check_stock(product))


    
