const express = require("express");
const Worker = require("../models/worker");
const Comment= require("../models/comment");

const bcryptjs = require('bcryptjs');
const jwt = require ("jsonwebtoken");
const auth = require("../middlewares/auth");

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
///get all halls
    WorkerauthRouter.get("/business/get-halls", async(req, res) => {
        try{
        const worker = await Worker.find({type: 'halls'});
        res.json(worker);
        }catch (e) {
          res.status(500).json({ error: e.message});
        }
      }) ;

      ///get halls by the nablus 
    WorkerauthRouter.get("/business/get-Nablus", async(req, res) => {
      try{
      const worker = await Worker.find({type: 'halls',location:'Nablus'});
      res.json(worker);
      }catch (e) {
        res.status(500).json({ error: e.message});
      }
    }) ;

    ///get halls by the nablus 
    WorkerauthRouter.get("/business/get-Tulkarem", async(req, res) => {
      try{
      const worker = await Worker.find({type: 'halls',location:'Tulkarem'});
      res.json(worker);
      }catch (e) {
        res.status(500).json({ error: e.message});
      }
    }) ;


      ///get all band group
    WorkerauthRouter.get("/business/get-band", async(req, res) => {
      try{
      const worker = await Worker.find({type: 'Band group'});
      res.json(worker);
      }catch (e) {
        res.status(500).json({ error: e.message});
      }
    }) ;

      WorkerauthRouter.post("/api/rate-Worker", auth, async (req, res) => {
        try {
          const { id, rating } = req.body;
          let worker = await Worker.findById(id);
      
          for (let i = 0; i < worker.ratings.length; i++) {
            if (worker.ratings[i].userId == req.user) {
              worker.ratings.splice(i, 1);
              break;
            }
          }
      
          const ratingSchema = {
            userId: req.user,
            rating,
          };
      
          worker.ratings.push(ratingSchema);
          worker = await worker.save();
          res.json(worker);
        } catch (e) {
          res.status(500).json({ error: e.message });
        }
      });

      WorkerauthRouter.post("/api/comment-Worker", auth, async (req, res) => {
        try {
          const { id, comment ,username } = req.body;
          let worker = await Worker.findById(id);
      
          for (let i = 0; i < worker.comments.length; i++) {
            if (worker.comments[i].userId == req.user) {
              worker.comments.splice(i, 1);
              break;
            }
          }
      
          const commentSchema = {
            userId: req.user,
            comment,
            username: username,
          };
      
          worker.comments.push(commentSchema);
          worker = await worker.save();
          res.json(worker);
        } catch (e) {
          res.status(500).json({ error: e.message });
        }
      });

    

      WorkerauthRouter.get("/business/search/:name", auth, async (req, res) => {
        try {
          const worker = await Worker.find({
            name: req.params.name,
          });
         
          res.json(worker);
        } catch (e) {
          res.status(500).json({ error: e.message });
        }
      });

      /////show all comments

      WorkerauthRouter.get("/business/searchh/:name", async (req, res) => {
         try {
          const worker = await Worker.find({
            name: req.params.name,
          });
        
          res.json(worker);
        } catch (e) {
          res.status(500).json({ error: e.message });
        }
      });

      // Delete the product
      WorkerauthRouter.post("/admin/delete-product", async (req, res) => {
  try {
    const { id } = req.body;
    let worker = await Worker.findByIdAndDelete(id);
    res.json(worker);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

///get all workers
WorkerauthRouter.get("/business/all", async(req, res) => {
  try{
  const worker = await Worker.find({statu:'not_activate'});
  res.json(worker);
  }catch (e) {
    res.status(500).json({ error: e.message});
  }
}) ;




module.exports = WorkerauthRouter;