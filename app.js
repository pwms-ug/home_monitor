/* eslint-disable no-console */
const express = require('express');
const mongoose = require('mongoose');
const bodyParser = require('body-parser');
const Book = require('./models/bookModel');
const Order = require('./models/OrderModel');
const MeterReading = require('./models/MeterReadingModel');
const MeterReadingRouter = require('./routes/MeterReadingRouter')(MeterReading);
const OrderRouter = require('./routes/OrderRouter')(Order);
const bookRouter = require('./routes/bookRouter')(Book);

const app = express();
const port = process.env.PORT || 3000;
mongoose.connect('mongodb+srv://express_backend:express_backend@cluster0.wdx4a.mongodb.net/express_backend_v5?retryWrites=true&w=majority');
const db = mongoose.connection;

app.use(bodyParser.urlencoded({extended: true}));
app.use(bodyParser.json());

app.use('/api', bookRouter);
app.use('/api/orders', OrderRouter);
app.use('/api/meter_readings', MeterReadingRouter);
app.get('/', (req, res) => {
    res.send('Welcome to My Api');
});

db.on('error', (err) => {
    console.log('There was error');
    console.log(err);
});
db.once('open', () => {
    console.log('Connection Established');
});


app.listen(port, () => {
    // eslint-disable-next-line no-console
    console.log(`Running on port ${port}`);
});
