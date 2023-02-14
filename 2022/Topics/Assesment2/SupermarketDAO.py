import sqlite3
from product import Products

from openpyxl import Workbook
from openpyxl.chart import BarChart, Reference


class superMarketDAO:

    def __init__(self):
        self.cost = 0.0
        self.desc = ""
        self.name = ""
        self.barcode = ""
        self.db = ""
        self.products = []

    def list_all_products(self):
        rows = ""
        try:
            self.db = sqlite3.connect("supermarket.db")
            cursor = self.db.cursor()
            query = "SELECT * FROM products order by barcode ASC"
            cursor.execute(query)
            rows = cursor.fetchall()
        except Exception as ex:
            print("unable to open table. {}".format(ex))
        finally:
            self.db.close()
            return rows

    def list_all_transactions(self):
        rows = ""
        try:
            self.db = sqlite3.connect("supermarket.db")
            cursor = self.db.cursor()
            query = "SELECT * FROM transactions ORDER BY date(date) ASC;"
            cursor.execute(query)
            rows = cursor.fetchall()
        except Exception as ex:
            print("unable to open table. {}".format(ex))
        finally:
            self.db.close()
            return rows

    def getMostRecentID(self):
        self.db = sqlite3.connect("supermarket.db")
        cursor = self.db.cursor()
        query = "SELECT transId FROM transactions ORDER BY transId DESC;"
        cursor.execute(query)
        rows = cursor.fetchall()
        number = rows[0]
        return number[0]

    def addProductToDB(self, Barcode, Name, Description, Cost):
        self.barcode = Barcode
        self.name = Name
        self.desc = Description
        self.cost = float(Cost)
        try:
            self.db = sqlite3.connect("supermarket.db")
            cursor = self.db.cursor()
            products = [Barcode, Name, Description, float(Cost)]
            query = "INSERT INTO products (barcode, name, desc, price) VALUES (?,?,?,?);"
            cursor.execute(query, products)
            self.db.commit()
        except Exception as ex:
            print("unable to create table Transaction. {}".format(ex))
            self.db.rollback()
        finally:
            self.db.close()

    # passing separate values instead of object
    def addTransactionToDB(self, ID, Date, Barcode, Price):
        try:
            self.db = sqlite3.connect("supermarket.db")
            cursor = self.db.cursor()
            transaction = [ID, Date, Barcode, float(Price)]
            query = "INSERT INTO transactions (transId, date, barcode, price) VALUES (?,?,?,?);"
            cursor.execute(query, transaction)
            self.db.commit()
        except Exception as ex:
            print("unable to create table Transaction. {}".format(ex))
            self.db.rollback()
        finally:
            self.db.close()

    def findProduct(self, barcode):
        rows = ""
        try:
            self.db = sqlite3.connect("supermarket.db")
            cursor = self.db.cursor()
            query = "SELECT * FROM products Where barcode = ?"

            cursor.execute(query, (barcode,))
            rows = cursor.fetchall()
        except Exception as ex:
            print("unable to open table. {}".format(ex))
        finally:
            self.db.close()
            testval = len(rows)
            if testval < 1:
                print("item could not be found")
            else:
                return rows

    def displayBarchartOfProductsSold(self):
        rows = ""
        dictionary = {}
        try:
            transactions = self.list_all_transactions()
            products = self.list_all_products()
            for item in products:
                dictionary[item[0]] = 0
            for item in transactions:
                if item[2] in dictionary:
                    dictionary[item[2]] += 1
            workbook = Workbook()
            sheet = workbook.active
            cells = list(dictionary.items())
            cells.insert(0, ["Barcode", "Sales Volume"])

            for row in cells:
                sheet.append(row)
            workbook.save("chart1.xlsx")
            chart = BarChart()
            data = Reference(worksheet=sheet,
                             min_row=1,
                             max_row=len(cells) + 1,
                             min_col=2,
                             max_col=2)
            chart.add_data(data, titles_from_data=True)
            catagories = Reference(worksheet=sheet,
                                   min_row=2,
                                   max_row=len(cells),
                                   min_col=1,
                                   max_col=1)
            chart.set_categories(catagories)
            chart.x_axis.title = "Barcode"
            chart.y_axis.title = "Sales Volume"
            sheet.add_chart(chart, "E2")
            workbook.save("chart2.xlsx")
        except Exception as ex:
            print("unable to create worksheet. {}".format(ex))
        finally:
            return rows

    def transactionReport(self):
        rows = ""
        dictionary = {}
        try:
            transactions = self.list_all_transactions()

            workbook = Workbook()
            sheet = workbook.active

            sheet.append(["ID", "Date", "Barcode", "Price"])
            for items in transactions:
                sheet.append(items)
            workbook.save("transactions.xlsx")

        except Exception as ex:
            print("unable to open table. {}".format(ex))
        finally:
            return 0


dao = superMarketDAO()
dao.displayBarchartOfProductsSold()
dao.transactionReport()