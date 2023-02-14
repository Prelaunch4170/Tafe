import sqlite3
from product import Products
import time
from checkoutRegister import checkoutRegister


class createDB:

    def __init__(self):
        self.db = ""

    def setup_transaction_db(self):
        try:
            self.db = sqlite3.connect("supermarket.db")
            cursor = self.db.cursor()
            query = "CREATE TABLE transactions (transId INTEGER, date DATE NOT NULL, barcode VARCHAR(3) NOT NULL, price FLOAT(5, 2) NOT NULL);"
            cursor.execute(query)
            self.db.commit()
            transactions = [("5", "2022-10-28", "123", 2.5), ("8", "2022-12-28", "123", 2.5),
                            ("5", "2022-10-28", "123", 2.5), ("3", "2022-04-28", "123", 2.5),
                            ("6", "2022-10-29", "123", 2.5), ("2", "2022-02-28", "123", 2.5),
                            ("7", "2022-10-30", "123", 2.5), ("1", "2022-01-28", "123", 2.5),
                            ("8", "2022-11-28", "123", 2.5), ("4", "2022-09-28", "123", 2.5)]
            query = "INSERT INTO transactions (transId, date, barcode, price) VALUES (?,?,?,?);"
            cursor.executemany(query, transactions)
            self.db.commit()
        except Exception as ex:
            print("unable to create table Transaction. {}".format(ex))
            self.db.rollback()
        finally:
            self.db.close()

    def setup_product_db(self):

        try:
            self.db = sqlite3.connect("supermarket.db")
            cursor = self.db.cursor()
            query = "CREATE TABLE products (barcode VARCHAR(3) NOT NULL, name VARCHAR(10) NOT NULL," \
                    "desc VARCHAR(20) NOT NULL, price FLOAT(5, 2) NOT NULL);"
            cursor.execute(query)
            products = [("123", "Milk", "2L", 2.5), ("456", "Bread", "500g", 4.0),
                        ("789", "Chocolate", "250g", 1.5), ("111", "Protein bar", "150g", 1.5),
                        ("222", "Apple", "150g", 0.5), ("333", "Water", "1.5L", 1.75),
                        ("444", "Flour", "3KG", 3.99), ("555", "Eggs", "12", 6.5),
                        ("147", "mint", "100", 0.75), ("258", "Cherries", "1KG", 2.5)]
            query = "INSERT INTO products (barcode, name, desc, price) VALUES (?,?,?,?);"
            cursor.executemany(query, products)

            self.db.commit()

        except Exception as ex:
            print("unable to create table Products. {}".format(ex))
            self.db.rollback()
        finally:
            self.db.close()


createDB().setup_transaction_db()
