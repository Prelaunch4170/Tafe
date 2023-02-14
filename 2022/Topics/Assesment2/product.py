class Products:
    def __init__(self, barcode, name, desc, price):
        self.barcode = barcode
        self.name = name
        self.price = price
        self.desc = desc

    def getDesc(self):
        return self.desc

    def getBarcode(self):
        return self.barcode

    def getName(self):
        return self.name

    def getPrice(self):
        return self.price
