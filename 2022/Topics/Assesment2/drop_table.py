import sqlite3

table = int(input("what table to drop, 1= transaction 2= products:  "))
if table == 1:
    db = sqlite3.connect("supermarket.db")
    cursor = db.cursor()
    query = "DROP TABLE IF EXISTS transactions;"
    cursor.execute(query)
elif table == 2:
    db = sqlite3.connect("supermarket.db")
    cursor = db.cursor()
    query = "DROP TABLE IF EXISTS products;"
    cursor.execute(query)
