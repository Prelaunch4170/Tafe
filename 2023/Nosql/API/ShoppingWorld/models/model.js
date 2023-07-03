const { Double } = require('mongodb');
const mongoose = require('mongoose');

const customerSchema = new mongoose.Schema({
    customerID:{
        required: true,
        type: Number,
    },
    
    firstName:{
        required: true,
        type: String
    },
    lastName:{
        required: true,
        type: String
    },
    email:{
        required: false,
        type: String
    },
    annualSpend:{
        required: true,
        type: Number
    }
})

module.exports = mongoose.model('customers',customerSchema)