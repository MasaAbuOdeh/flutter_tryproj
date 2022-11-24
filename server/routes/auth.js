const express = require("express");
const User = require("../models/user");

const bcryptjs = require('bcryptjs');
const jwt = require ("jsonwebtoken");
const auth = require("../middlewares/auth");

const authRouter = express.Router();

authRouter.post("/api/signup", async (req, res) =>{
    const {email, name , password , phone }= req.body;
    try{
        const existingUser = await User.findOne({email});

        if(existingUser){
            return res.status(400).json({ msg:"User with same email already exists"});
        }

        const hashedPassword = await bcryptjs.hash(password, 8);

        let user = new User({
            email,
            name,
            password : hashedPassword,
            phone,
        })
        user= await user.save();
        res.json(user);
    } catch(e) {
        res.status(500).json({error: e.message});
    }

    
    });

    authRouter.post("/api/signin", async (req, res) => {
        try{
            const{email , password } = req.body;

            const user = await User.findOne({ email });

            if(!user){
                return res.status(400).json({msg : "User with this email does not exit !"});
            }

            const isMatch = await bcryptjs.compare(password, user.password);

            if(!isMatch){
                return res.status(400).json({msg : "Incorrect password!"});
            }

            const token = jwt.sign({id: user._id}, "passwordKey");

            res.json({token, ...user._doc})

        } catch(e) {
            res.status(500).json({ error: e.message});
        }
    });

    // get user data
authRouter.get("/", auth, async (req, res) => {
    const user = await User.findById(req.user);
    res.json({ ...user._doc, token: req.token });
  });




module.exports = authRouter;