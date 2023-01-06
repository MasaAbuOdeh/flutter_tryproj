const express = require("express");
const Worker = require("../models/worker");
const User = require('../models/user');

const businessInfoRouter = express.Router();

businessInfoRouter.post("/api/send-info", async (req, res) =>{
    const {name, discreption , images , price , location , latitude , longitude}= req.body;
    let worker = await Worker.findOne({name})
        
         worker.discreption=discreption;
         worker.images=images;
         worker.price=price;
         worker.location=location;
         worker.latitude=latitude;
         worker.longitude=longitude;
         worker = await worker.save();
         res.json(worker);

    try{

    }catch(e) {
        res.status(500).json({ error: e.message });
      }
});

//activate user
businessInfoRouter.post("/api/activate_user", async (req, res) =>{
  const {name,statu}= req.body;
  let user = await User.findOne({name})
      
       user.statu=statu;
       
       user = await user.save();
       res.json(user);

  try{

  }catch(e) {
      res.status(500).json({ error: e.message });
    }
});

businessInfoRouter.post("/api/activate_worker", async (req, res) =>{
  const {name,statu}= req.body;
  let worker = await Worker.findOne({name})
      
       worker.statu=statu;
       
       worker = await worker.save();
       res.json(worker);

  try{

  }catch(e) {
      res.status(500).json({ error: e.message });
    }
});




module.exports = businessInfoRouter;