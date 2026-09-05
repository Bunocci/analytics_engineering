orders = [
    {"order_id": 2001, "quantity": "10"},
    {"order_id": 2002, "quantity": "twenty"},
    {"order_id": 2003, "quantity": "-5"},
    {"order_id": 2004, "quantity": "abc"}
]

for order in orders:
    try:
        quantity=int(order["quantity"])
        if quantity<0:
            raise ValueError ("Quantity cant be negative")
    except ValueError:
        print(f"order {order['order_id']} : Invalid quantity")
    else:
        print(f"order {order['order_id']} : valid quantity = {quantity}")
    finally:
        print("Validation complete")