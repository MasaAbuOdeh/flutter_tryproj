const mongoose =require('mongoose');
const ratingSchema = require('./rating');
const commentSchema = require('./comment');
const orderSchema =require('./order');

const WorkerSchema =mongoose.Schema({
    email :{
        required: true,
        type: String,
        trim: true,
        validate: {
            validator: (value) => {
                const re = /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
                return value.match(re);
            },
            message: "Please enter a valid email address",
        },

    },

    name: {
        required:true,
        type: String,
        trim: true,
        
    },

    password: {
        required:true,
        type: String,
    },

    phone : {
        required : true,
        type : String,
    },

    type : {

        required : true,
        type : String,
    },

    discreption : {
        type: String,
       // required : true,
        trim :true,
    },

    images: [
        {
            type: String,
           // required: true,
        },
    ],
    
    price : {
        type : Number,
       // required: true,
    },
    location : {
        type : String,
    },
    ratings:[ratingSchema],

    comments:[commentSchema],

    latitude:{
        type :Number,
    },

    longitude : {
        type : Number,
    },

    statu:{
        type:String,
        default:'not_activate',
    },
    orders:[orderSchema]

});

const Worker = mongoose.model('Worker',WorkerSchema);
module.exports = Worker;