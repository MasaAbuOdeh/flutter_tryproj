const mongoose =require('mongoose');
const AdminSchema =mongoose.Schema({
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

    password: {
        required:true,
        type: String,
    },

});
const Admin = mongoose.model('Admin',AdminSchema);
module.exports = Admin;