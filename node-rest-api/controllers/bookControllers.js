
function booksController(Book) {
  // eslint-disable-next-line no-unused-vars
  function post(req, res) {
    const book = new Book(req.body);
    book.save();
    res.status(201);
    return res.json(book);
  }

  // eslint-disable-next-line no-unused-vars
  function get(req, res) {
    const query = {};
    if (req.query.genre) {
      query.genre = req.query.genre;
    }
    Book.find(query, (err, book) => {
      if (err) {
        return res.send(err);
      }
      return res.send(book);
    });
  }
  return { post, get };
}

module.exports = booksController;
