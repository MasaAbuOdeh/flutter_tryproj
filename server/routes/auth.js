const express = require("express");
const User = require("../models/user");
const Admin = require("../models/Admin");

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

    authRouter.post("/Admin/signup", async (req, res) =>{
        const {email, name , password , phone }= req.body;
        try{
            const existingUser = await Admin.findOne({email});
    
            if(existingUser){
                return res.status(400).json({ msg:"User with same email already exists"});
            }
    
            const hashedPassword = await bcryptjs.hash(password, 8);
    
            let admin = new Admin({
                email,
                 password : hashedPassword,
                
            })
            admin= await admin.save();
            res.json(admin);
        } catch(e) {
            res.status(500).json({error: e.message});
        }
    
        
        });


    authRouter.post("/Admin/signin", async (req, res) => {
      try{
          const{email , password } = req.body;

          const admin = await Admin.findOne({ email });

          if(!Admin){
              return res.status(400).json({msg : "Admin with this email does not exit !"});
          }

          const isMatch = await bcryptjs.compare(password, admin.password);

          if(!isMatch){
              return res.status(400).json({msg : "Incorrect password!"});
          }

          const token = jwt.sign({id: admin._id}, "passwordKey");

          res.json({token, ...admin._doc})

      } catch(e) {
          res.status(500).json({ error: e.message});
      }
  });

    authRouter.post("/tokenIsValid", async (req, res) => {
        try {
          const token = req.header("x-auth-token");
          if (!token) return res.json(false);
          const verified = jwt.verify(token, "passwordKey");
          if (!verified) return res.json(false);
      
          const user = await User.findById(verified.id);
          if (!user) return res.json(false);
          res.json(true);
        } catch (e) {
          res.status(500).json({ error: e.message });
        }
      });

    // get user data
authRouter.get("/", auth, async (req, res) => {
    const user = await User.findById(req.user);
    res.json({ ...user._doc, token: req.token });
  });

  authRouter.get("/user/all", async(req, res) => {
    try{
    const user = await User.find({statu:'activate'});
    res.json(user);
    }catch (e) {
      res.status(500).json({ error: e.message});
    }
  }) ;

  /// send noti info 
  

  authRouter.post("/api/send-Noti", async (req, res) =>{
    const { name , Notititle , Notibody}= req.body;
    let user = await User.findOne({name})
        
        user.Notititle=Notititle;
        user.Notibody=Notibody;
         user = await user.save();
         res.json(user);
  
    try{
  
    }catch(e) {
        res.status(500).json({ error: e.message });
      }
  });




module.exports = authRouter;