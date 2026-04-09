class BankAccount:
    # Constructor to initialize account holder name and balance
    def __init__(self, name, balance=0):
        # intializing the name, balance and transaction history
        self.name = name
        self.balance = balance
        self.transaction_history = []

    def deposit(self, amount):
        if amount > 0:
            self.balance += amount
            self.transaction_history.append(f"Deposited ₹{amount}")
            print("Deposit successful")
        else:
            print("Amount must be positive")

    def withdraw(self, amount):
        if amount <= 0:
            print("Amount must be positive")
        elif amount > self.balance:
            print("Insufficient balance")
        else:
            self.balance -= amount
            self.transaction_history.append(f"Withdrawn ₹{amount}")
            print("Withdrawal successful")

    def display_balance(self):
        print(f"Balance: ₹{self.balance}")

    def show_transactions(self):
        print("\nTransaction History:")
        if not self.transaction_history:
            print("No transactions")
        else:
            for t in self.transaction_history:
                print(t)
# now we should create a bank account and show the menu to the user
name = input("Enter name: ")
balance = float(input("Enter initial balance: "))
account = BankAccount(name, balance)
# using while loop to shhow until user wants to exit
# the while loop will keep running until the user chooses to exit by entering '5
while True:
    print("\n1. Deposit\n2. Withdraw\n3. Balance\n4. History\n5. Exit")
    choice = input("Enter choice: ")
# if the user enters 1, we will ask for the amount to deposit and call the deposit method
    if choice == '1':
        amount = float(input("Enter deposit amount: "))
        account.deposit(amount)
# if the user enters 2, we will ask for the amount to withdraw and call the withdraw method
    elif choice == '2':
        amount = float(input("Enter withdraw amount: "))
        account.withdraw(amount)
# if the user enters 3, we will call the display_balance method to show the current balance
    elif choice == '3':
        account.display_balance()
# if the user enters 4, we will call the show_transactions method to display the transaction history
    elif choice == '4':
        account.show_transactions()
# if the user enters 5, we will break the loop and exit the program
    elif choice == '5':
        print("Exiting...")
        break
# else we will print an error message for invalid choice
    else:
        print("Invalid choice")