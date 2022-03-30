function ordersController(Order) {
    // eslint-disable-next-line no-unused-vars
    function post(req, res) {
        const order = new Order(req.body);
        order.syncStatus = true;
        order.save();
        res.status(201);
        return res.json({
            statusCode: 201,
            message: 'Order saved',
            order,
        });
    }

    // eslint-disable-next-line no-unused-vars
    function get(req, res) {
        const query = {};
        if (req.query.genre) {
            query.genre = req.query.genre;
        }
        Order.find(query, (err, book) => {
            if (err) {
                return res.send(err);
            }
            return res.send(book);
        });
    }

    return {post, get};
}

module.exports = ordersController;
