#1. split
data = "Laptop,Phone,Tablet,Mouse,Keyboard"
print(data.split(","))

#2. Join
products = ["Laptop", "Phone", "Tablet", "Mouse"]
print("|".join(products))

#3. find() and count()
email = "bruno@gmail.com"
print(email.find("@"))
print(email.count("@"))
print(email.find("gmail"))

#4. startswith() and endswith()
filename = "sales_data_2026.csv"
print(filename.startswith("sales"))
print(filename.endswith(".csv"))
print(filename.endswith(".json"))

#5. Mini Data cleaning challenge
raw_products = "  LAPTOP, Phone ,TABLET, mouse  "
raw_products_new= raw_products.split(",")
raw_edit=[]
for product in raw_products_new:
    edit=product.strip().title()
    raw_edit.append(edit)
print("\n".join(raw_edit))
print("|".join(raw_edit))