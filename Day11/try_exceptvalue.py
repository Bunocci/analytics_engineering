orders = [
    {"order_id": 3001, "quantity": "5"},
    {"order_id": 3002, "quantity": "-3"},
    {"order_id": 3003, "quantity": "ten"},
    {"order_id": 3004, "quantity": "2"}
]

for order in orders:
    try:
        quantity=int(order["quantity"])
        if quantity < 0:
            raise ValueError ("quantity cannot be negative")
    except ValueError as error:
        print(f"order {order['order_id']} : Invalid quantity")
    else:
        print(f"order {order['order_id']} : valid quantity = {quantity}")
    finally:
        print("validation complete")