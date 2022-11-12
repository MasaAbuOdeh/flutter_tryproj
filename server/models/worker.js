const mongoose =require('mongoose');

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
});

const Worker = mongoose.model('Worker',WorkerSchema);
module.exports = Worker;