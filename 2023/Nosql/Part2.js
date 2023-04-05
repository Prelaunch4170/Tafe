use shoppingCartDB

db.createCollection("Customer")

db.createCollection("Cart")
db.createCollection("Items")
db.createCollection("Supplier")


db.customer.insertOne({
    CustomerID: "John",
    firstName: "Brown",
    email: "jbrown100@yahoo.com",
    annualSpend: 100.00,
    intrest:{
        intrestName: ["Furniture","Elexctrical"]
    },
    address: {
        addressType:'Business', 
        street: '1st Street', 
        city: 'Adelaide', 
        postcode:'5000', 
        state: 'SA', 
        country: 'Australia'
    },
    phone:{
        phoneNumber: '0427788128', 
        phoneType: 'Personal'
    }
})