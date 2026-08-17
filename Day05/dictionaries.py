#1. customer dictionary
customer={
    
          "customer_id":54326,
          "name":"cayden",
          "email":"luk@gmail.com",
          "age":2,
          "city":"kampala"
          
    }

print(customer["name"])
print(customer["city"])
print(customer["email"])
#change city to kisasi
customer["city"]="kisasi"
print(customer)
#add phone number
customer.update({"phone":7775532})
print(customer)

#2. Keys,values, items
product = {
    "id": 101,
    "name": "Laptop",
    "category": "Electronics",
    "price": 2500000,
    "stock": 15
}

print(product.keys())
print(product.values())
#print(customer.items())
for key, value in customer.items():
    print(key, value)

#3. get()
    
customer = {
    "name": "Mary",
    "city": "Kampala",
    "phone": "0700000000"
}
# Update
print(customer["name"])
print(customer["phone"])
print(customer.get("email","email not provided"))

#4. update()

product = {
    "name": "Laptop",
    "price": 2500000,
    "stock": 10
}

product.update({"price":2300000,
                "stock":15,
               "Electronics" : "fridge"})

print(product)
