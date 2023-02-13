class Products:
    def __init__(self, barcode, name, price):
        self.barcode = barcode
        self.name = name
        self.price = price

    def getBarcode(self):
        return self.barcode

    def getName(self):
        return self.name

    def getPrice(self):
        return self.price
