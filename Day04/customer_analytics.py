#customer analytics
july_customers = {
    "John",
    "Mary",
    "David",
    "Sarah",
    "Peter"
}

august_customers = {
    "Mary",
    "Sarah",
    "Peter",
    "James",
    "Robert"
    }

#Customers who bought in BOTH months
print(july_customers.intersection(august_customers))
#Customers who bought in July but NOT August
print(july_customers.difference(august_customers))
#customers who bought August but Not july
print(august_customers.difference(july_customers))
#All unique customers
print(july_customers.union(august_customers))
#number os customers
print(f"July has: {len(july_customers)} customers")
print(f"august has: {len(august_customers)} customers")
#customers who purchased in both
print(f"customers bought in both july & august: {len(july_customers.intersection(august_customers))}")

