const express = require("express")
const OrderController = require("../controllers/OrderCotrollers")

function MeterReadingRoutes(Order) {
    const orderRouter = express.Router()
    const orderController = OrderController(Order)

    orderRouter.route('/')
        .get(orderController.get)
        .post(orderController.post)

    orderRouter.use('/:id', (req, res, next) => {
        Order.findById(req.params.id, (error, order) => {
            if (error) {
                return res.send(error)
            }

            if (order) {
                req.readings = order
                return next()
            }

            return res.sendStatus(404)
        })
    })
    return orderRouter
}

module.exports = MeterReadingRoutes
