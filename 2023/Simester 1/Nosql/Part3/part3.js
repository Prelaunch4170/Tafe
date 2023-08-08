//tast1 A
//i

db.customers.aggregate([{
    $match: { customerID: 2 }
}, {
    $lookup: {
        from: "carts",
        localField: "customerID",
        foreignField: "customerID",
        as: "customer_cart"
    }
}
]
)

//ii
db.customers.createIndex({ customerID: 1 })
db.carts.createIndex({ customerID: 1 })
//Bi1
db.customers.find({ firstName: "John", lastName: "Brown" })
//Bi2
db.customers.createIndex({ firstName: 1, lastName: 1 })
//BII 1
db.carts.aggregate([
    {
        $match: {
            deliveryDate: { $lt: new ISODate() },
            delivieredOrNot: false
        }
    },
    {
        $lookup: {
            from: "items",
            localField: "cartItems.itemID",
            foreignField: "itemID",
            as: "cartItems"
        }
    }
])
//3
db.carts.createIndex({ deliveryDate: 1, delivieredOrNot: 1 })
//4
db.carts.getIndexes()
//C1
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
            _id: 0,
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
//C2
db.carts.createIndex({ cartDateTime: 1 })
db.items.createIndex({ itemID: 1 })

//Task 2
//a
db.createCollection("ttLogs", {
    validator: {
        $jsonSchema: {
            bsonType: "object",
            required: ["loggingDateTime", "transactionType", "logMessage"],
            properties: {
                loggingDateTime: {
                    bsonType: "date"
                },
                transactionType: {
                    bsonType: "string"
                },
                logMessage: {
                    bsonType: "string"
                }
            }
        }
    }
})
//B
db.ttLogs.createIndex({ loggingDateTime: 1 }, { expireAfterSeconds: 180 })
//C
db.ttLogs.insertOne({
    loggingDateTime: new Date(),
    transactionType: "insert",
    logMessage: "inserted document into cart collection"
})
db.ttLogs.find()
//task3
db.createUser({
    user: "userAdmin",
    pwd: "Password1",
    roles: [
        "userAdminAnyDatabase",
        "readWriteAnyDatabase",
        "dbAdminAnyDatabase"
    ]
})
//B
db.createUser({
    user: "JimBrown",
    pwd: "Password1",
    roles: [
        {
            role: "read",
            db: "ShoppingCartDB"
        }
    ]
})
//C
db.suppliers.findOne({ supplierName: "Garden Grower" })
//D
db.suppliers.updateOne({ supplierName: "Garden Grower" },
    {
        $set: {
            contactPhoneNo: '08-27788888'
        }
    })
//task 4
//B
sh.enableSharding("shoppingCartDB")
//C
db.carts.createIndex({ customerID: "hashed" })
sh.shardCollection("shoppingCardDB", { customerID: "hashed" })
sh.carts.getShardDistribution()
//D
for (var i= 1; i <= 500; i++) 
{
    db.carts.insertOne(
        {
            "cartID": "cartID" + i,
            "cartdateTime": new Date(),
            "customerID": "customerID" + i,
            "cart_Items": [{
                "itemID": 2,
                "qtyOrdered": 2
            }]
        }
    )
}
//E
sh.carts.getShardDistribution()



//task 5
db.updateUser(
    "userAdmin",
    {roles: [
        { role: 'dbAdminAnyDatabase', db: 'admin' },
        { role: 'readWriteAnyDatabase', db: 'admin' },
        { role: 'userAdminAnyDatabase', db: 'admin' },
        {role: 'clusterAdmin', db: 'admin'}
      ]}
)
mongotop 1 --username userAdmin --authenticationDatabase admin
//task 5 B
db.createCollection("perftrans")
for (var i= 1; i <= 100000; i++) 
{
    db.perftrans.insertOne(
        { "transactionID": "writing-" + i,
            "transactionName": "bulk write",
             "sysDateTime": new Date(),
            "tranaction amount": Math.random() * i}
    )
}
//f
db.perftrans.find({$or:[{transactionID: "writing-80000"},{transactionID: "writing-20000"}]})
//g
db.setProfilingLevel(1,{filter: {op: "query", millis:{ $gt: 2000 }}})