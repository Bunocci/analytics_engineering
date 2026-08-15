#Exercise-1(Tuple Basics)
products = ("Laptop", "phone", "Tablet", "keyboard", "mouse")
print(f"The first item: {products[0]}")
print(f"The last item: {products[-1]}")
print(f"The 3rd item: {products[2]}")
print(f"The number of items: {len(products)}")
if "phone" in products:
    print("Yes,item is in the tupple")

#products[0]="books"
#in order to change an item hd to first convert to list change then back to tuple
prod = list(products)
prod[0]="books"
print(prod)
products = tuple(prod)
print(products)

#Exercise-2(Slicing)
products = (
    "Laptop",
    "Phone",
    "Tablet",
    "Keyboard",
    "Mouse",
    "Monitor"
)
print(f"The first three products: {products[:3]}")
print(f"The last three products: {products[3:]}")
print(products[2:5])
print(products[1:])
#reverse the tuple
reverse_product=products[::-1]
print(reverse_product)

#Exercise 3- Remove duplicates
customers = [
    "John",
    "Mary",
    "John",
    "Peter",
    "Mary",
    "Sarah",
    "John",
    "Peter"
]
print(customers)
#convert to set
customer_set = set(customers)
print(customer_set)
#number of unique customers
print(len(customer_set))

#Exercise 4- Set operations
store_a = {"Laptop", "Phone", "Mouse", "Keyboard"}
store_b = {"Phone", "Keyboard", "Monitor", "Tablet"}
#Union
print(f"Set union: {store_a | store_b}")
#intersection
print(f"Set Intersection: {store_a & store_b}")
#difference
print(f"Set difference: {store_a - store_b}")
#reverse difference
print(f"Set difference: {store_b - store_a}")
