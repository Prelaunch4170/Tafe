import product
import datetime


# set up for checkout register class
class checkoutRegister:
    def __init__(self):
        self.total_payment = 0.0
        self.received_amount = 0.0
        self.purchased_items = []

    def getTotalPayment(self):
        return self.total_payment

    def accept_payment(self, amountGiven):
        self.received_amount += amountGiven
        return self.received_amount

    def scan_item(self, productScanned):
        self.total_payment += productScanned.getPrice()
        self.purchased_items.append(productScanned)

    def get_purchased_items(self):
        return self.purchased_items

    # print receipt
    def print_receipt(self):
        receipt = "----- Final Receipt-----"
        receipt += "\n\n"
        for p in self.purchased_items:
            receipt += p.getName() + " $" + str(p.getPrice()) + "\n"
        receipt += "\n"

        receipt += "\n"
        receipt += "Total amount due : $" + str(self.total_payment) + "\n"
        receipt += "Amount received : $" + str(self.received_amount) + "\n"
        receipt += "change given : $" + str(self.received_amount - self.total_payment) + "\n"
        receipt += "Thank you for shopping at shopping centre!\n"
        current_date = datetime.date.today()
        total_payment = self.total_payment
        items = ""
        with open("transactions.txt", "a") as file:
            for p in self.purchased_items:
                items += p.getName() + ","
            items = items[:-1]
            file.write(str(current_date) + " " + items + " Total: $" + str(
                total_payment) + "\n")
            file.close()
        return receipt
