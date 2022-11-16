const express = require("express");
const Worker = require("../models/worker");

const businessInfoRouter = express.Router();

businessInfoRouter.post("/api/send-info", async (req, res) =>{
    const {name, discreption , images , price , location}= req.body;
    let worker = await Worker.findOne({name})
        
         worker.discreption=discreption;
         worker.images=images;
         worker.price=price;
         worker.location=location;
         worker = await worker.save();
         res.json(worker);

    try{

    }catch(e) {
        res.status(500).json({ error: e.message });
      }
});




module.exports = businessInfoRouter;