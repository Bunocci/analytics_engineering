#Basic invetory exercise
products = ["Laptop","Phone","Tablet","Keyboard","Mouse","Monitor"]
print(products[0])
print(products[5])
print(len(products))
print(products[2])
print(products[4])

#modify the invetory
invetory = ["Laptop","Phone","Tablet"]
invetory.append("Keyboard")
invetory.append("Mouse")
invetory.remove("Phone")
invetory.pop()
print(invetory)

#Sorting
Prices = [120000, 50000, 300000, 75000, 150000]
Prices.sort()
print(Prices)
Prices.sort(reverse = True)
print(Prices)

#Slicing
products = [
    "Laptop",
    "Phone",
    "Tablet",
    "Keyboard",
    "Mouse",
    "Monitor",
    "Headphones"
]
#a. The first three products
print(products[:3])
#b. The last three products
print(products[4:])
#c.  Products from "Tablet" through "Mouse".
print(products[2:5])
#d. Every product except the first two
print(products[2:])
#e. The entire list in reverse order
print(products[::-1])

#Invetory Analysis
inventory = [
    "Laptop",
    "Phone",
    "Tablet",
    "Keyboard",
    "Mouse"
]
#a. Print the number of products.
print(len(inventory))
#b. Ask the user for a product name.
product_name = input("put the name of the product: ")
#c. Check whether that product exists in the inventory.
if product_name in inventory:
    print(inventory.index(f"{product_name}"))
else:
    print("product not found")
    