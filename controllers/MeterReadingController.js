function MeterReadingController(MeterReading) {
  function post(req, res) {
    const meterReading = new MeterReading(req.body);
    const d = new Date();
    const dformat = `${[d.getMonth() + 1,
      d.getDate(),
      d.getFullYear()].join('/')} ${
      [d.getHours(),
        d.getMinutes(),
        d.getSeconds()].join(':')}`;
    meterReading.date = dformat;
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
