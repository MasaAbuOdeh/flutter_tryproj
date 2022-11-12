const express = require("express");
const Worker = require("../models/worker");

const bcryptjs = require('bcryptjs');
const jwt = require ("jsonwebtoken");

const WorkerauthRouter = express.Router();

WorkerauthRouter.post("/api/Workersignup", async (req, res) =>{
    const {email, name , password , phone , type}= req.body;
    try{
        const existingUser = await Worker.findOne({email});

        if(existingUser){
            return res.status(400).json({ msg:"User with same email already exists"});
        }

        const hashedPassword = await bcryptjs.hash(password, 8);

        let worker = new Worker({
            email,
            name,
            password : hashedPassword,
            phone,
            type,
        })
       worker= await worker.save();
        res.json(worker);
    } catch(e) {
        res.status(500).json({error: e.message});
    }

    
    });

    WorkerauthRouter.post("/api/Workersignin", async (req, res) => {
        try{
            const{email , password } = req.body;

            const worker = await Worker.findOne({ email });

            if(!worker){
                return res.status(400).json({msg : "User with this email does not exit !"});
            }

            const isMatch = await bcryptjs.compare(password, worker.password);

            if(!isMatch){
                return res.status(400).json({msg : "Incorrect password!"});
            }

            const token = jwt.sign({id: worker._id}, "passwordKey");

            res.json({token, ...worker._doc})

        } catch(e) {
            res.status(500).json({ error: e.message});
        }
    });




module.exports = WorkerauthRouter;