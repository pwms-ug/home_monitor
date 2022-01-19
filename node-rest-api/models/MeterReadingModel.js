const mongoose = require('mongoose')

module.exports = mongoose.model('MeterReading', new mongoose.Schema({
    meterNumber: {type: String},
    date: {type: String},
    reading: {type: String},
    location: {type: String}
}));