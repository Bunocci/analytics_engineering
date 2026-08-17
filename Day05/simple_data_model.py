# Mini E-commerce data modeling
customer={
    
          "customer_id":543,
          "name":"cayden",
          "email":"luk@gmail.com",
          "age":2,
          "city":"kampala"
          
    }

product = {
    "id": 101,
    "name": "Laptop",
    "category": "Electronics",
    "price": 2500000,
    "stock": 15
}

order={"order_id":104,
      "customer_id":543,
      "product_id":101,
      "quantity":3,
      "status":"pending"
      }

print("===Order details===")
print(f"Customer name: {customer['name']}")
print(f"Product name: {product['name']}")
print(f"product price: {product['price']}")
print(f"order quantity: {order['quantity']}")
print(f"Order status: {order['status']}")
print(f"Customers address: {customer.get('address','Address not provided')}")
order.update({"status":"shipped"})
print(order)