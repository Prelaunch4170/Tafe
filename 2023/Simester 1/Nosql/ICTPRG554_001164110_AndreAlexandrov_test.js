
/*
Student Name: Andre Alexandrov
Student ID: 001164110
Date Written: 14/06/2023
*/
// task 1:
// task details: 
//Use insertOne() statement to insert the following data into the movies collection.
db.movies.insertOne({
  movieID: 1,
  movieName: "Eyes Wide Shut",
  releaseYear: 1999,
  boxOffice: 162.1,
  directorID: 1,
  country: "USA",
  starrings: [
    {
      sFName: "Tom",
      sLName: "Cruise"
    },
    {
      sFName: "Nicole",
      sLName: "Kidman"
    },
    {
      sFName: "Sydney",
      sLName: "Pollack"
    }
  ],
  producers: [
    {
      pFName: "Stanley",
      pLName: "Kubrick"
    }
  ]
})
//task 2:
//task details:
//Use insertMany() statement to insert the following data into the movies collection
db.movies.insertMany([{
  movieID: 2,
  movieName: "Michael Clayton",
  releaseYear: 2007,
  boxOffice: 93.0,
  directorID: 2,
  starrings: [
    {
      sFName: "George",
      sLName: "Clooney"
    },
    {
      sFName: "Sydney",
      sLName: "Pollack"
    }
  ],
  producers: [
    {
      pFName: "Sydney",
      pLName: "Pollack"
    },
    {
      pFName: "Jennifer",
      pLName: "Fox"
    }
  ]
}, {
  movieID: 3,
  movieName: "Far and Away",
  releaseYear: 1992,
  directorID: 3,
  country: "USA",
  starrings: [
    {
      sFName: "Tom",
      sLName: "Cruise"
    },
    {
      sFName: "Nicole",
      sLName: "Kidman"
    },
    {
      sFName: "Thomas",
      sLName: "Gibson"
    }
  ],
  producers: [
    {
      pFName: "Stanley",
      pLName: "Kubrick"
    },
    {
      pFName: "Ron",
      pLName: "Howard"
    }
  ]
}])

//task 3:
//task details:
//Use the directors collection, use insertMary() statement to insert the following data into the directors collection
db.director.insertMany([{
    directorID: 1,
    dFName: "Stanely",
    dLName: "Kubrick"
  },
  {
    directorID: 2,
    dFName: "Tony",
    dLName: "Gillroy"
  },
  {
    directorID: 3,
    dFName: "Ron",
    dLName: "Howard"
  },
  {
    directorID: 4,
    dFName: "Tarik",
    dLName: "Saleh"
  },
  {
    directorID: 5,
    dFName: "Elizabeth",
    dLName: "Allen"
  },
  {
    directorID:  6,
    dFName: "Alex",
    dLName: "Kurtzman"
  }
])

//task 3
//task details:
//Use findOne() statement to retrieve the movie information for the movie name as “Eyes Wide Shut”. 
//Do not show the starring sub-document in the output.

db.movies.findOne({"movieName": "Eyes Wide Shut"},{starrings:0})

//task 4
//task details:
// Use find() statement to retrieve the movie information for all movies
// release year earlier than year 2000. Display the documents in a easy-to-read format.
db.movies.find({releaseYear: {$lt: 2000}}).pretty()

//task 5
//task details:
//Use an update query statement to modify the movie document 
//for the movieID = 2 and change the boxOffice from 93.0 instead of 95.5

db.movies.updateOne({movieID: 2}, {$set: {boxOffice: 95.5}})

//task 6
//task details:
// Use an insertOne() statement to insert a new movie name with two extra data fields as shown in the following

db.movies.insertOne({
  movieID: 4,
  movieName: "The mummy",
  releaseYear: 2017,
  boxOffice: 410.0,
  budget: 190.0,
  language: "English",
  directorID: 6,
  country: "USA",
  starrings: [
    {
      sFName: "Tom",
      sLName: "Cruise"
    },
    {
      sFName: "Annabelle",
      sLName: "Wallis"
    }
  ],
  producers: [
    {
      pFName: "Alex",
      pLName: "Kurtzman"
    }
  ]
})
//Task 7. 
//Task Details
//Use an query statement to delete the specific document in the directors 
//collection where the director name is Tarik Saleh.

db.director.deleteOne({$and: [{dFName: "Tarik"}, {dLName: "Saleh"}]})

//Task 8
//task Details: 
//Use deleteMany() statement to delete multiple documents in the 
//directors collection where the directors id are either 5 or 6
db.director.deleteMany({$or: [{directorID: 5}, {directorID: 6}]})
//Task 9. 
//task details: 
//Use a query to show the movie information together with the director name 
//for each movie document. No need to show the starrings sub-document,
//the producers sub-document, nor the director id

db.movies.aggregate([{
  $lookup:
  {
    from: "director",
    localField: "directorID",
    foreignField: "directorID",
    as: "Movie_Directors"
  }
},
{
  $match: {
    Movie_Directors: {
      $ne: []
    }
  }
},{$unset: ["Movie_Directors.directorID","Movie_Directors._id", "producers", "starrings","directorID"]}
])