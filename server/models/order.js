const mongoose = require("mongoose");

const orderSchema = mongoose.Schema({
  userId: {
    type: String,
    required: true,
  },
  date: {
    type: String,
    required: true,
  },
  from:{
    type: String,
    required: true,
  },
  to:{
    type: String,
    required: true,
  },
  username:{
    type: String,
    required :true,
  },
  userphone:{
    type: String,
    required :true,
  },
  status:{
    type: Number,
    default: 0,
  }
});

module.exports = orderSchema;