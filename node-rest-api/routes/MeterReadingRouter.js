const express = require("express")
const MeterReadingController = require("../controllers/MeterReadingController")

function MeterReadingRoutes(MeterReading) {
    const meterReadingRouter = express.Router()
    const meterReadingController = MeterReadingController(MeterReading)

    meterReadingRouter.route('/readings')
        .get(meterReadingController.get)
        .post(meterReadingController.post)

    meterReadingRouter.use('/readings/:id', (req, res, next) => {
        MeterReading.findById(req.params.id, (error, meterReading) => {
            if (error) {
                return res.send(error)
            }

            if (meterReading) {
                req.readings = meterReading
                return next()
            }

            return res.sendStatus(404)
        })
    })
    return meterReadingRouter
}

module.exports = MeterReadingRoutes