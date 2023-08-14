use('shoppingCartDB')
db.createCollection("customer")
db.createCollection("carts")
db.createCollection("items")
db.createCollection("suppliers")

//Task 3 A
db.customers.insertOne({
    customerID: 1,
    firstName: "John",
    lastName: "Brown",
    email: "jbrown100@yahoo.com",
    annualSpend: 100.00,
    interest: {
        interestName: ["Furniture", "Elexctrical"]
    },
    address: [{
        addressType: 'Business',
        street: '1st Street',
        city: 'Adelaide',
        postcode: '5000',
        state: 'SA',
        country: 'Australia'
    }],
    phone: [{
        phoneNumber: '0427788128',
        phoneType: 'Personal'
    }]
})

db.customers.insertOne({
    customerID: 2,
    firstName: "Jack",
    lastName: "White",
    email: "jwhite200@yahoo.com",
    annualSpend: 200.00,
    interest: {
        interestName: ["Gardening", "Electronic", "Furniture"]
    },
    address: [{
        addressType: "Personal",
        street: '2nd Street',
        city: 'Melbourne',
        postcode: '3001',
        state: 'VIC',
        country: 'Australia'
    }, {
        addressType: 'Postal',
        street: 'Box 300 Richmond Post Office',
        city: 'Richmond',
        postcode: '3121',
        state: 'VIC',
        country: 'Australia'
    }],
    phone: [{
        phoneNumber: '0414237921',
        phoneType: 'Personal'
    }, {
        phoneNumber: '08-81091122',
        phoneType: 'Business'
    }]
})


db.customers.insertOne({
    customerID: 3,
    firstName: "Jill ",
    lastName: "Black",
    email: "jblack300@yahoo.com",
    annualSpend: 300.00,
    interest: {
        interestName: []
    },
    address: [{
        addressType: 'Personal',
        street: '5 High street',
        city: 'Belair',
        postcode: '5052',
        state: 'SA',
        country: 'Australia'
    }, {
        addressType: 'Postal',
        street: 'Box 400 Blackwood Post Office',
        city: 'Blackwood',
        postcode: '5051',
        state: 'SA',
        country: 'Australia'
    }, {
        addressType: 'Business',
        street: '10 Main Street',
        city: 'Blackwood',
        postcode: '5051',
        state: 'SA',
        country: 'Australia'
    }],
    phone: [{
        phoneNumber: '08-85678888',
        phoneType: 'Business'
    }]
})

//Task 3 B 

db.items.insertMany([
    {
        itemID: 1,
        itemName: "Slow release fertiliser 20kg",
        price: 40.00,
        qtyOnHand: 10,
        supplierID: 1
    }, {
        itemID: 2,
        itemName: "Organic fertiliser 20kg",
        price: 50.00,
        qtyOnHand: 20,
        supplierID: 1
    }, {
        itemID: 3,
        itemName: "METHOD wall cabinet",
        price: 400.00,
        qtyOnHand: 30,
        supplierID: 2
    }, {
        itemID: 4,
        itemName: "Applaro outdoor sofa set",
        price: 1500.00,
        qtyOnHand: 40,
        supplierID: 2
    }
])

//Task 3 C

db.carts.insertOne({
    cartID: 1,
    cartDateTime: ISODate("2022-02-20 12:00:00"),
    deliveryInsructions: "Deliver to business address",
    delivieredOrNot: true,
    deliveryDate: ISODate("2022-02-22"),
    ratingFromCustomer: 5,
    customerID: 1,
    cartItems: [{
        itemID: 1,
        qtyOrdered: 2
    }, {
        itemID: 2,
        qtyOrdered: 3
    }]
})
db.carts.insertOne({
    cartID: 2,
    cartDateTime: ISODate("2022-02-20 14:30:00"),
    deliveryInsructions: "Deliver to personal address",
    delivieredOrNot: true,
    deliveryDate: ISODate("2022-02-23"),
    ratingFromCustomer: 4,
    customerID: 2,
    cartItems: [{
        itemID: 3,
        qtyOrdered: 1
    }, {
        itemID: 4,
        qtyOrdered: 1
    }, {
        itemID: 1,
        qtyOrdered: 3
    }]
})
db.carts.insertOne({
    cartID: 3,
    cartDateTime: ISODate("2022-02-22 16:00:00"),
    deliveryInsructions: null,
    delivieredOrNot: false,
    deliveryDate: null,
    ratingFromCustomer: null,
    customerID: 2,
    cartItems: [{
        itemID: 1,
        qtyOrdered: 4
    }]
})
db.carts.insertOne({
    cartID: 4,
    cartDateTime: ISODate("2022-02-23 09:30:00"),
    deliveryInsructions: "Deliver to delivery address",
    delivieredOrNot: false,
    deliveryDate: null,
    ratingFromCustomer: null,
    customerID: 3,
    cartItems: [{
        itemID: 2,
        qtyOrdered: 2
    }]
})

//Task 3 D

db.suppliers.insertOne(
    {
        supplierID: 1,
        supplierName: "Garden Grower",
        email: "business@gardensuppliers.com.au",
        contactPhoneNo: "08-27732420",
        supplierAddress: [{
            addressType: 'Business',
            street: '1 King Street',
            city: 'Adelaide',
            postcode: '5000',
            state: 'SA',
            country: 'Australia'
        }, {
            addressType: 'Postal',
            street: 'Box 100 Grote Street Mail Center',
            city: 'Adelaide',
            postcode: '5000',
            state: 'SA',
            country: 'Australia'
        }]
    }
)
db.suppliers.insertOne(
    {
        supplierID: 2,
        supplierName: "Home Improvement",
        email: "office@homeimprovement.com.au",
        contactPhoneNo: "08-82544665",
        supplierAddress: [{
            addressType: 'Business',
            street: '2 Queen Street',
            city: 'Melbourne',
            postcode: '3000',
            state: 'VIC',
            country: 'Australia'
        }, {
            addressType: 'Postal',
            street: 'Box 200 Bourke Street Post Office',
            city: 'Melbourne',
            postcode: '3000',
            state: 'VIC',
            country: 'Australia'
        }]
    }
)
// Task 4 A
db.customers.find()
// Task 4 B
db.suppliers.aggregate([
    {
        $match: {
            supplierID: 2
        }
    },
    {
        $lookup: {
            from: "items",
            localField: "supplierID",
            foreignField: "supplierID",
            as: "items"
        }
    },
    {
        $project: {
            supplierName: 1,
            email: 1,
            contactPhoneNo: 1,
            items: {
                itemID: 1,
                itemName: 1,
                price: 1,
                qtyOnHand: 1
            },
            _id: 0
        }
    }
])

// Task 4 C
db.carts.aggregate([
    {
        $match: {
            cartDateTime: ISODate("2022-02-20 14:30:00")
        }
    },
    {
        $lookup: {
            from: "items",
            localField: "cartItems.itemID",
            foreignField: "itemID",
            as: "cartItems"
        }
    },
    {
        $unwind: "$cartItems"
    },
    {
        $project: {
            _id: 1,
            cartDateTime: 1,
            deliveryInsructions: 1,
            delivieredOrNot: 1,
            deliveryDate: 1,
            customerID: 1,
            "cartitems.itemName": 1,
            "cartitems.price": 1,
            "cartitems.qtyOnHand": 1
        }
    }
])
//Task 5 
use shoppingcartDB2

db.createCollection("customers", {
    validator: {
        $jsonSchema: {
            bsonType: 'object',
            required: [
                'customerID',
                'annualSpend',
                'interest',
                'address',
                'phone'
            ],
            properties: {
                email: {
                    bsonType: ["string", "null"],
                    description: "must be string and longer than 1 character, or null",
                    minLength: 1,
                },
                firstName: {
                    bsonType: ["string", "null"],
                    description: "must be string and longer than 1 character, or null",
                    minLength: 1,
                },
                lastName: {
                    bsonType: ["string", "null"],
                    description: "must be string and longer than 1 character, or null",
                    minLength: 1,
                },
                customerID: {
                    bsonType: 'int',
                    description: 'customer ID must be an int and is required'
                },
                annualSpend: {
                    bsonType: [
                        'double',
                        'int'
                    ],
                    minimum: 0,
                    description: 'annual spend must be an int or double and zero or greater, and is required'
                },
                interest: {
                    bsonType: 'object',
                    description: 'interest must be an object',
                    required: [
                        'interestName'
                    ],
                    properties: {
                        interestName: {
                            bsonType: 'array',
                            description: 'interest Name must be an array',
                            items: {
                                bsonType: ['string', "null"]
                            }
                        }
                    }
                },
                address: {
                    bsonType: [
                        'array'
                    ],
                    items: {
                        bsonType: 'object',
                        required: ["addressType", "street", "city", "postcode", "state", "country"],
                        properties: {
                            addressType: {
                                bsonType: 'string',
                                enum: ["Postal", "Delivery", "Business", "Personal"],
                                description: 'address type must be string and required and be "Postal", "Delivery", "Business", or "Personal"'
                            },
                            street: {
                                bsonType: 'string',
                                description: 'street must be string and required'
                            },
                            city: {
                                bsonType: 'string',
                                description: 'city must be string and required'
                            },
                            postcode: {
                                bsonType: 'string',
                                description: 'postcode must be string and required'
                            },
                            state: {
                                bsonType: 'string',
                                description: 'state must be string and required'
                            },
                            country: {
                                bsonType: 'string',
                                description: 'country must be string and required'
                            }
                        }
                    }
                },
                phone: {
                    bsonType: 'array',
                    items: {
                        bsonType: 'object',
                        properties: {
                            phoneNumber: {
                                bsonType: 'string',
                                description: 'phone Number must be string and required'
                            },
                            phoneType: {
                                bsonType: 'string',
                                description: 'phone Type must be string and required'
                            }
                        }
                    }
                }
            }
        }
    }
})
//Task 5b
//no Email
db.customers.insertOne({
    customerID: 1,
    firstName: "John",
    lastName: "Brown",
    email: "",
    annualSpend: 100.00,
    interest: {
        interestName: ["Furniture", "Elexctrical"]
    },
    address: [{
        addressType: 'Business',
        street: '1st Street',
        city: 'Adelaide',
        postcode: '5000',
        state: 'SA',
        country: 'Australia'
    }],
    phone: [{
        phoneNumber: '0427788128',
        phoneType: 'Personal'
    }]
})
//not within enum
db.customers.insertOne({
    customerID: 1,
    firstName: "John",
    lastName: "Brown",
    email: "jbrown100@yahoo.com",
    annualSpend: 100.00,
    interest: {
        interestName: ["Furniture", "Elexctrical"]
    },
    address: [{
        addressType: 'Home',
        street: '1st Street',
        city: 'Adelaide',
        postcode: '5000',
        state: 'SA',
        country: 'Australia'
    }],
    phone: [{
        phoneNumber: '0427788128',
        phoneType: 'Personal'
    }]
})
//annual spend negative
db.customers.insertOne({

    customerID: 1,
    firstName: "John",
    lastName: "Brown",
    email: "jbrown100@yahoo.com",
    annualSpend: -100.00,
    interest: {
        interestName: ["Furniture", "Elexctrical"]
    },
    address: [{
        addressType: 'Business',
        street: '1st Street',
        city: 'Adelaide',
        postcode: '5000',
        state: 'SA',
        country: 'Australia'
    }],
    phone: [{
        phoneNumber: '0427788128',
        phoneType: 'Personal'
    }]
})
//Task6 A
db.customers.insertOne({
    customerID: 10,
    companyName: "City Shopper Co. Ltd",
    website: "cityshopper.com.au",
    registeredDate: ISODate("2022-05-01 00:00:00"),
    annualSpend: 0.00,
    interest: {
        interestName: ["gardening", "tools", null]
    },
    address: [{
        addressType: "Business",
        street: "1 First Street",
        city: "Adelaide",
        postcode: "5000",
        state: "SA",
        country: "Australia"
    }],
    phone: [{
        phoneType: "Business",
        phoneNumber: "08-82778888"
    }]
})
db.customers.insertOne({
    customerID: 11,
    companyName: "Country Shopper Co. Ltd",
    companyType: "Hardware retailer",
    registeredDate: ISODate("2022-05-01 00:00:00"),
    annualSpend: 100.00,
    interest: {
        interestName: ["power tools", "kitchenware"]
    },
    address: [{
        addressType: "Business",
        street: "2 Second Street",
        city: "Adelaide",
        postcode: "5000",
        state: "SA ",
        country: "Australia"
    }],
    phone: [{
        phoneType: "Business ",
        phoneNumber: "08-82774444 "
    }]
})
//Task 6b
db.customers.find({
    companyName: "City Shopper Co. Ltd"
})

//Task 7A
db.customers.updateOne({ companyName: "City Shopper Co. Ltd" }, {
    $set:
    {
        website: "suppershopper.com.au"
    }
})
//Task 7B
db.customers.updateOne({ "address.postcode": "5000" }, {
    $set:
    {
        registeredDate: ISODate("2022-05-15 17:00:00")
    }
})
//task 7C
db.customers.deleteOne({
    companyName: "City Shopper Co. Ltd"
})
//task 7D
db.customers.deleteMany({
    "registeredDate": {
        $gte: ISODate("2022-05-01T00:00:00.000Z"),
        $lte: ISODate("2022-05-16T00:00:00.000Z")
    }
})