require('dotenv').config();
const cors = require('cors');
const express = require('express');
const mongoose = require('mongoose');
const mongoString = process.env.DATABASE_URL;

mongoose.connect(mongoString);
const database = mongoose.connection;

database.on("error", (error) => {
    console.log("error connecting to server: " + error)
});
database.once("connected", () => {
    console.log("Database connected!")
});
const app = express();

app.use(express.json());
app.use(cors());
app.listen(3000, () => { //listen the connections on the host/port 3000
    console.log(`Server Started at ${3000}`)
})

