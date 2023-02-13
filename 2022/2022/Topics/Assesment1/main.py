from checkoutRegister import checkoutRegister
from product import Products
import datetime


def main():
    item_list = []

    # opens product file and adds items to array
    with open("products", "rt") as file:
        for each_line in file:
            barcode, name, price = each_line.strip().split(",")
            item_list.append(Products(int(barcode), name, float(price)))
    # start of scan loop
    while True:
        print("\n Welcome to Self Checkout \n")

        checkout = checkoutRegister()
        # loop for scanning
        while True:
            code = int(input("please enter barcode: "))
            found = False
            # checks if item is in list
            for item in item_list:
                if item.getBarcode() == code:
                    found = True
                    selected_iem = item

                    if found:
                        print("\n{} - ${}\n".format(selected_iem.getName(), selected_iem.getPrice()))
                        checkout.scan_item(selected_iem)
                    else:
                        print("\n this product does not exist in our inventory. \n")
                        break

            ans = input("would you like to scan another product? (Y/N)").upper()
            print()
            # checks if another items needs to be scanned
            if ans == "N":
                break
            elif ans != "N" and ans != "Y":
                print("\n Wrong input“.\n")

        amount_due = checkout.getTotalPayment()
        # payment loop
        # starting loop for accepting payment
        while True:
            amount = float(input("payment due: ${0}. Please enter an amount to pay: ".format(amount_due)))
            if amount < 0:
                print("we dont accept negative money")
                continue

            total_payment = checkout.accept_payment(amount)
            amount_due -= amount
            if amount_due <= 0:
                break

        # print receipt
        print(checkout.print_receipt())


main()
