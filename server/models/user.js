const mongoose =require('mongoose');

const userSchema =mongoose.Schema({
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

    statu:{
        type:String,
        default:'activate',
    },
    Notititle:{
          type:String,
          default:''

    },
    Notibody:{
        type:String,
        default:''
    }


});

const User = mongoose.model('User',userSchema);
module.exports = User;