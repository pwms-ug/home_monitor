const mongoose = require('mongoose');

module.exports = mongoose.model('book', new mongoose.Schema({
  title: { type: String },
  author: { type: String },
  genre: { type: String },
  read: { type: Boolean, default: false },
}));
