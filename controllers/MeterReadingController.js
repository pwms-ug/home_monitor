const dateFormat = require('dateformat');

function MeterReadingController(MeterReading) {
  function post(req, res) {
    const meterReading = new MeterReading(req.body);
    meterReading.date = dateFormat(Date, 'isoDateTime');
    meterReading.location = 'Kyengera';
    meterReading.save();
    res.status(201);
    return res.json(meterReading);
  }

  function get(req, res) {
    const query = {};
    if (req.query.meterNumber) {
      query.meterNumber = req.query.meterNumber;
    }

    MeterReading.find(query, (error, meterReading) => {
      if (error) {
        return res.send(error);
      }
      return res.send(meterReading);
    });
  }

  return { post, get };
}

module.exports = MeterReadingController;
