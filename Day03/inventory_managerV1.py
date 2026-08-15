#inventory manager version 1
inventory = ["Laptop", "Phone", "Tablet", "Keyboard", "Mouse"]
title = "current inventory"
#menu display which should appear after every action
print(f"\n====================")
print(f"\n{title:^20}")
print(f"\n====================")

while True:
    print("1. View inventory")
    print("2. Add product")
    print("3. Remove product")
    print("4. Search product")
    print("5. Sort inventory")
    print("6. show inventory count")
    print("7. Exit")
    
    choice = input("Choose an option: ")
#user views the inventory
    if choice == "1":
        
        print(f"\n====================")
        print(f"\n{title:^20}")
        print(f"\n====================")
        for product in inventory:
            print (product)
  #user adds a product to the inventory      
    elif choice == "2":
        add_product = input("add your product: ")
        inventory.append(add_product)
        print(f"Product succeffully added")
        print(f"\n====================")
        print(f"\n{title:^20}")
        print(f"\n====================")
        for product in inventory:
            print (product)
#user removes a product from the inventory
    elif choice == "3":
        
        title = "current inventory"
        remove_product = input("Name the product to be removed: ").lower()

        for product in inventory:
            if product.lower() == remove_product:
                inventory.remove(product)

                print("Product successfully removed!")

                print("\n====================")
                print(f"{title:^20}")
                print("====================")

                for product in inventory:
                    print(product)

                break

        else:
            print("Product not found, try again.")
#user searches the product(case sensitive)
    elif choice == "4":
    
        product_name = input("put the name of the product: ").lower()
        title="current inventory"
        for product in inventory:
            if product.lower() == product_name:
                position = inventory.index(product)
                print("Product found!")
                print(f"{product} is in position: {position}")
                print(f"\n====================")
                print(f"\n{title:^15}")
                print(f"\n====================")
  
                for product in inventory:
                    print (product)
                break
        else:
            print("Product not found")
#user sorts the inventory    
    elif choice == "5":
        inventory.sort()
        print("product successfully sorted")
        print(f"\n====================")
        print(f"\n{title:^15}")
        print(f"\n====================")
  
        for product in inventory:
            print (product)
#user shows inventory count        
    elif choice == "6": 
        count=0
        for item in inventory:
            print(item)
            count = count + 1 

        print(f"Total product: {count}")
    elif choice == "7":
        break
