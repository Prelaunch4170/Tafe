import unittest
from upc import UniversalProductCode


class TestUniversalProductCode(unittest.TestCase):
    def setUp(self):
        self.test_code = input("enter a barcode code: ")

    def test_is_Valid(self):
        testUPC = UniversalProductCode(self.test_code)
        self.assertTrue(testUPC.is_valid())


if __name__ == "__main__":
    unittest.main()
