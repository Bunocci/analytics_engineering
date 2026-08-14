# count from 1 to 10 using a while loop
count = 1
while count <= 10:
    print(f" Count: {count}")
    count += 1
# Countdown from 10 to 1 using a while loop
count = 10
while count >= 1:
    print(f" Countdown: {count}")
    count -= 1

#keep asking the user to type 'Yes'
user_input = ""
while user_input != "Yes":
    user_input = input("Type 'Yes' to continue: ")
print("you typed 'Yes'")
