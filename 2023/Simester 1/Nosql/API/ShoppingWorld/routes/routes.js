const express = require('express');
const model = require('../models/model');
const router = express.Router();

router.get('/getAll',async(req, res) => {
    try{
        const customers = await model.find();
        res.json(customers)
    }catch(error){
        res.status(500).json({message: error.message})
    }
})
router.get('/getOne/:id',async(req, res) =>{
    
    try{
        const customer = await model.findById(req.params.id);
        res.json(customer)
    }catch(error){
        res.status(500).json({message: error.message})
    }
})
router.post('/post', async(req, res) =>{
    
    const customer = new model({
        customerID: req.body.customerID,
        firstName: req.body.firstName,
        lastName: req.body.lastName,
        email: req.body.email,
        annualSpend: req.body.annualSpend
    })
    try{
        const dataToSave = await customer.save();
        res.status(200).json(dataToSave)
    }catch(error){
        var myMessage = error.message
        res.status(400).json({message: myMessage})
    }
})
router.patch('/update/:id',async(req, res) =>{
    const id = req.params.id
    const customer = await model.findById(id)
    const payload = req.body;
    if(!customer){
        res.status(500).json({message: error.message})
    }else{
        if(payload.firstName !== undefined){
            customer.firstName = payload.firstName
        }
        if(payload.lastName !== undefined){
            customer.lastName = payload.lastName
        }
        if(payload.email !== undefined){
            customer.email = payload.email
        }
        if(payload.annualSpend !== undefined){
            customer.annualSpend = payload.annualSpend
        }
        try{
            const dataToSave = await customer.save();
            res.status(200).json(dataToSave)
        }catch(error){
            res.status(400).json({message: error.message})
        }
    }
    

})
router.delete('/delete/:id',async(req, res) =>{
    try{
        const id = req.params.id;
        const customer = await model.findByIdAndDelete(id);
        res.json({message: "customer " + id +" was deleted"})
    }catch(error){
        res.status(500).json({message: error.message})
    }
})


module.exports = router;