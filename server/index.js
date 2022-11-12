const express = require("express");

const mongoose =require("mongoose");

const DB = "mongodb+srv://masa:masa0599@cluster0.ahke5pk.mongodb.net/?retryWrites=true&w=majority";

const authRouter = require("./routes/auth");
const WorkerauthRouter = require("./routes/Worker_auth");


const PORT = 3000;
const app = express();

app.use(express.json());
app.use(authRouter);
app.use(WorkerauthRouter);

mongoose.connect(DB).then(()=>{
    console.log("Connection successful");

})
.catch((e)=>{
    console.log(e);
});

app.listen(PORT,"0.0.0.0", ()=>{
    console.log(`connected at port ${PORT} `);
});