import hashlib
import SupermarketDAO

credentials = "Andre_Test"  # user name = "abcd" and password = "efgh"

with open("login.bin", "wb") as file:
    file.write(hashlib.sha512(credentials.encode('utf-8')).digest())
    file.close()

with open('login.bin', 'rb') as file:
    user_name = input("enter un: ")
    pw = input("enter pw: ")
    user_cred = "".join([user_name, '_', pw])
    print(user_cred)
    user_cred = hashlib.sha512(user_cred.encode('utf-8')).digest()  # create hash
    if user_cred == file.read():  # verify hash (password)
        dao = SupermarketDAO.superMarketDAO()
        userinput = input("which option do you want to access: \n A: Add Products to Database "
                          "\n B: List all Products in Database"
                          "\n C: Find a Product in the Database, based on Product Bar-Code"
                          "\n D: List All Transactions "
                          "\n E: Display a Bar chart of Products sold by quantity"
                          "\n F: Display an Excel report of all transactions"
                          "\n G: Exit"
                          "\n")
        userinput = userinput.upper()
        if userinput == "A":
            prodBarcode = input("Enter Barcode: ")
            prodName = input("Enter Name: ")
            prodDesc = input("Enter Description: ")
            prodCost = float(input("Enter cost as a float: "))
            item_list = dao.addProductToDB(prodBarcode, prodName, prodDesc, prodCost)
            for item in item_list:
                print(item)

        elif userinput == "B":
            print("Here are all of the products: \n")
            item_list = dao.list_all_products()
            for item in item_list:
                print(item)
        elif userinput == "C":
            selectProd = input("Enter the barcode of the product: ")
            item_list = dao.findProduct(selectProd)
            for item in item_list:
                print(item)

        elif userinput == "D":
            print("Here are all the transactions:")
            item_list = dao.list_all_transactions()

            for item in item_list:
                print(item)
        elif userinput == "E":
            dao.displayBarchartOfProductsSold()
        elif userinput == "F":
            dao.transactionReport()
        elif userinput == "G":
            exit()
        else:
            print("wrong input")


    else:
        print("NOT OK")
