const mongoose = require('mongoose');

module.exports = mongoose.model('Order', new mongoose.Schema({
  primaryKey: { type: Number },
  id: { type: String },
  customerName: { type: String },
  totalPrice: { type: Number },
  dateTime: { type: String },
  syncStatus: { type: Boolean, default: false },
}));
