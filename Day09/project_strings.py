customers = [
    {
        "customer_id": 101,
        "name": "  BRUNO KATO ",
        "email": " BRUNO@GMAIL.COM ",
        "city": " KAMPALA "
    },
    {
        "customer_id": 102,
        "name": "mary jane",
        "email": "MARY@GMAIL.COM",
        "city": "kampala"
    },
    {
        "customer_id": 103,
        "name": "  JOHN DOE",
        "email": " john@gmail.com ",
        "city": " KAMPALA"
    },
    {
        "customer_id": 104,
        "name": "SARAH   NAKATO ",
        "email": "SARAH@YAHOO.COM ",
        "city": "ENTEBBE "
    },
     {
        "customer_id": 105,
        "name": "  david   okello  ",
        "email": " DAVID@GMAIL.COM",
        "city": " JINJA "
    },
    {
        "customer_id": 106,
        "name": "ANNE  NAMUKASA",
        "email": "ANNE@GMAIL.COM ",
        "city": " kampala "
    }
]
# emil provider
def get_email_provider(email):
    parts = email.split("@")
    domain = parts[1]
    domain_parts = domain.split(".")
    provider = domain_parts[0]
    return provider
#email validation
def is_valid_email(email):
    if "@" in email and "." in email:
        return True
    else:
        return False
print(is_valid_email("brn@gmail.com"))
#for a single customer
def clean_customer(customer):
    name =" ".join(customer["name"].strip().split()).title()
    email= customer["email"].strip().lower()
    provider=get_email_provider(email)
    if is_valid_email(email):
        email_status = "valid"
    else:
         email_status = "invalid"
         
    city = customer["city"].strip().lower()
    
    cleaned_customer = {
    "customer_id": customer["customer_id"],
    "name": name,
    "email": email,
    "city": city,
    "email_status": email_status,
    "email_provider": provider
}

    return cleaned_customer

cleaned = clean_customer(customers[0])
print(cleaned)

#for all customers
def clean_customers(customers):
    
    cleaned_customers=[]
    for customer in customers:
        cleaned_customer=clean_customer(customer)
        cleaned_customers.append(cleaned_customer)
            
    return cleaned_customers
clean = clean_customers(customers)
print(clean)
#customer count
count = 0
for customer in clean_customers(customers):
    if customer["city"]=="kampala":
        count+=1
print(count)