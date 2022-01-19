const mongoose = require('mongoose')

module.exports = mongoose.model('MeterReadings', new mongoose.Schema({
    meterNumber: {type: String},
    date: {type: String},
    reading: {type: Number},
    location: {type: String}
}));