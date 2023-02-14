import unittest
from checkoutRegister import checkoutRegister
from product import Products


# test for Product class
class test_Product(unittest.TestCase):
    testProduct = Products(123, "Milk 2 Litre", 3.50)

    def testGetItemBarcode(self):
        barcode = self.testProduct.getBarcode()
        self.assertEqual(123, barcode)

    def testGetName(self):
        name = self.testProduct.getName()
        self.assertEqual("Milk 2 Litre", name)

    def tetGetPrice(self):
        price = self.testProduct.getPrice()
        self.assertEqual(3.50, price)


# Test for checkout
class test_Checkout(unittest.TestCase):

    def test_scan_item(self):
        checkout = checkoutRegister()
        item = Products(123, "Milk 2 Litre", 3.50)
        checkout.purchased_items.append(item)
        self.assertTrue(checkout.scan_item(123))

    def test_accept_payment(self):
        checkout = checkoutRegister()
        amount = 10
        checkout.accept_payment(amount)
        self.assertEqual(checkout.received_amount, amount)

    def test_init(self):
        checkout = checkoutRegister()
        self.assertEqual(len(checkout.purchased_items), 0)
        self.assertEqual(checkout.total_payment, 0)
        self.assertEqual(checkout.received_amount, 0)


if __name__ == "__main__":
    unittest.main()
