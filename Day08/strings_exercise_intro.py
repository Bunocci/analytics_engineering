#1. strings basics (indexing and length)
product = "Laptop"
print(product[0])
print(product[-1])
print(product[2])
print(len(product))

#2. Slicing
product = "Analytics"
print(product[:-4])
print(product[5:])
print(product[2:6])
print(product[::-1])

#3. clean customer name
customer_name = " BRUNO K "
edited_customer_name=customer_name.strip().title()
print(edited_customer_name)

#4. clean products names
products = [
    "  laptop ",
    "PHONE",
    " Tablet",
    "keyboard  ",
    " MOUSE "
]

products_new = []
for product in products:
    product_edit= product.strip().title()
    products_new.append(product_edit)
print(products_new)

#5. mini data cleaning challenge
customer_name = "   BRUNO KATO   "
email = "   BRUNO@GMAIL.COM   "
city = "   KAMPALA   "

customer_name_new = customer_name.strip().title()
email_new = email.strip().lower()
city_new = city.strip().title()

print(f"Name: {customer_name_new}")
print(f"Email: {email_new}")
print(f"City: {city_new}")