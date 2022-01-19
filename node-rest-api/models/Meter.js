const mongoose = require('mongoose')

module.exports = mongoose.model('Meter', new mongoose.Schema({
    name: {type: String},
    location: {type: String},
    date: {type: String}
}));